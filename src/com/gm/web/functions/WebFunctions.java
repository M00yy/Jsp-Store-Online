package com.gm.web.functions;

import com.gm.domain.Category;
import com.gm.service.BusinessService;
import com.gm.service.impl.BusinessServiceImpl;

public class WebFunctions {
	private static BusinessService s = new BusinessServiceImpl();
	public static String showCategoryName(String categoryId){
		Category c = s.findCategoryById(categoryId);
		if(c!=null)
			return c.getName();
		return null;
	}
}
