package com.geoland.kfis.persistence.hibernate;

import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.*;


/**
 * 
 * Class HibernateDAOFactory
 * @author BEKIM BAJRAKTARI
 * @created 14.04.2020 22:23:39
 * @Version 1.0
 * 
 * Returns Hibernate-specific instances of DAOs.
 * <p/>
 * If for a particular DAO there is no additional non-CRUD functionality, we use
 * a nested static class to implement the interface in a generic way. This
 * allows clean refactoring later on, should the interface implement business
 * data access methods at some later time. Then, we would externalize the
 * implementation into its own first-level class.
 *
 */
public class HibernateDAOFactory extends DAOFactory {

	/** The log. */
	private static Log log = LogFactory.getLog(HibernateDAOFactory.class);
	
	/** The map. */
	@SuppressWarnings("rawtypes")
	private HashMap<String, GenericDAO> map = new HashMap<String, GenericDAO>();

	/**
	 * Instantiate DAO.
	 *
	 * @param daoClass the dao class
	 * @return the generic DAO
	 */
	@SuppressWarnings({ "rawtypes" })	
	private GenericDAO instantiateDAO(Class daoClass) {
		GenericDAO retDAO;
		try {
			log.debug("Instantiating DAO: " + daoClass);
			if(map.get(daoClass.getName())!=null){
				retDAO = map.get(daoClass.getName());
			}else{
				retDAO = (GenericDAO) daoClass.newInstance();
				map.put(daoClass.getName(), retDAO);
				//return (GenericDAO) daoClass.newInstance();	
			}
			return retDAO;	
			
		} catch (Exception ex) {
			throw new RuntimeException("Can not instantiate DAO: " + daoClass,
					ex);
		}
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getOrganisationDAO()
	 */
	@Override
	public OrganisationDAO getOrganisationDAO() {
		return (OrganisationDAO) instantiateDAO(OrganisationDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPartyDAO()
	 */
	@Override
	public PartyDAO getPartyDAO() {
		return (PartyDAO) instantiateDAO(PartyDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPersonDAO()
	 */
	@Override
	public PersonDAO getPersonDAO() {
		return (PersonDAO) instantiateDAO(PersonDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getEmployeeDAO()
	 */
	@Override
	public EmployeeDAO getEmployeeDAO() {
		return (EmployeeDAO) instantiateDAO(EmployeeDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getAddressDAO()
	 */
	@Override
	public AddressDAO getAddressDAO() {
		return (AddressDAO) instantiateDAO(AddressDAO.class);
	}


	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getOfficialTravelDAO()
	 */
	@Override
	public OfficialTravelDAO getOfficialTravelDAO() {
		return (OfficialTravelDAO) instantiateDAO(OfficialTravelDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getLeaveDAO()
	 */
	@Override
	public LeaveDAO getLeaveDAO() {
		return (LeaveDAO) instantiateDAO(LeaveDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getLeaveTypeDAO()
	 */
	@Override
	public LeaveTypeDAO getLeaveTypeDAO() {
		return (LeaveTypeDAO) instantiateDAO(LeaveTypeDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getAttendanceRecordDAO()
	 */
	@Override
	public AttendanceRecordDAO getAttendanceRecordDAO() {
		return (AttendanceRecordDAO) instantiateDAO(AttendanceRecordDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getLeaveEntitlementDAO()
	 */
	@Override
	public LeaveEntitlementDAO getLeaveEntitlementDAO() {
		return (LeaveEntitlementDAO) instantiateDAO(LeaveEntitlementDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getEmployeeLanguageDAO()
	 */
	@Override
	public EmployeeLanguageDAO getEmployeeLanguageDAO() {
		return (EmployeeLanguageDAO) instantiateDAO(EmployeeLanguageDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getLanguageDAO()
	 */
	@Override
	public LanguageDAO getLanguageDAO() {
		return (LanguageDAO) instantiateDAO(LanguageDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getEmployeeSkillDAO()
	 */
	@Override
	public EmployeeSkillDAO getEmployeeSkillDAO() {
		return (EmployeeSkillDAO) instantiateDAO(EmployeeSkillDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDomainDAO()
	 */
	@Override
	public DomainDAO getDomainDAO() {
		return (DomainDAO) instantiateDAO(DomainDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getTextDomainDAO()
	 */
	@Override
	public TextDomainDAO getTextDomainDAO() {
		return (TextDomainDAO) instantiateDAO(TextDomainDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getVehicleStaffAssignDAO()
	 */
	@Override
	public VehicleStaffAssignDAO getVehicleStaffAssignDAO() {
		return (VehicleStaffAssignDAO) instantiateDAO(VehicleStaffAssignDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getVehicleDAO()
	 */
	@Override
	public VehicleDAO getVehicleDAO() {
		return (VehicleDAO) instantiateDAO(VehicleDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getVehicleRegisterDAO()
	 */
	@Override
	public VehicleRegisterDAO getVehicleRegisterDAO() {
		return (VehicleRegisterDAO) instantiateDAO(VehicleRegisterDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getVehicleServiceMaintenanceDAO()
	 */
	@Override
	public VehicleServiceMaintenanceDAO getVehicleServiceMaintenanceDAO() {
		return (VehicleServiceMaintenanceDAO) instantiateDAO(VehicleServiceMaintenanceDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getAssetsDAO()
	 */
	@Override
	public AssetsDAO getAssetsDAO() {
		return (AssetsDAO) instantiateDAO(AssetsDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getAssetsStaffAssignDAO()
	 */
	@Override
	public AssetsStaffAssignDAO getAssetsStaffAssignDAO() {
		return (AssetsStaffAssignDAO) instantiateDAO(AssetsStaffAssignDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getAssetsDevaluationDAO()
	 */
	@Override
	public AssetsDevaluationDAO getAssetsDevaluationDAO() {
		return (AssetsDevaluationDAO) instantiateDAO(AssetsDevaluationDAO.class);
	}
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getEmployeeDocumentDAO
	 */
	@Override
	public EmployeeDocumentDAO getEmployeeDocumentDAO() {
		return (EmployeeDocumentDAO) instantiateDAO(EmployeeDocumentDAO.class);
	}
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getLawSuitDAO
	 */
	@Override
	public LawSuitDAO getLawSuitDAO() {
		return (LawSuitDAO) instantiateDAO(LawSuitDAO.class);
	}
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getLawsuitDamageDAO
	 */
	@Override
	public LawSuitDamageDAO getLawsuitDamageDAO() {
		return (LawSuitDamageDAO) instantiateDAO(LawSuitDamageDAO.class);
	}
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getLawsuitStatusDAO
	 */
	@Override
	public LawSuitStatusDAO getLawsuitStatusDAO() {
		return (LawSuitStatusDAO) instantiateDAO(LawSuitStatusDAO.class);
	}
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getFuelConsumDAO()
	 */
	@Override
	public FuelConsumDAO getFuelConsumDAO() {
		return (FuelConsumDAO) instantiateDAO(FuelConsumDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getCadastralMunicipalityDAO()
	 */
	@Override
	public CadastralMunicipalityDAO getCadastralMunicipalityDAO() {
		return (CadastralMunicipalityDAO) instantiateDAO(CadastralMunicipalityDAO.class);
	}
	
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getEmployeeSosContactDAO()
	 */
	@Override
	public EmployeeSosContactDAO getEmployeeSosContactDAO() {
		return (EmployeeSosContactDAO) instantiateDAO(EmployeeSosContactDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPartyUserDAO()
	 */
	@Override
	public PartyUserDAO getPartyUserDAO() {
		return (PartyUserDAO) instantiateDAO(PartyUserDAO.class);
	}
		
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getFinancialInputDAO()
	 */
	@Override
	public FinancialInputDAO getFinancialInputDAO() {
		return (FinancialInputDAO) instantiateDAO(FinancialInputDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getFinancialTypeDAO()
	 */
	@Override
	public FinancialTypeDAO getFinancialTypeDAO() {
		return (FinancialTypeDAO) instantiateDAO(FinancialTypeDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getFinancialOutputDAO()
	 */
	@Override
	public FinancialOutputDAO getFinancialOutputDAO() {
		return (FinancialOutputDAO) instantiateDAO(FinancialOutputDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getContractorDAO()
	 */
	@Override
	public ContractorDAO getContractorDAO() {
		return (ContractorDAO) instantiateDAO(ContractorDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getContractDAO()
	 */
	@Override
	public ContractDAO getContractDAO() {
		return (ContractDAO) instantiateDAO(ContractDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getAnnuBudgetAllocationDAO()
	 */
	@Override
	public AnnuBudgetAllocationDAO getAnnuBudgetAllocationDAO() {
		return (AnnuBudgetAllocationDAO) instantiateDAO(AnnuBudgetAllocationDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPaymentPeriodDAO()
	 */
	@Override
	public PaymentPeriodDAO getPaymentPeriodDAO() {
		return (PaymentPeriodDAO) instantiateDAO(PaymentPeriodDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getBudgetMainntenanceDAO()
	 */
	@Override
	public BudgetMainntenanceDAO getBudgetMainntenanceDAO() {
		return (BudgetMainntenanceDAO) instantiateDAO(BudgetMainntenanceDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getFiskosDataDAO()
	 */
	@Override
	public FiskosDataDAO getFiskosDataDAO() {
		return (FiskosDataDAO) instantiateDAO(FiskosDataDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDhpetAnimalCapacityDAO()
	 */
	@Override
	public DhpetAnimalCapacityDAO getDhpetAnimalCapacityDAO() {
		return (DhpetAnimalCapacityDAO) instantiateDAO(DhpetAnimalCapacityDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDhpetLocationDAO()
	 */
	@Override
	public DhpetLocationDAO getDhpetLocationDAO() {
		return (DhpetLocationDAO) instantiateDAO(DhpetLocationDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPrcmtTenderRequestDAO()
	 */
	@Override
	public PrcmtTenderRequestDAO getPrcmtTenderRequestDAO() {
		return (PrcmtTenderRequestDAO) instantiateDAO(PrcmtTenderRequestDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPrcmtTenderStatusDAO()
	 */
	@Override
	public PrcmtTenderStatusDAO getPrcmtTenderStatusDAO() {
		return (PrcmtTenderStatusDAO) instantiateDAO(PrcmtTenderStatusDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPrcmtTenderBidderDAO()
	 */
	@Override
	public PrcmtTenderBidderDAO getPrcmtTenderBidderDAO() {
		return (PrcmtTenderBidderDAO) instantiateDAO(PrcmtTenderBidderDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPrcmtTenderBidDAO()
	 */
	@Override
	public PrcmtTenderBidDAO getPrcmtTenderBidDAO() {
		return (PrcmtTenderBidDAO) instantiateDAO(PrcmtTenderBidDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDhpetHuntGroundEvalDAO()
	 */
	@Override
	public DhpetHuntGroundEvalDAO getDhpetHuntGroundEvalDAO() {
		return (DhpetHuntGroundEvalDAO) instantiateDAO(DhpetHuntGroundEvalDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDhpetWildAnimalsDAO()
	 */
	@Override
	public DhpetWildAnimalsDAO getDhpetWildAnimalsDAO() {
		return (DhpetWildAnimalsDAO) instantiateDAO(DhpetWildAnimalsDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPrcmtDossierRequestDAO()
	 */
	@Override
	public PrcmtDossierRequestDAO getPrcmtDossierRequestDAO() {
		return (PrcmtDossierRequestDAO) instantiateDAO(PrcmtDossierRequestDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPrcmtDossierQuestionDAO()
	 */
	@Override
	public PrcmtDossierQuestionDAO getPrcmtDossierQuestionDAO() {
		return (PrcmtDossierQuestionDAO) instantiateDAO(PrcmtDossierQuestionDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getCompartmentDAO()
	 */
	@Override
	public CompartmentDAO getCompartmentDAO() {
		return (CompartmentDAO) instantiateDAO(CompartmentDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getStandDAO()
	 */
	@Override
	public StandDAO getStandDAO() {
		return (StandDAO) instantiateDAO(StandDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPrcmtTenderAttachDAO()
	 */
	public PrcmtTenderAttachDAO getPrcmtTenderAttachDAO() {
		return (PrcmtTenderAttachDAO) instantiateDAO(PrcmtTenderAttachDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getManagementUnitDAO()
	 */
	@Override
	public ManagementUnitDAO getManagementUnitDAO() {
		return (ManagementUnitDAO) instantiateDAO(ManagementUnitDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getAnnualPlanningDAO()
	 */
	@Override
	public AnnualPlanningDAO getAnnualPlanningDAO() {
		return (AnnualPlanningDAO) instantiateDAO(AnnualPlanningDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getAnnualPlanningStatusDAO()
	 */
	@Override
	public AnnualPlanningStatusDAO getAnnualPlanningStatusDAO() {
		return (AnnualPlanningStatusDAO) instantiateDAO(AnnualPlanningStatusDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getStandHarvestActivityDAO()
	 */
	@Override
	public StandHarvestActivityDAO getStandHarvestActivityDAO() {
		return (StandHarvestActivityDAO) instantiateDAO(StandHarvestActivityDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getActivityDAO()
	 */
	@Override
	public ActivityDAO getActivityDAO() {
		return (ActivityDAO) instantiateDAO(ActivityDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getActivityStatusDAO()
	 */
	@Override
	public ActivityStatusDAO getActivityStatusDAO() {
		return (ActivityStatusDAO) instantiateDAO(ActivityStatusDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getFrmDomainDAO()
	 */
	@Override
	public FrmDomainDAO getFrmDomainDAO() {
		return (FrmDomainDAO) instantiateDAO(FrmDomainDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getTreeSpeciesDAO()
	 */
	@Override
	public TreeSpeciesDAO getTreeSpeciesDAO() {
		return (TreeSpeciesDAO) instantiateDAO(TreeSpeciesDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getStandSilvicultureActivityDAO()
	 */
	@Override
	public StandSilvicultureActivityDAO getStandSilvicultureActivityDAO() {
		return (StandSilvicultureActivityDAO) instantiateDAO(StandSilvicultureActivityDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getStandPlantingActivityDAO()
	 */
	@Override
	public StandPlantingActivityDAO getStandPlantingActivityDAO() {
		return (StandPlantingActivityDAO) instantiateDAO(StandPlantingActivityDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getSeedActivityDAO()
	 */
	@Override
	public SeedActivityDAO getSeedActivityDAO() {
		return (SeedActivityDAO) instantiateDAO(SeedActivityDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getActivityDomainDAO()
	 */
	@Override
	public ActivityDomainDAO getActivityDomainDAO() {
		return (ActivityDomainDAO) instantiateDAO(ActivityDomainDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getRoadActivityDAO()
	 */
	@Override 
	public  RoadActivityDAO getRoadActivityDAO(){
		 return (RoadActivityDAO) instantiateDAO(RoadActivityDAO.class);
	 }
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getProtectionActivityDAO()
	 */
	@Override 
	public  ProtectionActivityDAO getProtectionActivityDAO(){
		 return (ProtectionActivityDAO) instantiateDAO(ProtectionActivityDAO.class);
	 }
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getUnitsMetricDAO()
	 */
	@Override 
	public  UnitsMetricDAO getUnitsMetricDAO(){
		 return (UnitsMetricDAO) instantiateDAO(UnitsMetricDAO.class);
	 }

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getRoadDAO()
	 */
	@Override
	public RoadDAO getRoadDAO() {
		return (RoadDAO) instantiateDAO(RoadDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getOrganisationMunDAO()
	 */
	@Override
	public OrganisationMunDAO getOrganisationMunDAO() {
		return (OrganisationMunDAO) instantiateDAO(OrganisationMunDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPrivateRequestDAO()
	 */
	@Override
	public PrivateRequestDAO getPrivateRequestDAO() {
		return (PrivateRequestDAO) instantiateDAO(PrivateRequestDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPrivateRequestImplDAO()
	 */
	@Override
	public PrivateRequestImplDAO getPrivateRequestImplDAO() {
		return (PrivateRequestImplDAO) instantiateDAO(PrivateRequestImplDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getCadastralZoneDAO()
	 */
	@Override
	public CadastralZoneDAO getCadastralZoneDAO() {
		return (CadastralZoneDAO) instantiateDAO(CadastralZoneDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getContractDocDAO()
	 */
	@Override
	public ContractDocDAO getContractDocDAO() {
		return (ContractDocDAO) instantiateDAO(ContractDocDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPrcmtTenderComplaintDAO()
	 */
	@Override
	public PrcmtTenderComplaintDAO getPrcmtTenderComplaintDAO() {
		return (PrcmtTenderComplaintDAO) instantiateDAO(PrcmtTenderComplaintDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPrcmtTenderStatusDocDAO()
	 */
	@Override
	public PrcmtTenderStatusDocDAO getPrcmtTenderStatusDocDAO() {
		return (PrcmtTenderStatusDocDAO) instantiateDAO(PrcmtTenderStatusDocDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getRegionDAO()
	 */
	@Override
	public RegionDAO getRegionDAO() {
		return (RegionDAO) instantiateDAO(RegionDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPrivateActivityDAO()
	 */
	@Override
	public  PrivateActivityDAO getPrivateActivityDAO(){
		return (PrivateActivityDAO) instantiateDAO(PrivateActivityDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPrivateRequestDocDAO()
	 */
	@Override
	public PrivateRequestDocDAO getPrivateRequestDocDAO() {
		return (PrivateRequestDocDAO) instantiateDAO(PrivateRequestDocDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getActivityStatusDocDAO()
	 */
	@Override
	public ActivityStatusDocDAO getActivityStatusDocDAO() {
		return (ActivityStatusDocDAO) instantiateDAO(ActivityStatusDocDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getEstimateVolumeDAO()
	 */
	@Override
	public EstimateVolumeDAO getEstimateVolumeDAO() {
		return (EstimateVolumeDAO) instantiateDAO(EstimateVolumeDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getStandGrowthDAO()
	 */
	@Override
	public StandGrowthDAO getStandGrowthDAO() {
		return (StandGrowthDAO) instantiateDAO(StandGrowthDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPartyRoleDAO()
	 */
	@Override
	public PartyRoleDAO getPartyRoleDAO() {
		return (PartyRoleDAO) instantiateDAO(PartyRoleDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDpMngmtDAO()
	 */
	@Override
	public DpMngmtDAO getDpMngmtDAO() {
		return (DpMngmtDAO) instantiateDAO(DpMngmtDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDpMngmtAttachDAO()
	 */
	@Override
	public DpMngmtAttachDAO getDpMngmtAttachDAO() {
		return (DpMngmtAttachDAO) instantiateDAO(DpMngmtAttachDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDpMngmtStatusDAO()
	 */
	@Override
	public DpMngmtStatusDAO getDpMngmtStatusDAO() {
		return (DpMngmtStatusDAO) instantiateDAO(DpMngmtStatusDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDocCategoryDAO()
	 */
	@Override
	public DocCategoryDAO getDocCategoryDAO() {
		return (DocCategoryDAO) instantiateDAO(DocCategoryDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDocTypeDAO()
	 */
	@Override
	public DocTypeDAO getDocTypeDAO() {
		return (DocTypeDAO) instantiateDAO(DocTypeDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getFiskosImportDAO()
	 */
	@Override
	public FiskosImportDAO getFiskosImportDAO() {
		return (FiskosImportDAO) instantiateDAO(FiskosImportDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getManagementUnitPeriodDAO()
	 */
	@Override
	public ManagementUnitPeriodDAO getManagementUnitPeriodDAO() {
		return (ManagementUnitPeriodDAO) instantiateDAO(ManagementUnitPeriodDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getSeedlingInventoryDAO()
	 */
	@Override
	public SeedlingInventoryDAO getSeedlingInventoryDAO() {
		return (SeedlingInventoryDAO) instantiateDAO(SeedlingInventoryDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getSeedlingInventoryPosDAO()
	 */
	@Override
	public SeedlingInventoryPosDAO getSeedlingInventoryPosDAO() {
		return (SeedlingInventoryPosDAO) instantiateDAO(SeedlingInventoryPosDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getBPartnerDAO()
	 */
	@Override
	public BPartnerDAO getBPartnerDAO() {
		return (BPartnerDAO) instantiateDAO(BPartnerDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPurchaseOrderDAO()
	 */
	@Override
	public PurchaseOrderDAO getPurchaseOrderDAO() {
		return (PurchaseOrderDAO) instantiateDAO(PurchaseOrderDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPurchaseOrderItemDAO()
	 */
	@Override
	public PurchaseOrderItemDAO getPurchaseOrderItemDAO() {
		return (PurchaseOrderItemDAO) instantiateDAO(PurchaseOrderItemDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPurchaseOrderStatusDAO()
	 */
	@Override
	public PurchaseOrderStatusDAO getPurchaseOrderStatusDAO() {
		return (PurchaseOrderStatusDAO) instantiateDAO(PurchaseOrderStatusDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getRequisitionDAO()
	 */
	@Override
	public RequisitionDAO getRequisitionDAO() {
		return (RequisitionDAO) instantiateDAO(RequisitionDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getRequisitionItemDAO()
	 */
	@Override
	public RequisitionItemDAO getRequisitionItemDAO() {
		return (RequisitionItemDAO) instantiateDAO(RequisitionItemDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getRequisitionStatusDAO()
	 */
	@Override
	public RequisitionStatusDAO getRequisitionStatusDAO() {
		return (RequisitionStatusDAO) instantiateDAO(RequisitionStatusDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getCurrencyDAO()
	 */
	@Override
	public CurrencyDAO getCurrencyDAO() {
		return (CurrencyDAO) instantiateDAO(CurrencyDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getUomDAO()
	 */
	@Override
	public UomDAO getUomDAO() {
		return (UomDAO) instantiateDAO(UomDAO.class);
	}
	

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getInspActionTypeDAO()
	 */
	@Override
	public InspActionTypeDAO getInspActionTypeDAO() {
		return (InspActionTypeDAO) instantiateDAO(InspActionTypeDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getInspectionDAO()
	 */
	@Override
	public InspectionDAO getInspectionDAO() {
		return (InspectionDAO) instantiateDAO(InspectionDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getInspectorDAO()
	 */
	@Override
	public InspectorDAO getInspectorDAO() {
		return (InspectorDAO) instantiateDAO(InspectorDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getInspectionDocDAO()
	 */
	@Override
	public InspectionDocDAO getInspectionDocDAO() {
		return (InspectionDocDAO) instantiateDAO(InspectionDocDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getBPartnerLocationDAO()
	 */
	@Override
	public BPartnerLocationDAO getBPartnerLocationDAO() {
		return (BPartnerLocationDAO) instantiateDAO(BPartnerLocationDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getTaxDAO()
	 */
	@Override
	public TaxDAO getTaxDAO() {
		return (TaxDAO) instantiateDAO(TaxDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDhpetAnimalLocationDAO()
	 */
	@Override
	public DhpetAnimalLocationDAO getDhpetAnimalLocationDAO() {
		return (DhpetAnimalLocationDAO) instantiateDAO(DhpetAnimalLocationDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDhpetHuntedAnimalsDAO()
	 */
	@Override
	public DhpetHuntedAnimalsDAO getDhpetHuntedAnimalsDAO() {
		return (DhpetHuntedAnimalsDAO) instantiateDAO(DhpetHuntedAnimalsDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDhpetWildAnimalsRequestDAO()
	 */
	@Override
	public DhpetWildAnimalsRequestDAO getDhpetWildAnimalsRequestDAO() {
		return (DhpetWildAnimalsRequestDAO) instantiateDAO(DhpetWildAnimalsRequestDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getMerFinanceDonorDAO()
	 */
	@Override
	public MerFinanceDonorDAO getMerFinanceDonorDAO() {
		return (MerFinanceDonorDAO) instantiateDAO(MerFinanceDonorDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getMerIndicatorDAO()
	 */
	@Override
	public MerIndicatorDAO getMerIndicatorDAO() {
		return (MerIndicatorDAO) instantiateDAO(MerIndicatorDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getMerPlanPeriodDAO()
	 */
	@Override
	public MerPlanPeriodDAO getMerPlanPeriodDAO() {
		return (MerPlanPeriodDAO) instantiateDAO(MerPlanPeriodDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getMerProjectDAO()
	 */
	@Override
	public MerProjectDAO getMerProjectDAO() {
		return (MerProjectDAO) instantiateDAO(MerProjectDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getMerRefSubProjectDAO()
	 */
	@Override
	public MerRefSubProjectDAO getMerRefSubProjectDAO() {
		return (MerRefSubProjectDAO) instantiateDAO(MerRefSubProjectDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getMerRespInstitutionDAO()
	 */
	@Override
	public MerRespInstitutionDAO getMerRespInstitutionDAO() {
		return (MerRespInstitutionDAO) instantiateDAO(MerRespInstitutionDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getMerStrategyDAO()
	 */
	@Override
	public MerStrategyDAO getMerStrategyDAO() {
		return (MerStrategyDAO) instantiateDAO(MerStrategyDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getMerStrategyDocDAO()
	 */
	@Override
	public MerStrategyDocDAO getMerStrategyDocDAO() {
		return (MerStrategyDocDAO) instantiateDAO(MerStrategyDocDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getMerStrategyExecutionDAO()
	 */
	@Override
	public MerStrategyExecutionDAO getMerStrategyExecutionDAO() {
		return (MerStrategyExecutionDAO) instantiateDAO(MerStrategyExecutionDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getMerSubIndicatorDAO()
	 */
	@Override
	public MerSubIndicatorDAO getMerSubIndicatorDAO() {
		return (MerSubIndicatorDAO) instantiateDAO(MerSubIndicatorDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getMerSubProjectDAO()
	 */
	@Override
	public MerSubProjectDAO getMerSubProjectDAO() {
		return (MerSubProjectDAO) instantiateDAO(MerSubProjectDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getMerPerfEvaluationDAO()
	 */
	@Override
	public MerPerfEvaluationDAO getMerPerfEvaluationDAO() {
		return (MerPerfEvaluationDAO) instantiateDAO(MerPerfEvaluationDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getMerStratEvaluationDAO()
	 */
	@Override
	public MerStratEvaluationDAO getMerStratEvaluationDAO() {
		return (MerStratEvaluationDAO) instantiateDAO(MerStratEvaluationDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPublishingDAO()
	 */
	@Override
	public PublishingDAO getPublishingDAO() {
		return (PublishingDAO) instantiateDAO(PublishingDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getFireReportDAO()
	 */
	@Override
	public FireReportDAO getFireReportDAO() {
		return (FireReportDAO) instantiateDAO(FireReportDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getFireDetailsDAO()
	 */
	@Override
	public FireDetailsDAO getFireDetailsDAO() {
		return (FireDetailsDAO) instantiateDAO(FireDetailsDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getHrmAnnualPlanDAO()
	 */
	@Override
	public HrmAnnualPlanDAO getHrmAnnualPlanDAO() {
		return (HrmAnnualPlanDAO) instantiateDAO(HrmAnnualPlanDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDecisionDAO()
	 */
	@Override
	public DecisionDAO getDecisionDAO() {
		return (DecisionDAO) instantiateDAO(DecisionDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDecisionTypeDAO()
	 */
	@Override
	public DecisionTypeDAO getDecisionTypeDAO() {
		return (DecisionTypeDAO) instantiateDAO(DecisionTypeDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDecisionStatusDAO()
	 */
	@Override
	public DecisionStatusDAO getDecisionStatusDAO() {
		return (DecisionStatusDAO) instantiateDAO(DecisionStatusDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDecisionDocDAO()
	 */
	@Override
	public DecisionDocDAO getDecisionDocDAO() {
		return (DecisionDocDAO) instantiateDAO(DecisionDocDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getHrmAnnualPlanStatusDAO()
	 */
	@Override
	public HrmAnnualPlanStatusDAO getHrmAnnualPlanStatusDAO() {
		return (HrmAnnualPlanStatusDAO) instantiateDAO(HrmAnnualPlanStatusDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getHrmAnnualPlanDocDAO()
	 */
	@Override
	public HrmAnnualPlanDocDAO getHrmAnnualPlanDocDAO() {
		return (HrmAnnualPlanDocDAO) instantiateDAO(HrmAnnualPlanDocDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getFinInputStatusDAO()
	 */
	@Override
	public FinInputStatusDAO getFinInputStatusDAO() {
		return (FinInputStatusDAO) instantiateDAO(FinInputStatusDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDecisionEmployeeDAO()
	 */
	@Override
	public DecisionEmployeeDAO getDecisionEmployeeDAO() {
		return (DecisionEmployeeDAO) instantiateDAO(DecisionEmployeeDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getHrmAnnPlanEmployeeDAO()
	 */
	@Override
	public HrmAnnPlanEmployeeDAO getHrmAnnPlanEmployeeDAO() {
		return (HrmAnnPlanEmployeeDAO) instantiateDAO(HrmAnnPlanEmployeeDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getStandHarvestImplDeclareDAO()
	 */
	@Override
	public StandHarvestImplDeclareDAO getStandHarvestImplDeclareDAO() {
		return (StandHarvestImplDeclareDAO) instantiateDAO(StandHarvestImplDeclareDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getStandSilvicultureImplDeclareDAO()
	 */
	@Override
	public StandSilvicultureImplDeclareDAO getStandSilvicultureImplDeclareDAO() {
		return (StandSilvicultureImplDeclareDAO) instantiateDAO(StandSilvicultureImplDeclareDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getStandPlantingImplDeclareDAO()
	 */
	@Override
	public StandPlantingImplDeclareDAO getStandPlantingImplDeclareDAO() {
		return (StandPlantingImplDeclareDAO) instantiateDAO(StandPlantingImplDeclareDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getRoadImplDeclareDAO()
	 */
	@Override
	public RoadImplDeclareDAO getRoadImplDeclareDAO() {
		return (RoadImplDeclareDAO) instantiateDAO(RoadImplDeclareDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getProtectionImplDeclareDAO()
	 */
	@Override
	public ProtectionImplDeclareDAO getProtectionImplDeclareDAO() {
		return (ProtectionImplDeclareDAO) instantiateDAO(ProtectionImplDeclareDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getShapeStandTreatmentDAO()
	 */
	@Override
	public ShapeStandTreatmentDAO getShapeStandTreatmentDAO() {
		return (ShapeStandTreatmentDAO) instantiateDAO(ShapeStandTreatmentDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getShapeStandBiodiversityDAO()
	 */
	@Override
	public ShapeStandBiodiversityDAO getShapeStandBiodiversityDAO() {
		return (ShapeStandBiodiversityDAO) instantiateDAO(ShapeStandBiodiversityDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getShapeStandDAO()
	 */
	@Override
	public ShapeStandDAO getShapeStandDAO() {
		return (ShapeStandDAO) instantiateDAO(ShapeStandDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getImportStatusDAO()
	 */
	@Override
	public ImportStatusDAO getImportStatusDAO() {
		return (ImportStatusDAO) instantiateDAO(ImportStatusDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPlotDAO()
	 */
	@Override
	public PlotDAO getPlotDAO() {
		return (PlotDAO) instantiateDAO(PlotDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPlotTreeDAO()
	 */
	@Override
	public PlotTreeDAO getPlotTreeDAO() {
		return (PlotTreeDAO) instantiateDAO(PlotTreeDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getShapePlotsDAO()
	 */
	@Override
	public ShapePlotsDAO getShapePlotsDAO() {
		return (ShapePlotsDAO) instantiateDAO(ShapePlotsDAO.class);
	}
	
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getBiodiversityDAO()
	 */
	@Override
	public BiodiversityDAO getBiodiversityDAO() {
		return (BiodiversityDAO) instantiateDAO(BiodiversityDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getBiodiversityNameDAO()
	 */
	@Override
	public BiodiversityNameDAO getBiodiversityNameDAO() {
		return (BiodiversityNameDAO) instantiateDAO(BiodiversityNameDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getShapeBiodiversityDAO()
	 */
	@Override
	public ShapeBiodiversityDAO getShapeBiodiversityDAO() {
		return (ShapeBiodiversityDAO) instantiateDAO(ShapeBiodiversityDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getShapePlotTreesDAO()
	 */
	@Override
	public ShapePlotTreesDAO getShapePlotTreesDAO() {
		return (ShapePlotTreesDAO) instantiateDAO(ShapePlotTreesDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getRequestDAO()
	 */
	@Override
	public RequestDAO getRequestDAO() {
		return (RequestDAO) instantiateDAO(RequestDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getCadParcelRequestDAO()
	 */
	@Override
	public CadParcelRequestDAO getCadParcelRequestDAO() {
		return (CadParcelRequestDAO) instantiateDAO(CadParcelRequestDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getStandHarvestMarkedDAO()
	 */
	@Override
	public StandHarvestMarkedDAO getStandHarvestMarkedDAO() {
		return (StandHarvestMarkedDAO) instantiateDAO(StandHarvestMarkedDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getRequestStatusDAO()
	 */
	@Override
	public RequestStatusDAO getRequestStatusDAO() {
		return (RequestStatusDAO) instantiateDAO(RequestStatusDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getRequestCoordDAO()
	 */
	@Override
	public RequestCoordDAO getRequestCoordDAO() {
		return (RequestCoordDAO) instantiateDAO(RequestCoordDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getRequestDocDAO()
	 */
	@Override
	public RequestDocDAO getRequestDocDAO() {
		return (RequestDocDAO) instantiateDAO(RequestDocDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDhpetAnnualPlanDAO()
	 */
	@Override
	public DhpetAnnualPlanDAO getDhpetAnnualPlanDAO() {
		return (DhpetAnnualPlanDAO) instantiateDAO(DhpetAnnualPlanDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDhpetLocationLandTypeDAO()
	 */
	@Override
	public DhpetLocationLandTypeDAO getDhpetLocationLandTypeDAO() {
		return (DhpetLocationLandTypeDAO) instantiateDAO(DhpetLocationLandTypeDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDhpetPeriodPlanDAO()
	 */
	@Override
	public DhpetPeriodPlanDAO getDhpetPeriodPlanDAO() {
		return (DhpetPeriodPlanDAO) instantiateDAO(DhpetPeriodPlanDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getRequestTypeDAO()
	 */
	@Override
	public RequestTypeDAO getRequestTypeDAO() {
		return (RequestTypeDAO) instantiateDAO(RequestTypeDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDhpetAnimalLocationDetailDAO()
	 */
	@Override
	public DhpetAnimalLocationDetailDAO getDhpetAnimalLocationDetailDAO() {
		return (DhpetAnimalLocationDetailDAO) instantiateDAO(DhpetAnimalLocationDetailDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDhpetHuntedAnimalDetailDAO()
	 */
	@Override
	public DhpetHuntedAnimalDetailDAO getDhpetHuntedAnimalDetailDAO() {
		return (DhpetHuntedAnimalDetailDAO) instantiateDAO(DhpetHuntedAnimalDetailDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getStandHarvestImplTransportDAO()
	 */
	@Override
	public StandHarvestImplTransportDAO getStandHarvestImplTransportDAO() {
		return (StandHarvestImplTransportDAO) instantiateDAO(StandHarvestImplTransportDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getParcelOwnerDAO()
	 */
	@Override
	public ParcelOwnerDAO getParcelOwnerDAO() {
		return (ParcelOwnerDAO) instantiateDAO(ParcelOwnerDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getGisParcelGeomDAO()
	 */
	@Override
	public GisParcelGeomDAO getGisParcelGeomDAO() {
		return (GisParcelGeomDAO) instantiateDAO(GisParcelGeomDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getParcelDetailDAO()
	 */
	@Override
	public ParcelDetailDAO getParcelDetailDAO() {
		return (ParcelDetailDAO) instantiateDAO(ParcelDetailDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDhpetTouristRegisterDAO()
	 */
	@Override
	public DhpetTouristRegisterDAO getDhpetTouristRegisterDAO() {
		return (DhpetTouristRegisterDAO) instantiateDAO(DhpetTouristRegisterDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDhpetTouristPurposeDAO()
	 */
	@Override
	public DhpetTouristPurposeDAO getDhpetTouristPurposeDAO() {
		return (DhpetTouristPurposeDAO) instantiateDAO(DhpetTouristPurposeDAO.class);
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDhpetTouristZoneGeomsDAO()
	 */
	@Override
	public DhpetTouristZoneGeomsDAO getDhpetTouristZoneGeomsDAO() {
		return (DhpetTouristZoneGeomsDAO) instantiateDAO(DhpetTouristZoneGeomsDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getMerIndicatorTargetDAO()
	 */
	@Override
	public MerIndicatorTargetDAO getMerIndicatorTargetDAO() {
		return (MerIndicatorTargetDAO) instantiateDAO(MerIndicatorTargetDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getPositionsDAO()
	 */
	@Override
	public PositionsDAO getPositionsDAO() {
		return (PositionsDAO) instantiateDAO(PositionsDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getDevicesDAO()
	 */
	@Override
	public DevicesDAO getDevicesDAO() {
		return (DevicesDAO) instantiateDAO(DevicesDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getProtocolPortsDAO()
	 */
	@Override
	public ProtocolPortsDAO getProtocolPortsDAO() {
		return (ProtocolPortsDAO) instantiateDAO(ProtocolPortsDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getConfiscationDAO()
	 */
	@Override
	public ConfiscationDAO getConfiscationDAO() {
		return (ConfiscationDAO) instantiateDAO(ConfiscationDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getConfiscationDetailDAO()
	 */
	@Override
	public ConfiscationDetailDAO getConfiscationDetailDAO() {
		return (ConfiscationDetailDAO) instantiateDAO(ConfiscationDetailDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getTripsDAO()
	 */
	@Override
	public TripsDAO getTripsDAO() {
		return (TripsDAO) instantiateDAO(TripsDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getLineTempDAO()
	 */
	@Override
	public LineTempDAO getLineTempDAO() {
		return (LineTempDAO) instantiateDAO(LineTempDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getLayersGisDAO()
	 */
	@Override
	public LayersGisDAO getLayersGisDAO() {
		return (LayersGisDAO) instantiateDAO(LayersGisDAO.class);
	}

	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getFirePointDAO()
	 */
	public FirePointDAO getFirePointDAO() {
		return (FirePointDAO) instantiateDAO(FirePointDAO.class);
	}

	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getFirePolygonDAO()
	 */
	public FirePolygonDAO getFirePolygonDAO() {
		return (FirePolygonDAO) instantiateDAO(FirePolygonDAO.class);
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getAffRefProjectsDAO()
	 */
	public AffRefProjectsDAO getAffRefProjectsDAO() {
		return (AffRefProjectsDAO) instantiateDAO(AffRefProjectsDAO.class);
	}

	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.persistence.dao.DAOFactory#getKfisGenDocumentsDAO()
	 */
	@Override
	public KfisGenDocumentsDAO getKfisGenDocumentsDAO()  {
		return (KfisGenDocumentsDAO) instantiateDAO(KfisGenDocumentsDAO.class);
	}

	
	@Override
	public EconomicCodeDAO getEconomicCodeDAO() {
		return (EconomicCodeDAO) instantiateDAO(EconomicCodeDAO.class);
	}

	@Override
	public EmployeeSalaryDAO getEmployeeSalaryDAO() {
		return (EmployeeSalaryDAO) instantiateDAO(EmployeeSalaryDAO.class);
	}

	@Override
	public EmployeeSalaryPayrollDAO getEmployeeSalaryPayrollDAO() {
		return (EmployeeSalaryPayrollDAO) instantiateDAO(EmployeeSalaryPayrollDAO.class);
	}

	@Override
	public EmployeeSalaryBonusDAO getEmployeeSalaryBonusDAO() {
		return (EmployeeSalaryBonusDAO) instantiateDAO(EmployeeSalaryBonusDAO.class);
	}

	@Override
	public EmployeeSalaryDeductionsDAO getEmployeeSalaryDeductionsDAO() {
		return (EmployeeSalaryDeductionsDAO) instantiateDAO(EmployeeSalaryDeductionsDAO.class);
	}

	@Override
	public EmployeeSalaryTaxRatesDAO getEmployeeSalaryTaxRatesDAO() {
		return (EmployeeSalaryTaxRatesDAO) instantiateDAO(EmployeeSalaryTaxRatesDAO.class);

	}

	@Override
	public EmployeeSalaryAdjustmentDAO getEmployeeSalaryAdjustmentDAO() {
		return (EmployeeSalaryAdjustmentDAO) instantiateDAO(EmployeeSalaryAdjustmentDAO.class);
	}

	@Override
	public EmployeeSalaryAddsDAO getEmployeeSalaryAddsDAO() {
		return (EmployeeSalaryAddsDAO) instantiateDAO(EmployeeSalaryAddsDAO.class);
	}

	@Override
	public EmployeeSalaryPayrollAdjustmentDAO getEmployeeSalaryPayrollAdjustmentDAO() {
		return (EmployeeSalaryPayrollAdjustmentDAO) instantiateDAO(EmployeeSalaryPayrollAdjustmentDAO.class);
	}

}
