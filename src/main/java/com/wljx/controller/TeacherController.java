package com.wljx.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wljx.bean.Teacher;
import com.wljx.service.TeacherService;
import com.wljx.utils.MD5Utils;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

	@Autowired
	private TeacherService teacherService;
	@PostMapping("/updatepwd")
	@ResponseBody
	public String updatepwd(HttpServletRequest request,String password) {
		Teacher teacher = (Teacher) request.getSession().getAttribute("user");
		teacherService.updatePwd(teacher.getId(),MD5Utils.md5(password));
		return "200";
	}
}
