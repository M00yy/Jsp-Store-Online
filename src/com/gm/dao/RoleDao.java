package com.gm.dao;

import java.util.List;

import com.gm.domain.Menu;

public interface RoleDao {

	List<Menu> findMenuByRoleId(String id);

}
