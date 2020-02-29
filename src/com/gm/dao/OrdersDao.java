package com.gm.dao;

import java.util.List;

import com.gm.domain.Orders;
import com.gm.domain.OrdersItem;

public interface OrdersDao {

	void addOrders(Orders o);

	List<Orders> findOrdersByUserId(String userId);

	void updateOrders(String ordersnum,int status);

	List<OrdersItem> findOrdersItemByOrdersId(String ordersId);

	List<Orders> findOrdersByStatus(int i);

}
