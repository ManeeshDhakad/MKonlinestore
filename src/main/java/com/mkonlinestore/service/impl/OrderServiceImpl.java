package com.mkonlinestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mkonlinestore.dao.OrderDao;
import com.mkonlinestore.model.Order;
import com.mkonlinestore.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao; 
	
	@Transactional
	@Override
	public boolean saveOrder(List<Order> orderList) {
		return orderDao.saveOrder(orderList);
	}

	@Transactional
	@Override
	public List<Order> getOrderList(int userId) {
		return orderDao.getOrderList(userId);
	}

	@Transactional
	@Override
	public boolean updateOrder(Order order) {
		return orderDao.updateOrder(order);
	}

}
