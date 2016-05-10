package com.mkonlinestore.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "address")
public class Address {

	@Id
    @Column(name="addressId")
    @GeneratedValue
	private int addressId;
	
	@Column(name="userId")
	private int userId;
	
	@Column(name="addressName")
	private String addressName;
	
	@Column(name="addressStreet")
	private String addressStreet;
	
	@Column(name="addressLandmark")
	private String addressLandmark;
	
	@Column(name="addressCity")
	private String addressCity;
	
	@Column(name="addressState")
	private String addressState;
	
	@Column(name="addressCountry")
	private String addressCountry;
	
	@Column(name="addressMobile")
	private String addressMobile;
	
	
	public Address() {}

	public Address(int addressId, int userId, String addressName,
			String addressStreet, String addressLandmark, String addressCity,
			String addressState, String addressCountry, String addressMobile) {
		super();
		this.addressId = addressId;
		this.userId = userId;
		this.addressName = addressName;
		this.addressStreet = addressStreet;
		this.addressLandmark = addressLandmark;
		this.addressCity = addressCity;
		this.addressState = addressState;
		this.addressCountry = addressCountry;
		this.addressMobile = addressMobile;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public String getAddressStreet() {
		return addressStreet;
	}

	public void setAddressStreet(String addressStreet) {
		this.addressStreet = addressStreet;
	}

	public String getAddressLandmark() {
		return addressLandmark;
	}

	public void setAddressLandmark(String addressLandmark) {
		this.addressLandmark = addressLandmark;
	}

	public String getAddressCity() {
		return addressCity;
	}

	public void setAddressCity(String addressCity) {
		this.addressCity = addressCity;
	}

	public String getAddressState() {
		return addressState;
	}

	public void setAddressState(String addressState) {
		this.addressState = addressState;
	}

	public String getAddressCountry() {
		return addressCountry;
	}

	public void setAddressCountry(String addressCountry) {
		this.addressCountry = addressCountry;
	}

	public String getAddressMobile() {
		return addressMobile;
	}

	public void setAddressMobile(String addressMobile) {
		this.addressMobile = addressMobile;
	}
	
//	public String toString(){
//	  return "Address Details: " + addressId + " " + userId + " " + addressName + " " + orderCode + " " + productQuantity + " " + orderStatus + " " + addressId;  
//	} 
//	
}