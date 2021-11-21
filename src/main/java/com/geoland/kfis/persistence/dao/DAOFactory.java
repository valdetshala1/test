package com.geoland.kfis.persistence.dao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.geoland.kfis.persistence.dao.services.*;



// TODO: Auto-generated Javadoc
/**
 * Defines all DAOs and the concrete factories to get the conrecte DAOs.
 * <p>
 * To get a concrete DAOFactory, call <tt>instance()</tt> with one of the
 * classes that extend this factory.
 * <p>
 * Implementation: If you write a new DAO, this class has to know about it.
 * If you add a new persistence mechanism, add an additional concrete factory
 * for it as a constant, like <tt>HIBERNATE</tt>.
 * 
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created November 17, 2013 8:13:07 PM
 * @Version 1.0
 *
 */
@SuppressWarnings("rawtypes") 
public abstract class DAOFactory {
	 
 	/** The log. */
 	private static Log log = LogFactory.getLog(DAOFactory.class);
	 
    /**
     * Creates a standalone DAOFactory that returns unmanaged DAO
     * beans for use in any environment Hibernate has been configured
     * for. Uses HibernateUtil/SessionFactory and Hibernate context
     * propagation (CurrentSessionContext), thread-bound or transaction-bound,
     * and transaction scoped.
     */
    public static final Class HIBERNATE = com.geoland.kfis.persistence.hibernate.HibernateDAOFactory.class;

    /**
     * Factory method for instantiation of concrete factories.
     *
     * @return the factory
     */
    public static DAOFactory getFactory() {
    	return instance(HIBERNATE);
    }  
    
    /**
     * Factory method for instantiation of concrete factories.
     *
     * @param factory the factory
     * @return the DAO factory
     */
    private static DAOFactory instance(Class factory) {
        try {
            log.debug("Creating concrete DAO factory: " + factory);
            return (DAOFactory)factory.newInstance();
        } catch (Exception ex) {
            throw new RuntimeException("Couldn't create DAOFactory: " + factory);
        }
    }  
    
    /**
     *  Add your DAO interfaces/services here.
     *
     * @return the organisation DAO
     */
    
    public abstract OrganisationDAO getOrganisationDAO();
    
    /**
     * Gets the organisation mun DAO.
     *
     * @return the organisation mun DAO
     */
    public abstract OrganisationMunDAO getOrganisationMunDAO();
    
    /**
     * Gets the party DAO.
     *
     * @return the party DAO
     */
    public abstract PartyDAO getPartyDAO();    
    
    /**
     * Gets the person DAO.
     *
     * @return the person DAO
     */
    public abstract PersonDAO getPersonDAO();
    
    /**
     * Gets the employee DAO.
     *
     * @return the employee DAO
     */
    public abstract EmployeeDAO getEmployeeDAO();
    
    /**
     * Gets the leave DAO.
     *
     * @return the leave DAO
     */
    public abstract LeaveDAO getLeaveDAO();
    
    /**
     * Gets the leave type DAO.
     *
     * @return the leave type DAO
     */
    public abstract LeaveTypeDAO getLeaveTypeDAO();
   
    /**
     * Gets the address DAO.
     *
     * @return the address DAO
     */
    public abstract AddressDAO getAddressDAO();
    
    /**
     * Gets the official travel DAO.
     *
     * @return the official travel DAO
     */
    public abstract OfficialTravelDAO getOfficialTravelDAO();
    
    /**
     * Gets the attendance record DAO.
     *
     * @return the attendance record DAO
     */
    public abstract AttendanceRecordDAO getAttendanceRecordDAO();
    
    /**
     * Gets the leave entitlement DAO.
     *
     * @return the leave entitlement DAO
     */
    public abstract LeaveEntitlementDAO getLeaveEntitlementDAO();
    
    /**
     * Gets the employee language DAO.
     *
     * @return the employee language DAO
     */
    public abstract EmployeeLanguageDAO getEmployeeLanguageDAO();
    
    /**
     * Gets the language DAO.
     *
     * @return the language DAO
     */
    public abstract LanguageDAO getLanguageDAO();
    
    /**
     * Gets the vehicle DAO.
     *
     * @return the vehicle DAO
     */
    public abstract VehicleDAO getVehicleDAO();
    
    /**
     * Gets the vehicle register DAO.
     *
     * @return the vehicle register DAO
     */
    public abstract VehicleRegisterDAO getVehicleRegisterDAO();
    
