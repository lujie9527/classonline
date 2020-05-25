package com.classonline.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.classonline.bean.Admin;
import com.classonline.mapper.AdminMapper;
import com.classonline.service.AdminService;
@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper adminMapper;
	@Override
	public Admin login(String name, String password) {
		return adminMapper.login(name,password);
	}
	@Override
	public void updatePwd(int id, String password) {
		adminMapper.updatePwd(id,password);
	}

}
