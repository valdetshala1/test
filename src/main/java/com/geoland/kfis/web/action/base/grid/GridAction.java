package com.geoland.kfis.web.action.base.grid;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Key;
import java.util.List;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.exception.BusinessException;
import com.geoland.kfis.model.AttendanceRecord;
import com.geoland.kfis.model.Decision;
import com.geoland.kfis.model.DecisionDoc;
import com.geoland.kfis.model.DecisionStatus;
import com.geoland.kfis.model.DecisionType;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.HrmAnnualPlan;
import com.geoland.kfis.model.HrmAnnualPlanDoc;
import com.geoland.kfis.model.HrmAnnualPlanStatus;
import com.geoland.kfis.model.Leave;
import com.geoland.kfis.model.LeaveEntitlement;
import com.geoland.kfis.model.LeaveType;
import com.geoland.kfis.model.OfficalTravel;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.AttendanceRecordDAO;
import com.geoland.kfis.persistence.dao.services.DecisionDAO;
import com.geoland.kfis.persistence.dao.services.DecisionDocDAO;
import com.geoland.kfis.persistence.dao.services.DecisionStatusDAO;
import com.geoland.kfis.persistence.dao.services.DecisionTypeDAO;
import com.geoland.kfis.persistence.dao.services.EmployeeDAO;
import com.geoland.kfis.persistence.dao.services.HrmAnnualPlanDAO;
import com.geoland.kfis.persistence.dao.services.HrmAnnualPlanDocDAO;
import com.geoland.kfis.persistence.dao.services.HrmAnnualPlanStatusDAO;
import com.geoland.kfis.persistence.dao.services.LeaveDAO;
import com.geoland.kfis.persistence.dao.services.LeaveEntitlementDAO;
import com.geoland.kfis.persistence.dao.services.LeaveTypeDAO;
import com.geoland.kfis.persistence.dao.services.OfficialTravelDAO;
import com.geoland.kfis.persistence.dao.services.PersonDAO;
import com.geoland.kfis.persistence.hibernate.usertypes.Hrmannplanstatus;
import com.geoland.kfis.persistence.hibernate.usertypes.Hrmdecisionstatus;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;

// TODO: Auto-generated Javadoc
/**
 *  Grid Action Class Provides data in JSON format.
 *
 * @author GEO&LAND
 * @Version 1.0
 */
public class GridAction extends GridBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Kfis docs.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void kfisDocs() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String encryptedtableName = request.getParameter("tableName");
            Key aesKey = new SecretKeySpec(keyAesAsString.getBytes(), "AES");
            String tableName = decrypt(encryptedtableName,aesKey);
			String entityId=request.getParameter("entityId");
			JSONObject data = new JSONObject();
			JSONArray rows = new JSONArray();
			if(StringUtils.isNotEmpty(tableName) && StringUtils.isNumeric(entityId)){
				rows=readContentFromAlfresco(tableName,entityId);
			}
			out.flush();
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("GridAction.kfisDocs", e);
			throw new BusinessException("GridAction.kfisDocs", e);
		} finally {
			out.close();
		}
	}
	

}

