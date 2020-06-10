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

@Controller
//@RequestMapping("/qiantai")
public class IndexController {
    private List<Notice> notices = null;
    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/")
    public ModelAndView index() {

        notices = noticeService.getNotices();

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
