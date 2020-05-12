package com.wljx.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wljx.bean.Liuyan;
import com.wljx.bean.Pinglun;
import com.wljx.bean.Pinglun2;
import com.wljx.bean.Student;
import com.wljx.bean.Teacher;
import com.wljx.service.LiuyanService;

@Controller
@RequestMapping("/liuyan")
public class LiuyanController {
	@Autowired
	private LiuyanService liuyanService;
	
	@RequestMapping("/all")
	public String getAllLiuyans(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum
			,Model model,HttpServletRequest request) {
		PageHelper.startPage(pageNum, 2);
		List<Liuyan> lists=liuyanService.getALlLiuyans();
		PageInfo<Liuyan> pageInfo=new PageInfo<Liuyan>(lists,2);
		model.addAttribute("pageInfo", pageInfo);
		
		//判断，如果是老师，不显示我要留言按钮
		/*Object obj = request.getSession().getAttribute("user");
		if(obj instanceof Student) {
			model.addAttribute("isStudent", obj);
		}*/
		return "/qiantai/liuyanjiehuo/liuyanjiehuo";
	}
	
	//根据留言id查询所有评论
	@RequestMapping("/id/{id}")
	public String getPingluns(@PathVariable ("id")int id,Model model) {
		Liuyan liuyan=liuyanService.getLiuyanById(id);
		
		List<Pinglun> teacherPingluns=liuyanService.getTeacherPingluns(id);
		List<Pinglun2> stuPingluns=liuyanService.getStuPingluns(id);
		
		model.addAttribute("liuyan", liuyan);
		model.addAttribute("stuPingluns", stuPingluns);
		model.addAttribute("teacherPingluns", teacherPingluns);
		return "/qiantai/liuyanjiehuo/xiangqing";
		
	}
	//添加留言
	@PostMapping("/add")
	@ResponseBody
	public String addLiuyan(HttpServletRequest request, String content, String title) {
		Student stu=(Student) request.getSession().getAttribute("user");
		liuyanService.addLiuyan(content,title,stu.getId());
		return "200";
	}
	//添加评论
	@PostMapping("/addPinglun")
	@ResponseBody
	public String addPinglun(HttpServletRequest request,String content,Integer liuyanId) {
		HttpSession session = request.getSession();
		Integer flag=(Integer) session.getAttribute("isStu");
		if(flag!=null) {
			Student stu=(Student) session.getAttribute("user");
			liuyanService.addPinglun2(content,liuyanId,stu.getId());
			return "200";
		}else {
			Teacher teacher=(Teacher) session.getAttribute("user");
			liuyanService.addPinglun(content,liuyanId,teacher.getId());
			return "200";
		}
	}
}