    /**
     * Gets the employee skill DAO.
     *
     * @return the employee skill DAO
     */
    public abstract EmployeeSkillDAO getEmployeeSkillDAO();
    
    /**
     * Gets the vehicle service maintenance DAO.
     *
     * @return the vehicle service maintenance DAO
     */
    public abstract VehicleServiceMaintenanceDAO getVehicleServiceMaintenanceDAO();
    
    /**
     * Gets the domain DAO.
     *
     * @return the domain DAO
     */
    public abstract DomainDAO getDomainDAO();
    
    /**
     * Gets the text domain DAO.
     *
     * @return the text domain DAO
     */
    public abstract TextDomainDAO getTextDomainDAO();
    
    /**
     * Gets the vehicle staff assign DAO.
     *
     * @return the vehicle staff assign DAO
     */
    public abstract VehicleStaffAssignDAO getVehicleStaffAssignDAO();
    
    /**
     * Gets the assets DAO.
     *
     * @return the assets DAO
     */
    public abstract AssetsDAO getAssetsDAO();
    
    /**
     * Gets the assets staff assign DAO.
     *
     * @return the assets staff assign DAO
     */
    public abstract AssetsStaffAssignDAO getAssetsStaffAssignDAO();
    
    /**
     * Gets the assets devaluation DAO.
     *
     * @return the assets devaluation DAO
     */
    public abstract AssetsDevaluationDAO getAssetsDevaluationDAO();
    
    /**
     * Gets the employee document DAO.
     *
     * @return the employee document DAO
     */
    public abstract EmployeeDocumentDAO getEmployeeDocumentDAO();
    
    /**
     * Gets the law suit DAO.
     *
     * @return the law suit DAO
     */
    public abstract LawSuitDAO getLawSuitDAO();
    
    /**
     * Gets the lawsuit damage DAO.
     *
     * @return the lawsuit damage DAO
     */
    public abstract LawSuitDamageDAO getLawsuitDamageDAO();
    
    /**
     * Gets the lawsuit status DAO.
     *
     * @return the lawsuit status DAO
     */
    public abstract LawSuitStatusDAO getLawsuitStatusDAO();
    
    /**
     * Gets the fuel consum DAO.
     *
     * @return the fuel consum DAO
     */
    public abstract FuelConsumDAO getFuelConsumDAO();
    
    /**
     * Gets the employee sos contact DAO.
     *
     * @return the employee sos contact DAO
     */
    public abstract EmployeeSosContactDAO getEmployeeSosContactDAO();
    
    /**
     * Gets the cadastral municipality DAO.
     *
     * @return the cadastral municipality DAO
     */
    public abstract CadastralMunicipalityDAO getCadastralMunicipalityDAO();
    
    /**
     * Gets the party user DAO.
     *
     * @return the party user DAO
     */
    public abstract PartyUserDAO getPartyUserDAO();
    
    /**
     * Gets the financial input DAO.
     *
     * @return the financial input DAO
     */
    public abstract FinancialInputDAO getFinancialInputDAO();
    
    /**
     * Gets the financial type DAO.
     *
     * @return the financial type DAO
     */
    public abstract FinancialTypeDAO getFinancialTypeDAO();
    
    /**
     * Gets the financial output DAO.
     *
     * @return the financial output DAO
     */
    public abstract FinancialOutputDAO getFinancialOutputDAO();
    
    /**
     * Gets the contractor DAO.
     *
     * @return the contractor DAO
     */
    public abstract ContractorDAO getContractorDAO();
    
    /**
     * Gets the contract DAO.
     *
     * @return the contract DAO
     */
    public abstract ContractDAO getContractDAO();
    
    /**
     * Gets the annu budget allocation DAO.
     *
     * @return the annu budget allocation DAO
     */
    public abstract AnnuBudgetAllocationDAO getAnnuBudgetAllocationDAO();
    
    /**
     * Gets the payment period DAO.
     *
     * @return the payment period DAO
     */
    public abstract PaymentPeriodDAO getPaymentPeriodDAO();
    
    /**
     * Gets the budget mainntenance DAO.
     *
     * @return the budget mainntenance DAO
     */
    public abstract BudgetMainntenanceDAO getBudgetMainntenanceDAO();
    
    /**
     * Gets the fiskos import DAO.
     *
     * @return the fiskos import DAO
     */
    public abstract FiskosImportDAO getFiskosImportDAO();
    
    /**
     * Gets the fiskos data DAO.
     *
     * @return the fiskos data DAO
     */
    public abstract FiskosDataDAO getFiskosDataDAO();
    
