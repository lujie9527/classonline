package com.wljx.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wljx.bean.Banji;
import com.wljx.bean.Job;
import com.wljx.bean.Profession;
import com.wljx.bean.Student;
import com.wljx.bean.Teacher;
import com.wljx.service.BanjiService;
import com.wljx.service.JobService;
import com.wljx.service.ProfessionService;
import com.wljx.utils.TeacherPigai;
import com.wljx.utils.TeacherTijiao;
import com.wljx.utils.TimeUtils;

@Controller
@RequestMapping("/job")
public class JobController {
	@Autowired
	private JobService jobService;
	@Autowired
	private ProfessionService professionService;
	@Autowired
	private BanjiService banjiService;
	@RequestMapping("/all")
	public String getJobs(HttpServletRequest request,Model model,
			@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
			@RequestParam(required=false) String name,
			@RequestParam(required=false,defaultValue="-1") int professionId,
			@RequestParam(required=false,defaultValue="-1") int banjiId) {
		//判断用户角色是学生还是老师
		Object user=request.getSession().getAttribute("user");
		if(user instanceof Student) {
			Student stu=(Student) user;
			//显示下载作业页面，加分页
			PageHelper.startPage(pageNum, 4);//在查询数据之前 传入当前页数和每页显示多少条数据
			List<Job> jobs=jobService.getAllJobs(stu.getBanji().getId());
			PageInfo<Job> pageInfo=new PageInfo<Job>(jobs, 2);
			
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("banjiName", stu.getBanji().getName());
			return "/qiantai/zuoye/stu_xiazai_zuoye";
		}else{
			//老师
			Teacher teacher=(Teacher) user;
			//条件查询
			List<TeacherPigai> lists=jobService.getStuJobs(teacher.getId(), name, professionId, banjiId);
			//获取所有专业
			List<Profession> professions = professionService.getProfessions();
			model.addAttribute("professions", professions);
			//获取所有班级
			List<Banji> banjis = banjiService.getBanjis();
			model.addAttribute("banjis", banjis);
			model.addAttribute("lists", lists);
			model.addAttribute("name", name);
			model.addAttribute("banjiId", banjiId);
			model.addAttribute("professionId", professionId);
			return "/qiantai/zuoye/teacher_pigai_zuoye";
		}
		
	}
	
	//显示老师发布作业页面
	@RequestMapping("/teacher/show_fabu")
	public String showTeacherFabu(HttpServletRequest request) {
		//查询所有专业  老师发布页面
		List<Profession> professions=professionService.getProfessions();
		request.setAttribute("professions", professions);
		return "/qiantai/zuoye/teacher_fabu_zuoye";
	}
	//老师发布作业
	@PostMapping("/teacher/fabu")
	@ResponseBody
	public String teacherFabu(HttpServletRequest request,HttpServletResponse response
			,String name,Integer professionId,Integer banjiId,String lastTime ,String url) throws IOException {
		Teacher teacher=(Teacher) request.getSession().getAttribute("user");
		jobService.teacherFabu(teacher.getId(),name,professionId,banjiId,url,lastTime);
		return "200";
	}
	
	//显示老师提交作业页面
	@RequestMapping("/teacher/show_tijiao")
	public String showTeacherTijiao(HttpServletRequest request) {
		//查询该老师布置的作业（未完成的）
		Teacher teacher=(Teacher) request.getSession().getAttribute("user");
		List<TeacherTijiao> lists=jobService.findJobsForTeacherTijiao(teacher.getId());
		Set<Integer> banjiIdSet=new HashSet<Integer>();
		Set<Integer> professionSet=new HashSet<Integer>();
		for(TeacherTijiao ttj:lists) {
			banjiIdSet.add(ttj.getBanjiId());
			professionSet.add(ttj.getProfessionId());
		}
		
		//查询班级
		List<Banji> banjis=new ArrayList<Banji>();
		for(Integer banjiId:banjiIdSet) {
			Banji b=banjiService.getBanjiById(banjiId);
			banjis.add(b);
		}
		//查询专业
		List<Profession> professions=new ArrayList<Profession>();
		for(Integer professionId:professionSet) {
			Profession p=professionService.getProfessionById(professionId);
			professions.add(p);
		}
		request.setAttribute("professions", professions);
		request.setAttribute("banjis", banjis);
		request.setAttribute("lists", lists);
		return "/qiantai/zuoye/teacher_tijiao_zuoye";
	}
	
	//老师提交作业
	@RequestMapping("/teacher/tijiao")
	@ResponseBody
	public String teacherTijiao(double grade,int jobId,int professionId,int banjiId,String stuId,String url,HttpServletRequest request) {
		Teacher teacher=(Teacher) request.getSession().getAttribute("user");
		jobService.teacherTijiao(grade,teacher.getId(),jobId,professionId,banjiId,stuId,url);
		return "200";
	}
	
	//显示学生提交页面
	@RequestMapping("/stu/show_tijiao")
	public String show_stu_tijiao(HttpServletRequest request) {
		Student stu=(Student) request.getSession().getAttribute("user");
		List<Job> jobs=jobService.getJobsByBanjiId(stu.getBanji().getId());
		request.setAttribute("jobs", jobs);
		return "/qiantai/zuoye/stu_tijiao_zuoye";
	}
	@PostMapping("/stu/tijiao")
	@ResponseBody
	public String stu_tijiao(String url,Integer jobId,HttpServletRequest request) {
		Student stu=(Student) request.getSession().getAttribute("user");
		String currentTime=TimeUtils.getCurrentTime();
		jobService.stuTijiao(url,currentTime,stu.getId(),jobId);
		return "200";
	}
}
