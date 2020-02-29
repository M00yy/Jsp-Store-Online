package com.gm.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.gm.dao.MenuDao;
import com.gm.domain.Menu;
import com.gm.exception.DaoException;
import com.gm.util.DBCPUtil;

public class MenuDaoImpl implements MenuDao {
	private QueryRunner qr = new QueryRunner(DBCPUtil.getDataSource());
	public List<Menu> findAllMenus() {
		try {
			return qr.query("select * from menu", new BeanListHandler<Menu>(Menu.class));
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException(e);
		}
	}

}
