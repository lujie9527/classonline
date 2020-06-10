package com.classonline.service;

import com.classonline.bean.Admin;

public interface AdminService {


	Admin login(String name, String password);


	void updatePwd(int id, String password);

}
