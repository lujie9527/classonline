package com.classonline.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Constants;
import com.classonline.bean.Student;
import com.classonline.bean.Teacher;
import com.classonline.service.StudentService;
import com.classonline.service.TeacherService;

@Controller
public class LoginController {
	@Autowired
	private StudentService studentService;
	@Autowired
	private TeacherService teacherService;
	@ResponseBody
	@PostMapping(value="/qiantai/login",produces="application/json;charset=UTF-8") //返回json乱码，可以这样设置
	public String qiantaiLogin(HttpServletRequest request,String name,String password,String role,String vercode) {
		String tip="";
		HttpSession session = request.getSession();
		//校验验证码是否正确
		String sessionCode = (String)session .getAttribute(Constants.KAPTCHA_SESSION_KEY);
		if(!sessionCode.equals(vercode)) {
			tip="{\"status\":201,\"msg\":\"验证码错误\"}";
			return tip;
		}
		//判断角色
		if("1".equals(role)) {
			//学生
			Student student=studentService.login(name,password);
			if(student==null) {
				tip="{\"status\":202,\"msg\":\"学生账号或密码错误\"}";
				return tip;
			}
			//存session
			session.setAttribute("user", student);
			session.setAttribute("isStu", 1);//标识学生
		}else if("0".equals(role)) {
			//老师
			Teacher teacher=teacherService.login(name,password);
			if(teacher==null) {
				tip="{\"status\":203,\"msg\":\"老师账号或密码错误\"}";
				return tip;
			}
			session.setAttribute("user", teacher);
			session.setAttribute("isStu", 2);//标识老师
		}
		tip="{\"status\":200,\"msg\":\"登录成功\"}";
		return tip;
	}
	
	@RequestMapping("/qiantai/loginOut")
	public String loginOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("user", null);
		session.setAttribute("isStu",0);
		session.invalidate();

		return "redirect:/";//重定向到根目录，并根据web.xml中配置的默认首页加载默认页面。


		
	}
}
