package com.ming.hospital.admin.service;



import com.ming.hospital.admin.pojo.AdminUser;

import java.util.List;
import java.util.Map;

public interface AdminUserService {
	/**
	 * 用户登录
	 * 
	 * @param loginname
	 * @param password
	 * @return User对象
	 */
	AdminUser login(String loginname, String password);

	/**
	 * 根据id查询用户
	 * 
	 * @param id
	 * @return 用户对象
	 */
	AdminUser findUserById(Integer id);



	/**
	 * 根据id删除用户
	 * 
	 * @param id
	 */
	void removeUserById(Integer id);

	/**
	 * 修改用户
	 * 
	 * @param User
	 *            用户对象
	 */
	void modifyUser(AdminUser user);

	/**
	 * 添加用户
	 * 
	 * @param User
	 *            用户对象
	 */
	void addUser(AdminUser user);

	List<AdminUser> findUser(Map<String, Object> params);

	Integer count(AdminUser user);
}
