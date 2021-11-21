package com.geoland.kfis.web.action.hrm.payroll;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.EmployeeSalary;
import com.geoland.kfis.model.EmployeeSalaryPayroll;
import com.geoland.kfis.model.EmployeeSalaryPayrollAdjustment;
import com.geoland.kfis.model.EmployeeSalaryTaxRates;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.BaseActionSupport;
import com.geoland.kfis.web.action.hrm.salary.SalaryCalculationStep;
import com.geoland.kfis.web.action.hrm.salary.SalaryCalculationType;

/**
 * 
 * Class PayrollBaseAction
 * 
 * @author BEKIM BAJRAKTARI
 * @created 14.04.2020
 * @Version 1.0
 */
public class PayrollBaseAction extends BaseActionSupport {

	private static final long serialVersionUID = 1L;

	protected Long adjustmentId;
	protected Long payrollId;
	protected Long salaryId;
	protected Long employeeId;
	protected Employee employee;
	protected EmployeeSalaryPayroll payroll;
	protected EmployeeSalary salary;

	protected EmployeeSalaryPayrollAdjustment adjustment;
	protected List<EmployeeSalaryPayrollAdjustment> adjustments;
	protected SalaryCalculationType[] calculationTypes = SalaryCalculationType.values();
	protected SalaryCalculationStep[] calculationSteps = SalaryCalculationStep.values();
	
