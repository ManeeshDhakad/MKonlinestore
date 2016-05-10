package com.mkonlinestore.dao;

import java.util.List;

import com.mkonlinestore.model.Order;

public interface OrderDao {
	public boolean saveOrder(List<Order> orderList);
	
	public List<Order> getOrderList(int userId);
	
	public boolean updateOrder(Order order);
}
