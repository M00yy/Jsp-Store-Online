package com.gm.service;

import java.util.List;

import com.gm.domain.Book;
import com.gm.domain.Category;
import com.gm.domain.Orders;
import com.gm.domain.OrdersItem;
import com.gm.domain.User;
import com.gm.web.bean.Page;

public interface BusinessService {

	void addCategory(Category c);

	List<Category> findAllCategories();

	void addBook(Book book);
	/**
	 * ��ѯ�����鼮�ķ�ҳ����
	 * @param pagenum
	 * @return
	 */
	Page findAllBooks(String pagenum);

	Category findCategoryById(String categoryId);
	/**
	 * ���շ����ѯ��ҳ����
	 * @param pagenum
	 * @param categoryId
	 * @return
	 */
	Page findAllBooksByCategory(String pagenum, String categoryId);

	Book findBookById(String bookId);

	void regist(User user);
	/**
	 * �ж��û��������Ƿ���ȷ�����Ҽ���ʱ�ŷ�������
	 * @param username
	 * @param password
	 * @return
	 */
	User login(String username, String password);

	User findUserByCode(String code);

	void active(User user);

	void genOrders(Orders o);

	List<Orders> findOrdersByUserId(String id);
	//��Ϊ�Ѹ���
	void paiedOrders(String r6_Order);
	//���ݶ���id��ѯ�����ͬʱ�Ѷ������������Ҳ�����
	List<OrdersItem> findOrdersItemByOrdersId(String ordersId);
	//����״̬��ѯ������Ϣ����Ҫ���û�
	List<Orders> findOrdersByStatus(int i);
	//����
	void sendBook(String ordersNum);
	//ɾ��
	void delBook(String id);
	//����
//	void showDetail(String id);

}