	protected void loadPayroll(Long payrollId) {
		if(payrollId != null){
			payroll = DAOFactory.getFactory().getEmployeeSalaryPayrollDAO().get(payrollId);
			salary = payroll.getEmployeeSalary();
			adjustments = new ArrayList<EmployeeSalaryPayrollAdjustment>();
			adjustments = DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().getEmployeeSalaryPayrollAdjustments(payroll.getId());
		}		
	}
	
	
	protected void cal(Long payrollId) {
		EmployeeSalaryPayroll esp = DAOFactory.getFactory().getEmployeeSalaryPayrollDAO().get(payrollId);
		BigDecimal basicsalary = esp.getEmployeeSalary().getBasicsalary();
		BigDecimal grosssalary = esp.getEmployeeSalary().getGrosssalary();
		if(grosssalary==null) {
			grosssalary = basicsalary.divide(new BigDecimal(12), BigDecimal.ROUND_UP);
			System.out.println("BigDecimal.ROUND_FLOOR:\t" + basicsalary.divide(new BigDecimal(12.0), BigDecimal.ROUND_FLOOR) );
			System.out.println("BigDecimal.ROUND_HALF_UP:\t" + basicsalary.divide(new BigDecimal(12.0), BigDecimal.ROUND_HALF_UP) );
			System.out.println("BigDecimal.ROUND_CEILING:\t" + basicsalary.divide(new BigDecimal(12.0), BigDecimal.ROUND_CEILING) );
			System.out.println("BigDecimal.ROUND_UP:\t" + basicsalary.divide(new BigDecimal(12.0), BigDecimal.ROUND_UP) );
		}
		
		
		/*
		 * 
		STEPS
		1. ONGRO (ADD, SUB) --calculation on gross
		2. BFTAX (SUB, NOP)	--calculation before tax
		3. ONTAX (NOP)		--calculation of tax based on tax norms
		4. AFTAX (ADD, SUB)	--calculation after tax
		5. ONNET (ADD, SUB)	--calculation on tax
		6. FINET (NOP)		--final net payment result saving in database

		OPERATION 
		1. ADD
		2. SUB
		3. NOP
		*/
		
		
		//STEP 1: ONGRO (ADD, SUB) --calculation on gross
		BigDecimal ongro = ONGRO(esp, grosssalary);
		
		//STEP 2: BFTAX (SUB, NOP)	--calculation before tax
		BigDecimal bftax = BFTAX(esp, ongro, SalaryCalculationType.NOP);
		bftax = BFTAX(esp, ongro, SalaryCalculationType.SUB);
		
		String employee = esp.getEmployee().getFirstName() + " " + esp.getEmployee().getLastName();
		System.out.println("\n");
		System.out.println(employee);
		System.out.println("salary for tax:\t"+grosssalary);
		
		BigDecimal taxpay = getTaxValue(bftax);
		
		//SEP 3: ONTAX (NOP)		--calculation of tax based on tax norms
		taxpay = ONTAX(esp, taxpay);
		BigDecimal netpayaftertax = bftax.subtract(taxpay);
		System.out.println("netpay afer tax:\t"+netpayaftertax);

		
		//STEP 4: AFTAX (ADD, SUB)	--calculation after tax
		BigDecimal aftax = AFTAX(esp, netpayaftertax);
		System.out.println("aftax:\t"+aftax);
		
		//STEP 5: ONNET (ADD, SUB)	--calculation on tax
		BigDecimal netpay = ONNET(esp, aftax);
		System.out.println("onnet:\t"+netpay);
		
		//STEP 6: FINET (NOP)		--final net payment result saving in database
		FINET(esp, netpay);
		

		esp.setGrosspay(grosssalary);
		esp.setNetpay(netpay);
		esp.setTaxpay(taxpay);
		esp.setSalarymonth(grosssalary);

		String query = "select sum(grosspay) as grosspay from thrm_employee_salary_payroll where " +
		"employee_id = " + esp.getEmployee().getId() + " and fiscal_year = "  + esp.getFiscalYear();
		List<?> view = DAOFactory.getFactory().getEmployeeSalaryPayrollDAO().getDataView(new String[]{"grosspay"}, new String[]{"STRING"}, query);
		if(view!=null && view.size() == 1){
			Object object = view.get(0);
			if(object != null && !object.equals("null")) {
				BigDecimal salaryyear = new BigDecimal(object.toString());
				esp.setSalaryyear(salaryyear);
			}else {
				esp.setSalaryyear(grosssalary);	
			}
		}else {
			esp.setSalaryyear(grosssalary);
		}		
		
		esp.setStatus(PayrollStatus.CAL.name());
		
		System.out.println("grosssalary:\t"+ grosssalary);
		System.out.println("netpay:\t"+ netpay);
		System.out.println("taxpay:\t"+ taxpay);
		
		//save ESP
		DAOFactory.getFactory().getEmployeeSalaryPayrollDAO().save(esp);	
		
	}	
	

	
	/**
	 * STEP 1. 
	 * ONGRO (ADD, SUB) --calculation on gross
	 * 
	 * @param esp
	 * @param salaryValue
	 * @return
	 */
	protected BigDecimal ONGRO(EmployeeSalaryPayroll esp, BigDecimal salaryValue) {
		Set<EmployeeSalaryPayrollAdjustment> espas = esp.getEmployeeSalaryPayrollAdjustments();
		for (EmployeeSalaryPayrollAdjustment adj : espas) {
			BigDecimal amountPercentage = adj.getAmountPercentage();
			BigDecimal amount = adj.getAmount();
			
			if(SalaryCalculationStep.ONGRO.name().equals(adj.getAmountType())) { 
				
				if(SalaryCalculationType.SUB.name().equals(adj.getCalculationType())) { //SUB
					if(amountPercentage!=null) {
						BigDecimal value = salaryValue.multiply(amountPercentage);
						salaryValue = salaryValue.subtract(value);
						adj.setAmount(value);
						DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().save(adj);						
					}else {
						salaryValue = salaryValue.subtract(amount);
					}
				}else if(SalaryCalculationType.ADD.name().equals(adj.getCalculationType())) { //ADD
					if(amountPercentage!=null) {
						BigDecimal value = salaryValue.multiply(amountPercentage);
						salaryValue = salaryValue.add(value);
						adj.setAmount(value);
						DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().save(adj);						
					}else {
						salaryValue = salaryValue.add(amount);
					}
				}
				
			}
		}	
		
		return salaryValue;
	}
	
	/**
	 * STEP 2 
	 * BFTAX (SUB, NOP)	--calculation before tax
	 * 
	 * @param esp
	 * @param salaryValue
	 * @return
	 */
	protected BigDecimal BFTAX(EmployeeSalaryPayroll esp, BigDecimal salaryValue, SalaryCalculationType ctype) {
		Set<EmployeeSalaryPayrollAdjustment> espas = esp.getEmployeeSalaryPayrollAdjustments();
		for (EmployeeSalaryPayrollAdjustment adj : espas) {
			BigDecimal amountPercentage = adj.getAmountPercentage();
			BigDecimal amount = adj.getAmount();
			
			if(SalaryCalculationStep.BFTAX.name().equals(adj.getAmountType())) { 
				
				//SUB
				if(ctype.name().equals(SalaryCalculationType.SUB.name()) &&
						SalaryCalculationType.SUB.name().equals(adj.getCalculationType())) { 
					if(amountPercentage!=null) {
						BigDecimal value = salaryValue.multiply(amountPercentage);
						salaryValue = salaryValue.subtract(value);
						adj.setAmount(value);
						DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().save(adj);						
					}else {
						salaryValue = salaryValue.subtract(amount);
					}
				
				//NOP	
				}else if(ctype.name().equals(SalaryCalculationType.NOP.name()) &&
					SalaryCalculationType.NOP.name().equals(adj.getCalculationType())) { 
					if(amountPercentage!=null) {
						BigDecimal value = salaryValue.multiply(amountPercentage);
						adj.setAmount(value);
						DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().save(adj);
						System.out.println("BFTAX "+ ", salaryValue:" + salaryValue + ", value%:" + value);
					}else {
						salaryValue = salaryValue.add(amount);
					}
				}
				
			}
		}	
		
		return salaryValue;
	}
	

