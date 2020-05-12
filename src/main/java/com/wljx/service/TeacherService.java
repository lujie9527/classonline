package com.wljx.service;

import java.util.List;

import com.wljx.bean.Teacher;

public interface TeacherService {

	/**
	 * 老师登录
	 * @param name
	 * @param password
	 * @return
	 */
	Teacher login(String name, String password);

	void updateTeacherUrl(String id, String url);

	Teacher getTeacherById(String id);

	void updatePwd(String id, String password);

	List<Teacher> getTeachers();

	void addTeacher(Teacher teacher);

	void updateTeacher(Teacher teacher);

	void deleteTeacher(String[] ids);

}
