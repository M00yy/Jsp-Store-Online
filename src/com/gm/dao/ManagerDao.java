package com.gm.dao;

import java.util.List;

import com.gm.domain.Manager;
import com.gm.domain.Role;

public interface ManagerDao {

	Manager findUser(String username, String password);
	/**
	 * 根据用户id查询角色
	 * @param id
	 * @return
	 */
	List<Role> findRoleById(String id);

}
