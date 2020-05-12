package com.wljx.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wljx.bean.Student;
import com.wljx.service.StudentService;
import com.wljx.utils.MD5Utils;
import com.wljx.utils.MyDown;
import com.wljx.utils.MyJob;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/banjiId")
	@ResponseBody
	public List<Student> getStusByBanjiId(int banjiId){
		List<Student> stus=studentService.getStusByBanjiId(banjiId);
		return stus;
	}
	
	@PostMapping("/updatepwd")
	@ResponseBody
	public String updatepwd(HttpServletRequest request ,String password) {
		if(StringUtils.isBlank(password))return "201"; //新密码为空
		Student stu = (Student) request.getSession().getAttribute("user");
		if(stu.getPassword().equals(password))return "202"; //新旧密码一致，用户没修改
		
		studentService.updateStuPwd(stu.getId(),MD5Utils.md5(password));
		return "200";
	}
	
	@RequestMapping("/myjob")
	@ResponseBody
	public MyJob myjob(HttpServletRequest request) {
		Student stu=(Student) request.getSession().getAttribute("user");
		MyJob myjob=studentService.getMyJob(stu.getId());
		return myjob;
	}
	
	@RequestMapping("/mydown")
	@ResponseBody
	public MyDown mydown(HttpServletRequest request) {
		Student stu=(Student) request.getSession().getAttribute("user");
		MyDown myDown=studentService.getMyDown(stu.getId());
		return myDown;
	}
}
