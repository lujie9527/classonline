package com.classonline.utils;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;


public class IPUtils {
	/**
	 * 获取客户端ip
	 * 其实是记录访问者登录的真实ip
	 * @param request
	 * @return
	 */
	public static String getClientIP(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");//获取请求头的头部信息
		  if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){//isNotEmpty(ip)判断是否为空，
		  	//equalsIgnoreCase(ip)判断是否为“unknown”，不区分大小写
			  //多次反向代理后会有多个ip值，第一个ip才是真实ip
			  int index = ip.indexOf(",");
			  if(index != -1){
				  return ip.substring(0,index);
			  }else{
				   return ip;
			  }
		  }
		  ip = request.getHeader("X-Real-IP");
		  if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
			  return ip;
		  }
		 return request.getRemoteAddr();
	}
}
