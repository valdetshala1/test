package com.geoland.kfis.web.action.ads.logistic.vehicle.device;

import java.util.List;

import com.geoland.kfis.model.Devices;
import com.geoland.kfis.model.FuelConsum;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class DeviceBaseAction.
 */
public class DeviceBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 7547303282158622915L;
	
	/** The vehicle device id. */
	protected Long vehicleDeviceId;
	
	/** The devices. */
	protected Devices devices;
	
	/** The device id list. */
	protected List<Devices> deviceIdList;
	
	/** The vehicle active device. */
	protected Long vehicleActiveDevice;
	
	/** The vehicle id dev. */
	protected Long vehicleIdDev;
	
	/** The plate number. */
	protected String plateNumber;
	
	/**
	 * Gets the vehicle id dev.
	 *
	 * @return the vehicle id dev
	 */
	public Long getVehicleIdDev() {
		return vehicleIdDev;
	}
	
	/**
	 * Sets the vehicle id dev.
	 *
	 * @param vehicleIdDev the new vehicle id dev
	 */
	public void setVehicleIdDev(Long vehicleIdDev) {
		this.vehicleIdDev = vehicleIdDev;
	}
	
	/**
	 * Gets the vehicle device id.
	 *
	 * @return the vehicle device id
	 */
	public Long getVehicleDeviceId() {
		return vehicleDeviceId;
	}
	
	/**
	 * Sets the vehicle device id.
	 *
	 * @param vehicleDeviceId the new vehicle device id
	 */
	public void setVehicleDeviceId(Long vehicleDeviceId) {
		this.vehicleDeviceId = vehicleDeviceId;
	}
	
	/**
	 * Gets the devices.
	 *
	 * @return the devices
	 */
	public Devices getDevices() {
		return devices;
	}
	
	/**
	 * Sets the devices.
	 *
	 * @param devices the new devices
	 */
	public void setDevices(Devices devices) {
		this.devices = devices;
	}
	
	/**
	 * Gets the device id list.
	 *
	 * @return the device id list
	 */
	public List<Devices> getDeviceIdList() {
		return deviceIdList;
	}
	
	/**
	 * Sets the device id list.
	 *
	 * @param deviceIdList the new device id list
	 */
	public void setDeviceIdList(List<Devices> deviceIdList) {
		this.deviceIdList = deviceIdList;
	}
	
	/**
	 * Gets the vehicle active device.
	 *
	 * @return the vehicle active device
	 */
	public Long getVehicleActiveDevice() {
		return vehicleActiveDevice;
	}
	
	/**
	 * Sets the vehicle active device.
	 *
	 * @param vehicleActiveDevice the new vehicle active device
	 */
	public void setVehicleActiveDevice(Long vehicleActiveDevice) {
		this.vehicleActiveDevice = vehicleActiveDevice;
	}
	
	/**
	 * Gets the plate number.
	 *
	 * @return the plate number
	 */
	public String getPlateNumber() {
		return plateNumber;
	}
	
	/**
	 * Sets the plate number.
	 *
	 * @param plateNumber the new plate number
	 */
	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}
	
	
}
