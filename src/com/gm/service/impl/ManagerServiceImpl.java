package com.gm.service.impl;

import java.util.List;

import com.gm.dao.ManagerDao;
import com.gm.dao.MenuDao;
import com.gm.dao.RoleDao;
import com.gm.dao.impl.ManagerDaoImpl;
import com.gm.dao.impl.MenuDaoImpl;
import com.gm.dao.impl.RoleDaoImpl;
import com.gm.domain.Manager;
import com.gm.domain.Menu;
import com.gm.domain.Role;
import com.gm.service.ManagerService;

public class ManagerServiceImpl implements ManagerService {
	private ManagerDao mDao = new ManagerDaoImpl();
	private MenuDao menuDao = new MenuDaoImpl();
	private RoleDao rDao = new RoleDaoImpl();
	public Manager login(String username, String password) {
		return mDao.findUser(username,password);
	}
	public List<Menu> findAllMenus() {
		return menuDao.findAllMenus();
	}
	public List<Role> findRoleByManagerId(String id) {
		return mDao.findRoleById(id);
	}
	public List<Menu> findMenuByRoleId(String id) {
		return rDao.findMenuByRoleId(id);
	}
	
}
