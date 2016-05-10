package com.mkonlinestore.service;

import java.util.List;

import com.mkonlinestore.model.Order;

public interface OrderService {
	public boolean saveOrder(List<Order> orderList);
	
	public List<Order> getOrderList(int userId);
	
	public boolean updateOrder(Order order);

}
