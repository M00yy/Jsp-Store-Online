package com.gm.dao;

import java.util.List;

import com.gm.domain.Manager;
import com.gm.domain.Role;

public interface ManagerDao {

	Manager findUser(String username, String password);
	/**
	 * �����û�id��ѯ��ɫ
	 * @param id
	 * @return
	 */
	List<Role> findRoleById(String id);

}
