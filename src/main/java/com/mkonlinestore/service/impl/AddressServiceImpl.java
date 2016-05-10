package com.mkonlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mkonlinestore.common.Constants;
import com.mkonlinestore.dao.AddressDao;
import com.mkonlinestore.dao.impl.AddressDaoImpl;
import com.mkonlinestore.dao.impl.ProductDaoImpl;
import com.mkonlinestore.model.Address;
import com.mkonlinestore.service.AddressService;

@Service
public class AddressServiceImpl implements AddressService {
	@Autowired
	private AddressDao addressDao; 
	
	@Transactional
	public int addUserAddress(Address address) {
		return addressDao.addUserAddress(address);
	}
	
	@Transactional
	public List<Address> getAddreesList(int userId) {
		return addressDao.getAddreesList(userId);
	}

	@Transactional
	public boolean deleteUserAddress(int addressId) {
		return addressDao.deleteUserAddress(addressId);
	}

}