    /**
     * Gets the prcmt tender request DAO.
     *
     * @return the prcmt tender request DAO
     */
    public abstract PrcmtTenderRequestDAO getPrcmtTenderRequestDAO();
    
    /**
     * Gets the prcmt tender status DAO.
     *
     * @return the prcmt tender status DAO
     */
    public abstract PrcmtTenderStatusDAO getPrcmtTenderStatusDAO();
    
    /**
     * Gets the prcmt tender bidder DAO.
     *
     * @return the prcmt tender bidder DAO
     */
    public abstract PrcmtTenderBidderDAO getPrcmtTenderBidderDAO();
    
    /**
     * Gets the prcmt tender bid DAO.
     *
     * @return the prcmt tender bid DAO
     */
    public abstract PrcmtTenderBidDAO getPrcmtTenderBidDAO();
    
    /**
     * Gets the prcmt dossier request DAO.
     *
     * @return the prcmt dossier request DAO
     */
    public abstract PrcmtDossierRequestDAO getPrcmtDossierRequestDAO();
    
    /**
     * Gets the dhpet animal capacity DAO.
     *
     * @return the dhpet animal capacity DAO
     */
    public abstract DhpetAnimalCapacityDAO getDhpetAnimalCapacityDAO();
    
    /**
     * Gets the dhpet location DAO.
     *
     * @return the dhpet location DAO
     */
    public abstract DhpetLocationDAO getDhpetLocationDAO();
    
    /**
     * Gets the dhpet hunt ground eval DAO.
     *
     * @return the dhpet hunt ground eval DAO
     */
    public abstract DhpetHuntGroundEvalDAO getDhpetHuntGroundEvalDAO();
    
    /**
     * Gets the dhpet wild animals DAO.
     *
     * @return the dhpet wild animals DAO
     */
    public abstract DhpetWildAnimalsDAO getDhpetWildAnimalsDAO();
    
    /**
     * Gets the dhpet animal location DAO.
     *
     * @return the dhpet animal location DAO
     */
    public abstract DhpetAnimalLocationDAO getDhpetAnimalLocationDAO();
    
    /**
     * Gets the prcmt dossier question DAO.
     *
     * @return the prcmt dossier question DAO
     */
    public abstract PrcmtDossierQuestionDAO getPrcmtDossierQuestionDAO();
    
    /**
     * Gets the prcmt tender attach DAO.
     *
     * @return the prcmt tender attach DAO
     */
    public abstract PrcmtTenderAttachDAO getPrcmtTenderAttachDAO();
    
    /**
     * Gets the compartment DAO.
     *
     * @return the compartment DAO
     */
    public abstract CompartmentDAO getCompartmentDAO();
    
    /**
     * Gets the stand DAO.
     *
     * @return the stand DAO
     */
    public abstract StandDAO getStandDAO();
    
    /**
     * Gets the management unit DAO.
     *
     * @return the management unit DAO
     */
    public abstract ManagementUnitDAO getManagementUnitDAO();
    
    /**
     * Gets the management unit period DAO.
     *
     * @return the management unit period DAO
     */
    public abstract ManagementUnitPeriodDAO getManagementUnitPeriodDAO();
    
    /**
     * Gets the annual planning DAO.
     *
     * @return the annual planning DAO
     */
    public abstract AnnualPlanningDAO getAnnualPlanningDAO();
    
    /**
     * Gets the annual planning status DAO.
     *
     * @return the annual planning status DAO
     */
    public abstract AnnualPlanningStatusDAO getAnnualPlanningStatusDAO();
    
    /**
     * Gets the stand harvest activity DAO.
     *
     * @return the stand harvest activity DAO
     */
    public abstract StandHarvestActivityDAO getStandHarvestActivityDAO();
    
    /**
     * Gets the activity DAO.
     *
     * @return the activity DAO
     */
    public abstract ActivityDAO getActivityDAO();
    
    /**
     * Gets the activity status DAO.
     *
     * @return the activity status DAO
     */
    public abstract ActivityStatusDAO getActivityStatusDAO();
    
    /**
     * Gets the frm domain DAO.
     *
     * @return the frm domain DAO
     */
    public abstract FrmDomainDAO getFrmDomainDAO();
    
    /**
     * Gets the tree species DAO.
     *
     * @return the tree species DAO
     */
    public abstract TreeSpeciesDAO getTreeSpeciesDAO();
    
