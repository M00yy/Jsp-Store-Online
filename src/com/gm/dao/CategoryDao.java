package com.gm.dao;

import java.util.List;

import com.gm.domain.Category;

public interface CategoryDao {

	void addCategory(Category c);

	List<Category> findAllCategories();

	Category findCategoryById(String categoryId);

}
