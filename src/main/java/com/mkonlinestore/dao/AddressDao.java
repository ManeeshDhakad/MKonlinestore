package com.mkonlinestore.dao;

import java.util.List;

import com.mkonlinestore.model.Address;

public interface AddressDao {
	public int addUserAddress(Address address);
	
	public List<Address> getAddreesList(int userId);
	
	public boolean deleteUserAddress(int addressId);
	
	public Address getAddreesById(int addressId);

}
