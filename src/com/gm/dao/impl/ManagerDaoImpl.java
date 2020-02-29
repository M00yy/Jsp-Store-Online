package com.gm.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.gm.dao.ManagerDao;
import com.gm.domain.Manager;
import com.gm.domain.Role;
import com.gm.exception.DaoException;
import com.gm.util.DBCPUtil;

public class ManagerDaoImpl implements ManagerDao {
	private QueryRunner qr = new QueryRunner(DBCPUtil.getDataSource());
	public Manager findUser(String username, String password) {
		try {
			return qr.query("select * from manager where username=? and password=?", new BeanHandler<Manager>(Manager.class),username,password);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException(e);
		}
	}
	public List<Role> findRoleById(String id) {
		try {
			return qr.query("select * from role where id in (select r_id from role_manager where manager_id=?)", new BeanListHandler<Role>(Role.class),id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException(e);
		}
	}

}