    /**
     * Gets the stand silviculture activity DAO.
     *
     * @return the stand silviculture activity DAO
     */
    public abstract StandSilvicultureActivityDAO getStandSilvicultureActivityDAO();
    
    /**
     * Gets the stand planting activity DAO.
     *
     * @return the stand planting activity DAO
     */
    public abstract StandPlantingActivityDAO getStandPlantingActivityDAO();
    
    /**
     * Gets the seed activity DAO.
     *
     * @return the seed activity DAO
     */
    public abstract SeedActivityDAO getSeedActivityDAO();
    
    /**
     * Gets the activity domain DAO.
     *
     * @return the activity domain DAO
     */
    public abstract ActivityDomainDAO getActivityDomainDAO();
    
    /**
     * Gets the road activity DAO.
     *
     * @return the road activity DAO
     */
    public abstract RoadActivityDAO getRoadActivityDAO();
    
    /**
     * Gets the protection activity DAO.
     *
     * @return the protection activity DAO
     */
    public abstract ProtectionActivityDAO getProtectionActivityDAO();
    
    /**
     * Gets the units metric DAO.
     *
     * @return the units metric DAO
     */
    public abstract UnitsMetricDAO getUnitsMetricDAO();
    
    /**
     * Gets the road DAO.
     *
     * @return the road DAO
     */
    public abstract RoadDAO getRoadDAO();
    
    /**
     * Gets the private request DAO.
     *
     * @return the private request DAO
     */
    public abstract PrivateRequestDAO getPrivateRequestDAO();
    
    /**
     * Gets the private request impl DAO.
     *
     * @return the private request impl DAO
     */
    public abstract PrivateRequestImplDAO getPrivateRequestImplDAO();
    
    /**
     * Gets the cadastral zone DAO.
     *
     * @return the cadastral zone DAO
     */
    public abstract CadastralZoneDAO getCadastralZoneDAO();
    
    /**
     * Gets the contract doc DAO.
     *
     * @return the contract doc DAO
     */
    public abstract ContractDocDAO getContractDocDAO();
    
    /**
     * Gets the prcmt tender complaint DAO.
     *
     * @return the prcmt tender complaint DAO
     */
    public abstract PrcmtTenderComplaintDAO getPrcmtTenderComplaintDAO();
    
    /**
     * Gets the prcmt tender status doc DAO.
     *
     * @return the prcmt tender status doc DAO
     */
    public abstract PrcmtTenderStatusDocDAO getPrcmtTenderStatusDocDAO();
    
    /**
     * Gets the region DAO.
     *
     * @return the region DAO
     */
    public abstract RegionDAO getRegionDAO();
    
    /**
     * Gets the private activity DAO.
     *
     * @return the private activity DAO
     */
    public abstract PrivateActivityDAO getPrivateActivityDAO();
    
    /**
     * Gets the private request doc DAO.
     *
     * @return the private request doc DAO
     */
    public abstract PrivateRequestDocDAO getPrivateRequestDocDAO(); 
    
    /**
     * Gets the activity status doc DAO.
     *
     * @return the activity status doc DAO
     */
    public abstract ActivityStatusDocDAO getActivityStatusDocDAO();
    
    /**
     * Gets the estimate volume DAO.
     *
     * @return the estimate volume DAO
     */
    public abstract EstimateVolumeDAO getEstimateVolumeDAO();
    
    /**
     * Gets the stand growth DAO.
     *
     * @return the stand growth DAO
     */
    public abstract StandGrowthDAO getStandGrowthDAO();
    
    /**
     * Gets the party role DAO.
     *
     * @return the party role DAO
     */
    public abstract PartyRoleDAO getPartyRoleDAO();
    
    /**
     * Gets the dp mngmt DAO.
     *
     * @return the dp mngmt DAO
     */
    public abstract DpMngmtDAO getDpMngmtDAO();
    
    /**
     * Gets the dp mngmt attach DAO.
     *
     * @return the dp mngmt attach DAO
     */
    public abstract DpMngmtAttachDAO getDpMngmtAttachDAO();
    
    /**
     * Gets the dp mngmt status DAO.
     *
     * @return the dp mngmt status DAO
     */
    public abstract DpMngmtStatusDAO getDpMngmtStatusDAO();
    
    /**
     * Gets the doc category DAO.
     *
     * @return the doc category DAO
     */
    public abstract DocCategoryDAO getDocCategoryDAO();
    
    /**
     * Gets the doc type DAO.
     *
     * @return the doc type DAO
     */
    public abstract DocTypeDAO getDocTypeDAO();   
    
