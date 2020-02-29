package com.gm.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.gm.dao.CategoryDao;
import com.gm.domain.Category;
import com.gm.exception.DaoException;
import com.gm.util.DBCPUtil;

public class CategoryDaoImpl implements CategoryDao {
	private QueryRunner qr = new QueryRunner(DBCPUtil.getDataSource());

	public void addCategory(Category c) {
		try {
			qr.update(
					"insert into category (id,name,description) values(?,?,?)",
					c.getId(), c.getName(), c.getDescription());
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException(e);
		}
	}

	public List<Category> findAllCategories() {
		try {
			return qr.query("select * from category",
					new BeanListHandler<Category>(Category.class));
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException(e);
		}
	}

	public Category findCategoryById(String categoryId) {
		try {
			return qr.query("select * from category where id=?",
					new BeanHandler<Category>(Category.class),categoryId);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException(e);
		}
	}

}
