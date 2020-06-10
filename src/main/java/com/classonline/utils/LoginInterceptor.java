package com.classonline.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

//拦截器
public class LoginInterceptor implements HandlerInterceptor {
	@Override
	//request(需要)是获取用户的请求,response(响应)处理用户请求
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Object user = request.getSession().getAttribute("user");
		if(user==null) {
			//拦截
			response.sendRedirect(request.getContextPath()+"/toLogin");
			//sendRedirect()方法是重定向网页
			return false;
			//返回false的话直接触发afterCompletion()方法
		}else {
			return true;//放行
		}
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