	/**
	 * STEP 3
	 * ONTAX (NOP)		--calculation of tax based on tax norms
	 * 
	 * @param esp
	 * @param salaryValue
	 * @return
	 */
	protected BigDecimal ONTAX(EmployeeSalaryPayroll esp, BigDecimal salaryValue) {
		Set<EmployeeSalaryPayrollAdjustment> espas = esp.getEmployeeSalaryPayrollAdjustments();
		for (EmployeeSalaryPayrollAdjustment adj : espas) {
			
			if(SalaryCalculationStep.ONTAX.name().equals(adj.getAmountType())) { 
				
				if(SalaryCalculationType.NOP.name().equals(adj.getCalculationType())) { //NOP
					adj.setAmount(salaryValue);
					DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().save(adj);
				}
			}
		}	
		
		return salaryValue;
	}
	
	/**
	 * STEP 4
	 * AFTAX (ADD, SUB)	--calculation after tax
	 *  
	 * @param esp
	 * @param salaryValue
	 * @return
	 */
	protected BigDecimal AFTAX(EmployeeSalaryPayroll esp, BigDecimal salaryValue) {
		Set<EmployeeSalaryPayrollAdjustment> espas = esp.getEmployeeSalaryPayrollAdjustments();
		for (EmployeeSalaryPayrollAdjustment adj : espas) {
			BigDecimal amountPercentage = adj.getAmountPercentage();
			BigDecimal amount = adj.getAmount();
			
			if(SalaryCalculationStep.AFTAX.name().equals(adj.getAmountType())) { 
				
				if(SalaryCalculationType.SUB.name().equals(adj.getCalculationType())) { //SUB
					if(amountPercentage!=null) {
						BigDecimal value = salaryValue.multiply(amountPercentage);
						salaryValue = salaryValue.subtract(value);
						adj.setAmount(value);
						DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().save(adj);						
					}else {
						salaryValue = salaryValue.subtract(amount);
					}
				}else if(SalaryCalculationType.ADD.name().equals(adj.getCalculationType())) { //ADD
					if(amountPercentage!=null) {
						BigDecimal value = salaryValue.multiply(amountPercentage);
						salaryValue = salaryValue.add(value);
						adj.setAmount(value);
						DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().save(adj);						
					}else {
						salaryValue = salaryValue.add(amount);
					}
				}
				
			}
		}	
		
		return salaryValue;
	}	
	
	
	
	/**
	 * STEP 5 
	 * 
	 * ONNET (ADD, SUB)	--calculation on tax
	 * 
	 * @param esp
	 * @param salaryValue
	 * @return
	 */
	protected BigDecimal ONNET(EmployeeSalaryPayroll esp, BigDecimal salaryValue) {
		Set<EmployeeSalaryPayrollAdjustment> espas = esp.getEmployeeSalaryPayrollAdjustments();
		for (EmployeeSalaryPayrollAdjustment adj : espas) {
			BigDecimal amountPercentage = adj.getAmountPercentage();
			BigDecimal amount = adj.getAmount();
			
			if(SalaryCalculationStep.ONNET.name().equals(adj.getAmountType())) { 
				
				if(SalaryCalculationType.SUB.name().equals(adj.getCalculationType())) { //SUB
					if(amountPercentage!=null) {
						BigDecimal value = salaryValue.multiply(amountPercentage);
						salaryValue = salaryValue.subtract(value);
						adj.setAmount(value);
						DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().save(adj);						
					}else {
						salaryValue = salaryValue.subtract(amount);
					}
				}else if(SalaryCalculationType.ADD.name().equals(adj.getCalculationType())) { //ADD
					if(amountPercentage!=null) {
						BigDecimal value = salaryValue.multiply(amountPercentage);
						salaryValue = salaryValue.add(value);
						adj.setAmount(value);
						DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().save(adj);						
					}else {
						salaryValue = salaryValue.add(amount);
					}
				}
				
			}
		}	
		
		return salaryValue;
	}		
	
