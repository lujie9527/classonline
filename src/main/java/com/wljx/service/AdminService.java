package com.wljx.service;

import com.wljx.bean.Admin;

public interface AdminService {

	Admin login(String name, String password);

	void updatePwd(int id, String password);

}
