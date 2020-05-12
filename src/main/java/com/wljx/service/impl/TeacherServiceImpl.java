package com.wljx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wljx.bean.Teacher;
import com.wljx.mapper.TeacherMapper;
import com.wljx.service.TeacherService;
import com.wljx.utils.MD5Utils;
@Service
public class TeacherServiceImpl implements TeacherService {
	@Autowired
	private TeacherMapper teacherMapper;
	@Override
	public Teacher login(String name, String password) {
		return teacherMapper.login(name,MD5Utils.md5(password));
	}
	@Override
	public void updateTeacherUrl(String id, String url) {
		teacherMapper.updateTeacherUrl(id,url);
	}
	@Override
	public Teacher getTeacherById(String id) {
		// TODO Auto-generated method stub
		return teacherMapper.getTeacherById(id);
	}
	@Transactional
	@Override
	public void updatePwd(String id, String password) {
		// TODO Auto-generated method stub
		teacherMapper.updateTeacherPwd(id, password);
	}
	@Override
	public List<Teacher> getTeachers() {
		return teacherMapper.getTeachers();
	}
	@Transactional
	@Override
	public void addTeacher(Teacher teacher) {
		teacher.setPassword(MD5Utils.md5(teacher.getPassword()));
		teacherMapper.addTeacher(teacher.getId(),teacher.getName(),teacher.getPassword(),teacher.getAge(),teacher.getSex(),teacher.getUrl());
	}
	@Transactional
	@Override
	public void updateTeacher(Teacher teacher) {
		if(teacher.getPassword()!=null && teacher.getPassword().length()!=32) {
			teacher.setPassword(MD5Utils.md5(teacher.getPassword()));
		}
		teacherMapper.updateTeacher(teacher.getId(),teacher.getName(),teacher.getPassword(),teacher.getSex(),teacher.getAge(),teacher.getUrl());
	}
	@Transactional
	@Override
	public void deleteTeacher(String[] ids) {
		for(String id :ids) {
			teacherMapper.deleteTeacher(id);
		}
	}

}