    /**
     * Gets the seedling inventory DAO.
     *
     * @return the seedling inventory DAO
     */
    public abstract SeedlingInventoryDAO getSeedlingInventoryDAO(); 
    
    /**
     * Gets the seedling inventory pos DAO.
     *
     * @return the seedling inventory pos DAO
     */
    public abstract SeedlingInventoryPosDAO getSeedlingInventoryPosDAO();
    
    /**
     * Gets the b partner DAO.
     *
     * @return the b partner DAO
     */
    public abstract BPartnerDAO getBPartnerDAO();
    
    /**
     * Gets the b partner location DAO.
     *
     * @return the b partner location DAO
     */
    public abstract BPartnerLocationDAO getBPartnerLocationDAO();
    
    /**
     * Gets the purchase order DAO.
     *
     * @return the purchase order DAO
     */
    public abstract PurchaseOrderDAO getPurchaseOrderDAO();
    
    /**
     * Gets the purchase order item DAO.
     *
     * @return the purchase order item DAO
     */
    public abstract PurchaseOrderItemDAO getPurchaseOrderItemDAO();
    
    /**
     * Gets the purchase order status DAO.
     *
     * @return the purchase order status DAO
     */
    public abstract PurchaseOrderStatusDAO getPurchaseOrderStatusDAO();
    
    /**
     * Gets the requisition DAO.
     *
     * @return the requisition DAO
     */
    public abstract RequisitionDAO getRequisitionDAO();
    
    /**
     * Gets the requisition item DAO.
     *
     * @return the requisition item DAO
     */
    public abstract RequisitionItemDAO getRequisitionItemDAO();
    
    /**
     * Gets the requisition status DAO.
     *
     * @return the requisition status DAO
     */
    public abstract RequisitionStatusDAO getRequisitionStatusDAO();
    
    /**
     * Gets the currency DAO.
     *
     * @return the currency DAO
     */
    public abstract CurrencyDAO getCurrencyDAO();
    
    /**
     * Gets the uom DAO.
     *
     * @return the uom DAO
     */
    public abstract UomDAO getUomDAO();
    
    /**
     * Gets the insp action type DAO.
     *
     * @return the insp action type DAO
     */
    public abstract InspActionTypeDAO getInspActionTypeDAO();
    
    /**
     * Gets the inspection DAO.
     *
     * @return the inspection DAO
     */
    public abstract InspectionDAO getInspectionDAO();
    
    /**
     * Gets the inspector DAO.
     *
     * @return the inspector DAO
     */
    public abstract InspectorDAO getInspectorDAO();
    
    /**
     * Gets the inspection doc DAO.
     *
     * @return the inspection doc DAO
     */
    public abstract InspectionDocDAO getInspectionDocDAO();
    
    /**
     * Gets the tax DAO.
     *
     * @return the tax DAO
     */
    public abstract TaxDAO getTaxDAO();
    
    /**
     * Gets the dhpet hunted animals DAO.
     *
     * @return the dhpet hunted animals DAO
     */
    public abstract DhpetHuntedAnimalsDAO getDhpetHuntedAnimalsDAO();
    
    /**
     * Gets the dhpet wild animals request DAO.
     *
     * @return the dhpet wild animals request DAO
     */
    public abstract DhpetWildAnimalsRequestDAO getDhpetWildAnimalsRequestDAO();
    
    /**
     * Gets the mer perf evaluation DAO.
     *
     * @return the mer perf evaluation DAO
     */
    public abstract MerPerfEvaluationDAO getMerPerfEvaluationDAO();
    
    /**
     * Gets the mer strat evaluation DAO.
     *
     * @return the mer strat evaluation DAO
     */
    public abstract MerStratEvaluationDAO getMerStratEvaluationDAO();
    
    /**
     * Gets the mer finance donor DAO.
     *
     * @return the mer finance donor DAO
     */
    public abstract MerFinanceDonorDAO getMerFinanceDonorDAO();
    
    /**
     * Gets the mer indicator DAO.
     *
     * @return the mer indicator DAO
     */
    public abstract MerIndicatorDAO getMerIndicatorDAO();
    
    /**
     * Gets the mer plan period DAO.
     *
     * @return the mer plan period DAO
     */
    public abstract MerPlanPeriodDAO getMerPlanPeriodDAO();
    
    /**
     * Gets the mer project DAO.
     *
     * @return the mer project DAO
     */
    public abstract MerProjectDAO getMerProjectDAO();
    