	/**
	 * FINET
	 * 
	 * @param esp
	 * @param salaryValue
	 * @return
	 */
	protected BigDecimal FINET(EmployeeSalaryPayroll esp, BigDecimal salaryValue) {
		Set<EmployeeSalaryPayrollAdjustment> espas = esp.getEmployeeSalaryPayrollAdjustments();
		for (EmployeeSalaryPayrollAdjustment adj : espas) {
			
			if(SalaryCalculationStep.FINET.name().equals(adj.getAmountType())) { 
				
				if(SalaryCalculationType.NOP.name().equals(adj.getCalculationType())) { //NOP
					adj.setAmount(salaryValue);
					DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().save(adj);						
				}
				
			}
		}	
		
		return salaryValue;
	}	
	
	/**
	 * getGrossCalculatedValue
	 * 
	 * @param esp EmployeeSalaryPayroll
	 * @param amountType i.e B=Gross or N=Net
	 * @return BigDecimal
	 */
	protected BigDecimal getGrossCalculatedValue(EmployeeSalaryPayroll esp, BigDecimal grossValue) {
		Set<EmployeeSalaryPayrollAdjustment> espas = esp.getEmployeeSalaryPayrollAdjustments();
		for (EmployeeSalaryPayrollAdjustment adj : espas) {
			BigDecimal amountPercentage = adj.getAmountPercentage();
			BigDecimal amount = adj.getAmount();
			
			System.out.println("FinancialType:" + adj.getFinancialType().getCode() + " - " + adj.getFinancialType().getNameAl() + ", amountPercentage:" + amountPercentage + 
					", amount:" + amount);
			
			if(SalaryCalculationType.SUB.name().equals(adj.getCalculationType())) { //Deduction
				if(adj.getAmountType().equalsIgnoreCase("B")) {
					if(amountPercentage!=null) {
						BigDecimal value = grossValue.multiply(amountPercentage);
						grossValue = grossValue.subtract(value);
						adj.setAmount(value);
						DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().save(adj);						
					}else {
						grossValue = grossValue.subtract(amount);
					}
				}
			}else if(SalaryCalculationType.ADD.name().equals(adj.getCalculationType())) { //Adds
				if(adj.getAmountType().equalsIgnoreCase("B")) {
					if(amountPercentage!=null) {
						BigDecimal value = grossValue.multiply(amountPercentage);
						grossValue = grossValue.add(value);
						adj.setAmount(value);
						DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().save(adj);						
					}else {
						grossValue = grossValue.add(amount);
					}
				}					
			}
		}	
		
		return grossValue;
	}
	

	protected BigDecimal getGrossAddsValue(EmployeeSalaryPayroll esp, BigDecimal grossValue) {
		Set<EmployeeSalaryPayrollAdjustment> espas = esp.getEmployeeSalaryPayrollAdjustments();
		for (EmployeeSalaryPayrollAdjustment adj : espas) {
			BigDecimal amountPercentage = adj.getAmountPercentage();
			BigDecimal amount = adj.getAmount();
			
			if(SalaryCalculationType.ADD.name().equals(adj.getCalculationType())) { //Adds
				if(adj.getAmountType().equalsIgnoreCase("B")) {
					if(amountPercentage!=null) {
						BigDecimal value = grossValue.multiply(amountPercentage);
						grossValue = grossValue.add(value);
						adj.setAmount(value);
						DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().save(adj);						
					}else {
						grossValue = grossValue.add(amount);
					}
				}					
			}
		}	
		
		return grossValue;
	}
	
	protected BigDecimal getGrossSubsValue(EmployeeSalaryPayroll esp, BigDecimal grossValue) {
		Set<EmployeeSalaryPayrollAdjustment> espas = esp.getEmployeeSalaryPayrollAdjustments();
		for (EmployeeSalaryPayrollAdjustment adj : espas) {
			BigDecimal amountPercentage = adj.getAmountPercentage();
			BigDecimal amount = adj.getAmount();
			
			if(SalaryCalculationType.SUB.name().equals(adj.getCalculationType())) { //Deduction
				if(adj.getAmountType().equalsIgnoreCase("B")) {
					if(amountPercentage!=null) {
						BigDecimal value = grossValue.multiply(amountPercentage);
						grossValue = grossValue.subtract(value);
						adj.setAmount(value);
						DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().save(adj);						
					}else {
						grossValue = grossValue.subtract(amount);
					}
				}
			}
		}	
		
		return grossValue;
	}	
	
