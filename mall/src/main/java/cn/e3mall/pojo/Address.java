package cn.e3mall.pojo;

import java.io.Serializable;
import java.util.Date;

public class Address implements Serializable{
	private String provinceId;

	private String cityId;

	private String townId;

	private String mobile;

	private String address;

	private String contact;

	private String alias;

	public String getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String getTownId() {
		return townId;
	}

	public void setTownId(String townId) {
		this.townId = townId;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}
}