    /**
     * Gets the mer ref sub project DAO.
     *
     * @return the mer ref sub project DAO
     */
    public abstract MerRefSubProjectDAO getMerRefSubProjectDAO();
    
    /**
     * Gets the mer resp institution DAO.
     *
     * @return the mer resp institution DAO
     */
    public abstract MerRespInstitutionDAO getMerRespInstitutionDAO();
    
    /**
     * Gets the mer strategy DAO.
     *
     * @return the mer strategy DAO
     */
    public abstract MerStrategyDAO getMerStrategyDAO();
    
    /**
     * Gets the mer strategy doc DAO.
     *
     * @return the mer strategy doc DAO
     */
    public abstract MerStrategyDocDAO getMerStrategyDocDAO();
    
    /**
     * Gets the mer strategy execution DAO.
     *
     * @return the mer strategy execution DAO
     */
    public abstract MerStrategyExecutionDAO getMerStrategyExecutionDAO();
    
    /**
     * Gets the mer sub indicator DAO.
     *
     * @return the mer sub indicator DAO
     */
    public abstract MerSubIndicatorDAO getMerSubIndicatorDAO();
    
    /**
     * Gets the mer sub project DAO.
     *
     * @return the mer sub project DAO
     */
    public abstract MerSubProjectDAO getMerSubProjectDAO();
    
    /**
     * Gets the publishing DAO.
     *
     * @return the publishing DAO
     */
    public abstract PublishingDAO getPublishingDAO();
    
    /**
     * Gets the fire report DAO.
     *
     * @return the fire report DAO
     */
    public abstract FireReportDAO getFireReportDAO();
    
    /**
     * Gets the fire details DAO.
     *
     * @return the fire details DAO
     */
    public abstract FireDetailsDAO getFireDetailsDAO();
    
    /**
     * Gets the hrm annual plan DAO.
     *
     * @return the hrm annual plan DAO
     */
    public abstract HrmAnnualPlanDAO getHrmAnnualPlanDAO();
    
    /**
     * Gets the hrm annual plan status DAO.
     *
     * @return the hrm annual plan status DAO
     */
    public abstract HrmAnnualPlanStatusDAO getHrmAnnualPlanStatusDAO();
    
    /**
     * Gets the hrm annual plan doc DAO.
     *
     * @return the hrm annual plan doc DAO
     */
    public abstract HrmAnnualPlanDocDAO getHrmAnnualPlanDocDAO();
    
    /**
     * Gets the hrm ann plan employee DAO.
     *
     * @return the hrm ann plan employee DAO
     */
    public abstract HrmAnnPlanEmployeeDAO getHrmAnnPlanEmployeeDAO();
    
    /**
     * Gets the decision DAO.
     *
     * @return the decision DAO
     */
    public abstract DecisionDAO getDecisionDAO();
    
    /**
     * Gets the decision employee DAO.
     *
     * @return the decision employee DAO
     */
    public abstract DecisionEmployeeDAO getDecisionEmployeeDAO();
    
    /**
     * Gets the decision type DAO.
     *
     * @return the decision type DAO
     */
    public abstract DecisionTypeDAO getDecisionTypeDAO();
    
    /**
     * Gets the decision status DAO.
     *
     * @return the decision status DAO
     */
    public abstract DecisionStatusDAO getDecisionStatusDAO();
    
    /**
     * Gets the decision doc DAO.
     *
     * @return the decision doc DAO
     */
    public abstract DecisionDocDAO getDecisionDocDAO();
    
    /**
     * Gets the fin input status DAO.
     *
     * @return the fin input status DAO
     */
    public abstract FinInputStatusDAO getFinInputStatusDAO();
    
    /**
     * Gets the stand harvest impl declare DAO.
     *
     * @return the stand harvest impl declare DAO
     */
    public abstract StandHarvestImplDeclareDAO getStandHarvestImplDeclareDAO();
    
    /**
     * Gets the stand silviculture impl declare DAO.
     *
     * @return the stand silviculture impl declare DAO
     */
    public abstract StandSilvicultureImplDeclareDAO getStandSilvicultureImplDeclareDAO();
    
    /**
     * Gets the stand planting impl declare DAO.
     *
     * @return the stand planting impl declare DAO
     */
    public abstract StandPlantingImplDeclareDAO getStandPlantingImplDeclareDAO();
    
    /**
     * Gets the road impl declare DAO.
     *
     * @return the road impl declare DAO
     */
    public abstract RoadImplDeclareDAO getRoadImplDeclareDAO();
    
