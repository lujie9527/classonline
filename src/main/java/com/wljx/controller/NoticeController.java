package com.wljx.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.PageInterceptor;
import com.wljx.bean.Notice;
import com.wljx.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	/*//测试
	@GetMapping("/4")
	@ResponseBody
	public List<Notice>  get4Notices() {
		List<Notice> list = noticeService.get4Notices();
		return list;
	}*/
	
	//根据id查询具体的哪条公告
	@RequestMapping(value="/{id}",method=RequestMethod.GET)
	public String getNoticeById(@PathVariable("id") Integer id,HttpServletRequest request) {
		Notice notice=noticeService.getNoticeById(id);
		request.setAttribute("notice", notice);
		return "/qiantai/gonggao/ggtz_detail";
	}
	@RequestMapping(value="/all",method=RequestMethod.GET)
	public String getNotices(@RequestParam(required=false,value="keyWord")String keyWord
			,@RequestParam( required=false,defaultValue="1",value="pageNum") int pageNum
			,Model model) {
		
		//在查询执行，传入当前页和每页显示多少条数据
		PageHelper.startPage(pageNum, 4);
		//条件查询
		List<Notice> notices=noticeService.findNoticeByKeyword(keyWord);
		model.addAttribute("recordCount", notices.size());
		//传入连续显示的页数
		PageInfo<Notice> pageInfo = new PageInfo<Notice>(notices, 2);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("keyWord", keyWord);
		
		return "/qiantai/gonggao/ggtz";
	}
}
