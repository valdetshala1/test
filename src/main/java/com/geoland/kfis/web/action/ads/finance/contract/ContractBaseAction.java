/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.contract;

import java.io.File;

import com.geoland.kfis.model.Contract;
import com.geoland.kfis.model.ContractDoc;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class ContractBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Sep 5, 2014, 3:25:51 PM
 */
public class ContractBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -8525438745820483913L;

	/** The contract id. */
	protected Long contractId;
	
	/** The contract. */
	protected Contract contract;
	
	/** The doc. */
	protected ContractDoc doc;
	
	/** The file. */
	protected File file;
	
	/** The finished. */
	protected boolean finished;
	
	/**
	 * Gets the contract id.
	 *
	 * @return the contractId
	 */
	public Long getContractId() {
		return contractId;
	}
	
	/**
	 * Sets the contract id.
	 *
	 * @param contractId the contractId to set
	 */
	public void setContractId(Long contractId) {
		this.contractId = contractId;
	}
	
	/**
	 * Gets the contract.
	 *
	 * @return the contract
	 */
	public Contract getContract() {
		return contract;
	}
	
	/**
	 * Sets the contract.
	 *
	 * @param contract the contract to set
	 */
	public void setContract(Contract contract) {
		this.contract = contract;
	}
	
	/**
	 * Gets the doc.
	 *
	 * @return the doc
	 */
	public ContractDoc getDoc() {
		return doc;
	}
	
	/**
	 * Sets the doc.
	 *
	 * @param doc the doc to set
	 */
	public void setDoc(ContractDoc doc) {
		this.doc = doc;
	}
	
	/**
	 * Gets the file.
	 *
	 * @return the file
	 */
	public File getFile() {
		return file;
	}
	
	/**
	 * Sets the file.
	 *
	 * @param file the file to set
	 */
	public void setFile(File file) {
		this.file = file;
	}
	
	/**
	 * Checks if is finished.
	 *
	 * @return the finished
	 */
	public boolean isFinished() {
		return finished;
	}
	
	/**
	 * Sets the finished.
	 *
	 * @param finished the finished to set
	 */
	public void setFinished(boolean finished) {
		this.finished = finished;
	}
}
