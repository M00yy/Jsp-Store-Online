package com.gm.service;

import java.util.List;

import com.gm.domain.Manager;
import com.gm.domain.Menu;
import com.gm.domain.Role;

public interface ManagerService {

	Manager login(String username, String password);

	List<Menu> findAllMenus();
	/**
	 * ����U�û���id��ѯ���Ľ�ɫ
	 * @param id
	 * @return
	 */
	List<Role> findRoleByManagerId(String id);
	/**
	 * ���ݽ�ɫid��ѯ���Ĳ˵�
	 * @param id
	 * @return
	 */
	List<Menu> findMenuByRoleId(String id);

}
