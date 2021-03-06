package com.classonline.controller;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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
import com.classonline.bean.Liuyan;
import com.classonline.bean.Pinglun;
import com.classonline.bean.Pinglun2;
import com.classonline.bean.Student;
import com.classonline.bean.Teacher;
import com.classonline.service.LiuyanService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/liuyan")
public class LiuyanController {
	@Autowired
	private LiuyanService liuyanService;
	
	@RequestMapping("/all")
	public String getAllLiuyans(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum
			,Model model,HttpServletRequest request) {
		PageHelper.startPage(pageNum, 8);
		List<Liuyan> lists=liuyanService.getALlLiuyans();
		PageInfo<Liuyan> pageInfo=new PageInfo<Liuyan>(lists,100);
		model.addAttribute("pageInfo", pageInfo);
		
		//判断，如果是老师，不显示我要留言按钮
		/*Object obj = request.getSession().getAttribute("user");
		if(obj instanceof Student) {
			model.addAttribute("isStudent", obj);
		}*/
		return "/qiantai/liuyanjiehuo/liuyanjiehuo";
	}
	
	//根据留言id查询所有评论
	@RequestMapping("/id")
	public String getPingluns(@Param("id") Integer id, Model model) {
		Liuyan liuyan=liuyanService.getLiuyanById(id);
		
		List<Pinglun> teacherPingluns=liuyanService.getTeacherPingluns(id);
		List<Pinglun2> stuPingluns=liuyanService.getStuPingluns(id);
		
		model.addAttribute("liuyan", liuyan);
		model.addAttribute("stuPingluns", stuPingluns);
		model.addAttribute("teacherPingluns", teacherPingluns);
		return "/qiantai/liuyanjiehuo/xiangqing";
		
	}
	//添加留言
//	@PostMapping("/add")
//	@ResponseBody
	@RequestMapping("/add")
	public String addLiuyan(HttpServletRequest request, String content, String title) {
		Student stu=(Student) request.getSession().getAttribute("user");
		liuyanService.addLiuyan(content,title,stu.getId());
		return "redirect:/liuyan/all";
	}
	//添加评论
	@RequestMapping("/addPinglun")
	public String addPinglun(HttpServletRequest request,RedirectAttributes redirectAttributes,
							 String content,Integer liuyanId) {
		System.out.println("留言的ID："+liuyanId);
		System.out.println("留言的内容："+content);
		HttpSession session = request.getSession();
		Integer flag=(Integer) session.getAttribute("isStu");
		if(flag==1) {
			Student stu=(Student) session.getAttribute("user");
			liuyanService.addPinglun2(content,liuyanId,stu.getId());
			redirectAttributes.addAttribute("id",liuyanId);
			return "redirect:/liuyan/id";
		}else {
			Teacher teacher=(Teacher) session.getAttribute("user");
			liuyanService.addPinglun(content,liuyanId,teacher.getId());
			redirectAttributes.addAttribute("id",liuyanId);
			return "redirect:/liuyan/id";
		}
	}
}
