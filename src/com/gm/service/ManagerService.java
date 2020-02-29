package com.gm.service;

import java.util.List;

import com.gm.domain.Manager;
import com.gm.domain.Menu;
import com.gm.domain.Role;

public interface ManagerService {

	Manager login(String username, String password);

	List<Menu> findAllMenus();
	/**
	 * 根据U用户的id查询他的角色
	 * @param id
	 * @return
	 */
	List<Role> findRoleByManagerId(String id);
	/**
	 * 根据角色id查询他的菜单
	 * @param id
	 * @return
	 */
	List<Menu> findMenuByRoleId(String id);

}
