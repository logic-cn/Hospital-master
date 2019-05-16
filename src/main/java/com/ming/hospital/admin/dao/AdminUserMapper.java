package com.ming.hospital.admin.dao;

import com.ming.hospital.admin.pojo.AdminUser;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AdminUserMapper {

	// 根据登录名和密码查询员工
	AdminUser selectByLoginnameAndPassword(@Param("loginname") String loginname, @Param("password") String password);

	// 根据id查询用户
	AdminUser selectById(Integer id);

	List<AdminUser> selectUsers(Map<String, Object> params);

	// 根据参数查询用户总数
	Integer getCount(AdminUser user);

	// 根据id删除用户
	void deleteById(Integer id);

	// 动态修改用户
	void update(AdminUser user);

	// 动态查询
	List<AdminUser> selectByPages(Map<String, Object> params);

	// 根据参数查询用户总数
	Integer getCount(Map<String, Object> params);

	// 动态插入用户
	void save(AdminUser user);

}
