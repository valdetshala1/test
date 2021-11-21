package com.geoland.kfis.web.action.hrm.salary;

/**
 * 
 * Class SalaryCalculationStep
 * 
 * 1. ONGRO (ADD, SUB) --calc on gross
 * 2. BFTAX (SUB, NOP)	--calc befor tax
 * 3. ONTAX (NOP)		--calc of tax based on tax norms
 * 4. AFTAX (ADD, SUB)	--calc after tax
 * 5. ONNET (ADD, SUB)	--calc on tax
 * 
 * @author BEKIM BAJRAKTARI
 * @created 11.06.2020 20:21:15
 * @Version 1.0
 */
public enum SalaryCalculationStep {
	ONGRO (SalaryCalculationType.ADD, SalaryCalculationType.SUB),
	BFTAX (SalaryCalculationType.SUB, SalaryCalculationType.NOP),
	ONTAX (SalaryCalculationType.NOP),
	AFTAX (SalaryCalculationType.ADD, SalaryCalculationType.SUB),
	ONNET (SalaryCalculationType.ADD, SalaryCalculationType.SUB),
	FINET (SalaryCalculationType.NOP);

	private SalaryCalculationType[] type;
	
	private SalaryCalculationStep(SalaryCalculationType... type) {
		this.type = type;
	}
	
	
	public String items() {
		StringBuilder bui = new StringBuilder();
		for (int i = 0; i < type.length; i++) {
			SalaryCalculationType ctype = type[i];
			bui.append(ctype);
			if(i < type.length-1) bui.append(",");
		}
		return bui.toString();
	}
    
    
	public static void main(String[] args) {
		 System.out.println("All SalaryCalculationStep types");
	        for (SalaryCalculationStep type : SalaryCalculationStep.values()) {
	            System.out.println(type);
	            for (SalaryCalculationType ctype : type.type) {
	            	System.out.println("\t-->"+ctype);	
				}
	            System.out.println();
	        }
	        System.out.println("All SalaryCalculationType");
	        for (SalaryCalculationType type : SalaryCalculationType.values()) {
	        	System.out.println(type);
	        }		
	}
}
	