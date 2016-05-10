package com.mkonlinestore.service;

import java.util.List;

import com.mkonlinestore.model.Address;

public interface AddressService {
	public int addUserAddress(Address address);
	
	public List<Address> getAddreesList(int userId);
	
	public boolean deleteUserAddress(int addressId);
}