    /**
     * Gets the protection impl declare DAO.
     *
     * @return the protection impl declare DAO
     */
    public abstract ProtectionImplDeclareDAO getProtectionImplDeclareDAO();
    
    /**
     * Gets the shape stand treatment DAO.
     *
     * @return the shape stand treatment DAO
     */
    public abstract ShapeStandTreatmentDAO getShapeStandTreatmentDAO();
    
    /**
     * Gets the shape stand biodiversity DAO.
     *
     * @return the shape stand biodiversity DAO
     */
    public abstract ShapeStandBiodiversityDAO getShapeStandBiodiversityDAO();
    
    /**
     * Gets the shape stand DAO.
     *
     * @return the shape stand DAO
     */
    public abstract ShapeStandDAO getShapeStandDAO();
    
    /**
     * Gets the import status DAO.
     *
     * @return the import status DAO
     */
    public abstract ImportStatusDAO getImportStatusDAO();
    
    /**
     * Gets the plot DAO.
     *
     * @return the plot DAO
     */
    public abstract PlotDAO getPlotDAO();
    
    /**
     * Gets the plot tree DAO.
     *
     * @return the plot tree DAO
     */
    public abstract PlotTreeDAO getPlotTreeDAO();
    
    /**
     * Gets the shape plots DAO.
     *
     * @return the shape plots DAO
     */
    public abstract ShapePlotsDAO getShapePlotsDAO();
    
    /**
     * Gets the shape plot trees DAO.
     *
     * @return the shape plot trees DAO
     */
    public abstract ShapePlotTreesDAO getShapePlotTreesDAO();
    
    /**
     * Gets the biodiversity DAO.
     *
     * @return the biodiversity DAO
     */
    public abstract BiodiversityDAO getBiodiversityDAO();
    
    /**
     * Gets the biodiversity name DAO.
     *
     * @return the biodiversity name DAO
     */
    public abstract BiodiversityNameDAO getBiodiversityNameDAO();
    
    /**
     * Gets the shape biodiversity DAO.
     *
     * @return the shape biodiversity DAO
     */
    public abstract ShapeBiodiversityDAO getShapeBiodiversityDAO();
    
    /**
     * Gets the stand harvest marked DAO.
     *
     * @return the stand harvest marked DAO
     */
    public abstract StandHarvestMarkedDAO getStandHarvestMarkedDAO();
    
    /**
     * Gets the request DAO.
     *
     * @return the request DAO
     */
    public abstract RequestDAO getRequestDAO();
    
    /**
     * Gets the request status DAO.
     *
     * @return the request status DAO
     */
    public abstract RequestStatusDAO getRequestStatusDAO();
    
    /**
     * Gets the request doc DAO.
     *
     * @return the request doc DAO
     */
    public abstract RequestDocDAO getRequestDocDAO();
    
    /**
     * Gets the request coord DAO.
     *
     * @return the request coord DAO
     */
    public abstract RequestCoordDAO getRequestCoordDAO();
    
    /**
     * Gets the request type DAO.
     *
     * @return the request type DAO
     */
    public abstract RequestTypeDAO getRequestTypeDAO();
    
    /**
     * Gets the cad parcel request DAO.
     *
     * @return the cad parcel request DAO
     */
    public abstract CadParcelRequestDAO getCadParcelRequestDAO();
    
    /**
     * Gets the dhpet annual plan DAO.
     *
     * @return the dhpet annual plan DAO
     */
    public abstract DhpetAnnualPlanDAO getDhpetAnnualPlanDAO();
    
    /**
     * Gets the dhpet location land type DAO.
     *
     * @return the dhpet location land type DAO
     */
    public abstract DhpetLocationLandTypeDAO getDhpetLocationLandTypeDAO();
    
    /**
     * Gets the dhpet period plan DAO.
     *
     * @return the dhpet period plan DAO
     */
    public abstract DhpetPeriodPlanDAO getDhpetPeriodPlanDAO();
    
    /**
     * Gets the dhpet animal location detail DAO.
     *
     * @return the dhpet animal location detail DAO
     */
    public abstract DhpetAnimalLocationDetailDAO getDhpetAnimalLocationDetailDAO();
    
    /**
     * Gets the dhpet hunted animal detail DAO.
     *
     * @return the dhpet hunted animal detail DAO
     */
    public abstract DhpetHuntedAnimalDetailDAO getDhpetHuntedAnimalDetailDAO();
    
