package com.ming.hospital.service.impl;

import com.ming.hospital.dao.AdminUserMapper;
import com.ming.hospital.pojo.AdminUser;
import com.ming.hospital.service.AdminUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service
public class AdminUserServiceImpl implements AdminUserService {
	@Autowired
	private AdminUserMapper usermapper;

	@Override
	public AdminUser login(String loginname, String password) {
		return usermapper.selectByLoginnameAndPassword(loginname, password);
	}

	@Override
	public AdminUser findUserById(Integer id) {
		return usermapper.selectById(id);
	}

	@Override
	public List<AdminUser> findUser(Map<String, Object> params) {
		return usermapper.selectUsers(params);
	}

	@Override
	public Integer count(AdminUser user) {
		return usermapper.getCount(user);
	}

	@Override
	public void removeUserById(Integer id) {
		usermapper.deleteById(id);

	}

	@Override
	public void modifyUser(AdminUser user) {
		usermapper.update(user);

	}

	@Override
	public void addUser(AdminUser user) {
		usermapper.save(user);

	}

}
