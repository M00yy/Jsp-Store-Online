package com.gm.dao;

import java.util.List;

import com.gm.domain.Book;

public interface BookDao {

	void addBook(Book book);

	int getTotalRecords();

	List findBooksPageRecords(int startindex, int pagesize);
	/**
	 * ���շ����ѯ��¼����
	 * @param categoryId
	 * @return
	 */
	int getTotalRecords(String categoryId);
	/**
	 * ���շ����ѯ��ҳ����
	 * @param categoryId
	 * @return
	 */
	List findBooksPageRecords(int startindex, int pagesize, String categoryId);

	Book findBookById(String bookId);
	
	void delBook(String id);

//	void showDetail(String id);
}
