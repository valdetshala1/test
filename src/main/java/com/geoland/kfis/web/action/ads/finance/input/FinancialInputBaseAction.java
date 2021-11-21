/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.input;

import com.geoland.kfis.model.FinInputStatus;
import com.geoland.kfis.model.FinancialInput;
import com.geoland.kfis.persistence.hibernate.usertypes.Fininputstatus;
import com.geoland.kfis.persistence.hibernate.usertypes.Month;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class FinancialInputBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Sep 3, 2014, 1:42:34 PM
 */
public class FinancialInputBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3973438456242160611L;

	/** The fin input id. */
	protected Long finInputId;
	
	/** The fin input. */
	protected FinancialInput finInput;
	
	/** The month list. */
	protected Month monthList[] = Month.values();
	
	/** The apk id. */
	protected Long apkId;
	
	/** The status. */
	protected FinInputStatus status;
	
	/** The fininputstatus. */
	protected Fininputstatus[] fininputstatus=Fininputstatus.values();
	
	/** The no change. */
	protected boolean noChange;
	
	/** The mun read only. */
	protected boolean munReadOnly;
	
	/** The reg status. */
	protected boolean regStatus;
	
	/**
	 * Check status.
	 *
	 * @param input the input
	 * @return true, if successful
	 */
	protected boolean checkStatus(FinancialInput input){
		Fininputstatus s = input.getFinInputStatus().getStatus();
		Character opl = input.getEmployee().getOrganisation().getOperLevelVal();//created employee op. level
		Character copl = getUser().getOperationalLevelVal();//current user employee op. level
		if(!opl.equals(copl))
			return noChange=true;
		else if(opl.equals('M') && s!=null && s!=Fininputstatus.CREATED)
			return noChange=true;
		else if(opl.equals('R') && s!=Fininputstatus.REGIONALVALIDATED)
			return noChange=true;
		else if(s==Fininputstatus.CENTRALAPPROVAL || s==Fininputstatus.REJECTED)
			return noChange=true;
		return noChange=false;
	}
	
	/**
	 * Gets the fin input id.
	 *
	 * @return the finInputId
	 */
	public Long getFinInputId() {
		return finInputId;
	}
	
	/**
	 * Sets the fin input id.
	 *
	 * @param finInputId the finInputId to set
	 */
	public void setFinInputId(Long finInputId) {
		this.finInputId = finInputId;
	}
	
	/**
	 * Gets the fin input.
	 *
	 * @return the finInput
	 */
	public FinancialInput getFinInput() {
		return finInput;
	}
	
	/**
	 * Sets the fin input.
	 *
	 * @param finInput the finInput to set
	 */
	public void setFinInput(FinancialInput finInput) {
		this.finInput = finInput;
	}
	
	/**
	 * Gets the month list.
	 *
	 * @return the monthList
	 */
	public Month[] getMonthList() {
		return monthList;
	}
	
	/**
	 * Sets the month list.
	 *
	 * @param monthList the monthList to set
	 */
	public void setMonthList(Month[] monthList) {
		this.monthList = monthList;
	}
	
	/**
	 * Gets the apk id.
	 *
	 * @return the apk id
	 */
	public Long getApkId() {
		return apkId;
	}
	
	/**
	 * Sets the apk id.
	 *
	 * @param apkId the new apk id
	 */
	public void setApkId(Long apkId) {
		this.apkId = apkId;
	}
	
	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	public FinInputStatus getStatus() {
		return status;
	}
	
	/**
	 * Sets the status.
	 *
	 * @param status the status to set
	 */
	public void setStatus(FinInputStatus status) {
		this.status = status;
	}
	
	/**
	 * Checks if is no change.
	 *
	 * @return the noChange
	 */
	public boolean isNoChange() {
		return noChange;
	}
	
	/**
	 * Sets the no change.
	 *
	 * @param noChange the noChange to set
	 */
	public void setNoChange(boolean noChange) {
		this.noChange = noChange;
	}
	
	/**
	 * Checks if is mun read only.
	 *
	 * @return the munReadOnly
	 */
	public boolean isMunReadOnly() {
		return munReadOnly;
	}
	
	/**
	 * Sets the mun read only.
	 *
	 * @param munReadOnly the munReadOnly to set
	 */
	public void setMunReadOnly(boolean munReadOnly) {
		this.munReadOnly = munReadOnly;
	}
	
	/**
	 * Checks if is reg status.
	 *
	 * @return the regStatus
	 */
	public boolean isRegStatus() {
		return regStatus;
	}
	
	/**
	 * Sets the reg status.
	 *
	 * @param regStatus the regStatus to set
	 */
	public void setRegStatus(boolean regStatus) {
		this.regStatus = regStatus;
	}
	
	/**
	 * Gets the fininputstatus.
	 *
	 * @return the fininputstatus
	 */
	public Fininputstatus[] getFininputstatus() {
		return fininputstatus;
	}
	
	/**
	 * Sets the fininputstatus.
	 *
	 * @param fininputstatus the new fininputstatus
	 */
	public void setFininputstatus(Fininputstatus[] fininputstatus) {
		this.fininputstatus = fininputstatus;
	}

	
}