	protected BigDecimal getTaxValue(BigDecimal grosssalary) {
//		System.out.println("\n");
//		System.out.println("grosssalary:\t"+grosssalary);
//		System.out.println("---------------------------");
//		System.out.println("\n");
		
		BigDecimal taxValue = new BigDecimal(0.0);
		List<EmployeeSalaryTaxRates> taxRates = DAOFactory.getFactory().getEmployeeSalaryTaxRatesDAO().getAll();
		for (EmployeeSalaryTaxRates tr : taxRates) {
//			System.out.println("tax rate:\t"+tr.getStartAmount().doubleValue() + " - " + tr.getEndAmount().doubleValue());
			
			if(grosssalary.doubleValue() > tr.getEndAmount().doubleValue()) {
				BigDecimal subtract = tr.getEndAmount().subtract(tr.getStartAmount());
//				System.out.println("subtract:\t"+subtract);
				BigDecimal multiply = subtract.multiply(tr.getPercentage());
//				System.out.println("multiply:\t"+ multiply);
				taxValue = taxValue.add(multiply);
			}else if(grosssalary.doubleValue() < tr.getStartAmount().doubleValue()) {
				BigDecimal multiply = grosssalary.multiply(new BigDecimal(0.0));
//				System.out.println("grosssalary multiply 1:\t"+ multiply);
				taxValue = taxValue.add(multiply);					
			}else{
				grosssalary = grosssalary.subtract(tr.getStartAmount());
//				System.out.println("grosssalary subtract:\t"+grosssalary);
				BigDecimal multiply = grosssalary.multiply(tr.getPercentage());
//				System.out.println("grosssalary multiply 2:\t"+ multiply);
				taxValue = taxValue.add(multiply);
			}
			
//			System.out.println("\n");
		}
//		System.out.println("**********SUM:\t"+taxValue);
		
		return taxValue;
	}
	
	protected EmployeeSalaryTaxRates getTaxRate(BigDecimal grosssalary) {
		EmployeeSalaryTaxRates taxRate = null;
		List<EmployeeSalaryTaxRates> taxRates = DAOFactory.getFactory().getEmployeeSalaryTaxRatesDAO().getAll();
		for (EmployeeSalaryTaxRates tr : taxRates) {
			System.out.println(tr.getStartAmount().doubleValue() + " - " + tr.getEndAmount().doubleValue());
			if((grosssalary.doubleValue() >= tr.getStartAmount().doubleValue() &&  
					grosssalary.doubleValue() < tr.getEndAmount().doubleValue() )
					||
					0.0 == tr.getEndAmount().doubleValue()
				) {
				return tr;
			}
		}
		
		return taxRate;
	}	
	
	public Long getPayrollId() {
		return payrollId;
	}
	public void setPayrollId(Long payrollId) {
		this.payrollId = payrollId;
	}
	public Long getSalaryId() {
		return salaryId;
	}
	public void setSalaryId(Long salaryId) {
		this.salaryId = salaryId;
	}
	public Long getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Long employeeId) {
		this.employeeId = employeeId;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public EmployeeSalaryPayroll getPayroll() {
		return payroll;
	}
	public void setPayroll(EmployeeSalaryPayroll payroll) {
		this.payroll = payroll;
	}
	public EmployeeSalary getSalary() {
		return salary;
	}
	public void setSalary(EmployeeSalary salary) {
		this.salary = salary;
	}
	public EmployeeSalaryPayrollAdjustment getAdjustment() {
		return adjustment;
	}
	public void setAdjustment(EmployeeSalaryPayrollAdjustment adjustment) {
		this.adjustment = adjustment;
	}
	public List<EmployeeSalaryPayrollAdjustment> getAdjustments() {
		return adjustments;
	}
	public void setAdjustments(List<EmployeeSalaryPayrollAdjustment> adjustments) {
		this.adjustments = adjustments;
	}
	public void setAdjustmentId(Long adjustmentId) {
		this.adjustmentId = adjustmentId;
	}
	public Long getAdjustmentId() {
		return adjustmentId;
	}

	public void setCalculationTypes(SalaryCalculationType[] calculationTypes) {
		this.calculationTypes = calculationTypes;
	}
	
	public SalaryCalculationType[] getCalculationTypes() {
		return calculationTypes;
	}

	public void setCalculationSteps(SalaryCalculationStep[] calculationSteps) {
		this.calculationSteps = calculationSteps;
	}
	
	public SalaryCalculationStep[] getCalculationSteps() {
		return calculationSteps;
	}

}