    /**
     * Gets the stand harvest impl transport DAO.
     *
     * @return the stand harvest impl transport DAO
     */
    public abstract StandHarvestImplTransportDAO getStandHarvestImplTransportDAO();
    
    /**
     * Gets the parcel detail DAO.
     *
     * @return the parcel detail DAO
     */
    public abstract ParcelDetailDAO getParcelDetailDAO();
    
    /**
     * Gets the parcel owner DAO.
     *
     * @return the parcel owner DAO
     */
    public abstract ParcelOwnerDAO getParcelOwnerDAO();
    
    /**
     * Gets the gis parcel geom DAO.
     *
     * @return the gis parcel geom DAO
     */
    public abstract GisParcelGeomDAO getGisParcelGeomDAO();

    /**
     * Gets the dhpet tourist register DAO.
     *
     * @return the dhpet tourist register DAO
     */
    public abstract DhpetTouristRegisterDAO getDhpetTouristRegisterDAO();
    
    /**
     * Gets the dhpet tourist purpose DAO.
     *
     * @return the dhpet tourist purpose DAO
     */
    public abstract DhpetTouristPurposeDAO getDhpetTouristPurposeDAO();
    
    /**
     * Gets the dhpet tourist zone geoms DAO.
     *
     * @return the dhpet tourist zone geoms DAO
     */
    public abstract DhpetTouristZoneGeomsDAO getDhpetTouristZoneGeomsDAO();
    
    /**
     * Gets the mer indicator target DAO.
     *
     * @return the mer indicator target DAO
     */
    public abstract MerIndicatorTargetDAO getMerIndicatorTargetDAO();
    
    /**
     * Gets the positions DAO.
     *
     * @return the positions DAO
     */
    public abstract PositionsDAO getPositionsDAO();
    
    /**
     * Gets the devices DAO.
     *
     * @return the devices DAO
     */
    public abstract DevicesDAO getDevicesDAO();
    
    /**
     * Gets the protocol ports DAO.
     *
     * @return the protocol ports DAO
     */
    public abstract ProtocolPortsDAO getProtocolPortsDAO();
    
    /**
     * Gets the confiscation DAO.
     *
     * @return the confiscation DAO
     */
    public abstract ConfiscationDAO getConfiscationDAO();
    
    /**
     * Gets the confiscation detail DAO.
     *
     * @return the confiscation detail DAO
     */
    public abstract ConfiscationDetailDAO getConfiscationDetailDAO();
    
    /**
     * Gets the trips DAO.
     *
     * @return the trips DAO
     */
    public abstract TripsDAO getTripsDAO(); 
    
    /**
     * Gets the line temp DAO.
     *
     * @return the line temp DAO
     */
    public abstract LineTempDAO getLineTempDAO(); 
    
    /**
     * Gets the layers gis DAO.
     *
     * @return the layers gis DAO
     */
    public abstract LayersGisDAO getLayersGisDAO(); 
    
    /**
     * Gets the fire point DAO.
     *
     * @return the fire point DAO
     */
    public abstract FirePointDAO getFirePointDAO();
    
    /**
     * Gets the fire polygon DAO.
     *
     * @return the fire polygon DAO
     */
    public abstract FirePolygonDAO getFirePolygonDAO();
    
    /**
     * Gets the aff ref projects DAO.
     *
     * @return the aff ref projects DAO
     */
    public abstract AffRefProjectsDAO getAffRefProjectsDAO();
    
    /**
     * Gets the kfis gen documents DAO.
     *
     * @return the kfis gen documents DAO
     */
    public abstract KfisGenDocumentsDAO getKfisGenDocumentsDAO();
    
    
    public abstract EconomicCodeDAO getEconomicCodeDAO();
    
    public abstract EmployeeSalaryDAO getEmployeeSalaryDAO();
    
    public abstract EmployeeSalaryAdjustmentDAO getEmployeeSalaryAdjustmentDAO();
    
    public abstract EmployeeSalaryAddsDAO getEmployeeSalaryAddsDAO();
        
    public abstract EmployeeSalaryPayrollDAO getEmployeeSalaryPayrollDAO();
    
    public abstract EmployeeSalaryPayrollAdjustmentDAO getEmployeeSalaryPayrollAdjustmentDAO();
    
    public abstract EmployeeSalaryBonusDAO getEmployeeSalaryBonusDAO();
    
    public abstract EmployeeSalaryDeductionsDAO getEmployeeSalaryDeductionsDAO();
    
    public abstract EmployeeSalaryTaxRatesDAO getEmployeeSalaryTaxRatesDAO();
    
}
