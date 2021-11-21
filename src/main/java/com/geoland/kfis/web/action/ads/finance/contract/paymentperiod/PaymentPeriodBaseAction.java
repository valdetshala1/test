/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.contract.paymentperiod;

import java.io.File;

import com.geoland.kfis.model.ContractDoc;
import com.geoland.kfis.model.PaymentPeriod;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class PaymentPeriodBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Sep 8, 2014, 9:14:39 AM
 */
public class PaymentPeriodBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 970364106741835323L;

	/** The payment id. */
	protected Long paymentId;
	
	/** The payment. */
	protected PaymentPeriod payment;
	
	/** The doc. */
	protected ContractDoc doc;
	
	/** The file. */
	protected File file;
	
	/**
	 * Gets the payment id.
	 *
	 * @return the paymentId
	 */
	public Long getPaymentId() {
		return paymentId;
	}
	
	/**
	 * Sets the payment id.
	 *
	 * @param paymentId the paymentId to set
	 */
	public void setPaymentId(Long paymentId) {
		this.paymentId = paymentId;
	}
	
	/**
	 * Gets the payment.
	 *
	 * @return the payment
	 */
	public PaymentPeriod getPayment() {
		return payment;
	}
	
	/**
	 * Sets the payment.
	 *
	 * @param payment the payment to set
	 */
	public void setPayment(PaymentPeriod payment) {
		this.payment = payment;
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
}
