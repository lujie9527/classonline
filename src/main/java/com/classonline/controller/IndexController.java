package com.classonline.controller;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.classonline.bean.Notice;
import com.classonline.service.NoticeService;
import com.classonline.utils.JedisUtil;

@Controller
//@RequestMapping("/qiantai")
public class IndexController {
    private List<Notice> notices = null;
    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/")
    public ModelAndView index() {
        //获取公告,首先从redis获取，没有则去数据库查询
        notices = noticeService.getNotices();
        //存放在redis中
        ModelAndView mv = new ModelAndView();
        mv.addObject("notices", notices);
        mv.setViewName("/qiantai/index");
        return mv;
    }

    //显示登录页面
    @RequestMapping("/toLogin")
    public String toLogin() {
        return "/qiantai/login";
    }


    @RequestMapping("/loginOut")
    public String LoginOut() {
        return "/qiantai/index";
    }
}
