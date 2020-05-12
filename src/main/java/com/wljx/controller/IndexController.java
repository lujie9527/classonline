package com.wljx.controller;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.wljx.bean.Notice;
import com.wljx.service.NoticeService;
import com.wljx.utils.JedisUtil;

@Controller
public class IndexController {
	private List<Notice> notices=null;
	@Autowired
	private NoticeService noticeService;
	@RequestMapping("/")
	public ModelAndView index() {
		//获取公告,首先从redis获取，没有则去数据库查询
		String redis_notices_json = JedisUtil.get("redis_notices");
			
			if(StringUtils.isNotBlank(redis_notices_json)) {
				notices=new Gson().fromJson(redis_notices_json, new TypeToken<List<Notice>>() {}.getType());
			}else {
				notices = noticeService.get4Notices();
				//存放在redis中
				String json=new Gson().toJson(notices);
				try {
					JedisUtil.setEx("redis_notices", json, 259200);//3天
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("notices", notices);
		mv.setViewName("/qiantai/index");
		return mv;
	}
	
	//显示登录页面
	@RequestMapping("/toLogin")
	public String toLogin() {
		return "/qiantai/login";
	}
}
