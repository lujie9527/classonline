package com.classonline.service;

import java.util.List;

import com.classonline.bean.Student;
import com.classonline.utils.MyDown;
import com.classonline.utils.MyJob;

public interface StudentService {

	/**
	 * 学生登录
	 * @param name
	 * @param password
	 * @return
	 */
	Student login(String name, String password);

	/**
	 * 根据班级id查询该班级的所有学生
	 * @param banjiId
	 * @return
	 */
	List<Student> getStusByBanjiId(int banjiId);

	void updateStuUrl(String id, String url);

	Student getStuById(String id);

	void updateStuPwd(String id, String password);

	MyJob  getMyJob(String stuId);

	MyDown getMyDown(String id);

	List<Student> getStus();

	void addStudent(Student stu, Integer banjiId, Integer professionId);

	void updateStudent(Student stu, Integer banjiId, Integer professionId);

	void deleteStudent(String[] ids);

	void addGrade(Integer grade,String id);


}
