package com.classonline.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.classonline.bean.*;
import com.classonline.service.JobService;
import com.classonline.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.classonline.service.BanjiService;
import com.classonline.service.ProfessionService;
import org.springframework.web.servlet.ModelAndView;

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
	public String getJobs(HttpServletRequest request,Model model) {
		//判断用户角色是学生还是老师
		Object user=request.getSession().getAttribute("user");
		if(user instanceof Student) {
			Student stu=(Student) user;
			//显示下载作业页面，加分页
//			PageHelper.startPage(pageNum, 8);
			//在查询数据之前 传入当前页数和每页显示多少条数据
//			List<Job> jobs= jobService.getAllJobs(stu.getBanji().getId());

			List<Job> jobs = jobService.getJobs();
			model.addAttribute("jobs",jobs);
			model.addAttribute("banjiName", stu.getBanji().getName());
			return "/qiantai/zuoye/stu_find_zuoye2";
		}else{

			//获取作业
            List<Job> jobs = jobService.getJobs();

			model.addAttribute("jobs",jobs);
			System.out.println("这里是获取作业："+jobs);

			return "qiantai/zuoye/teacher_look_jobList2";
		}

	}
	//学生获取作业列表
	@RequestMapping("/stuGetJobList")
	public ModelAndView stuGetJobList(){
		ModelAndView modelAndView = new ModelAndView();
		List<Job> jobs = jobService.getJobs();
		modelAndView.addObject("jobs",jobs);
		modelAndView.setViewName("/qiantai/zuoye/stu_find_zuoye2");
		return modelAndView;
	}

	//学生作答
	@RequestMapping("/doJob")
	public ModelAndView doHomework(@RequestParam("jobId") Integer jobId){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("jobId",jobId);
		Job job = jobService.getJobById(jobId);
		modelAndView.addObject("job",job);
		modelAndView.setViewName("/qiantai/zuoye/stu_tijiao_zuoye2");
		return modelAndView;
	}

	//学生提交作业
	@RequestMapping(value = "/stuSubmitJob" , method = RequestMethod.POST)

	public String stuSubmitJob(HttpServletRequest request,String homework ,Integer jobId){
        System.out.println("我的JOBID："+jobId);
		String currentTime=TimeUtils.getCurrentTime();

		Student student = (Student) request.getSession().getAttribute("user");

		jobService.stuTijiao(homework,currentTime,student.getId(),student.getName(),jobId);
		return "redirect:/job/stuHomework";
	}

	//学生查看自己已提交的作业
	@RequestMapping("/stuHomework")
	public ModelAndView stuHomework(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		Student student = (Student) request.getSession().getAttribute("user");
		List<StuJob> stuJobList = jobService.getStuHomework(student.getId());
		modelAndView.addObject("stuJobList",stuJobList);
		modelAndView.setViewName("/qiantai/zuoye/stu_myHomework");
		return modelAndView;
	}


	//显示老师发布作业页面
	@RequestMapping("/teacher/show_fabu")
	public String showTeacherFabu(HttpServletRequest request,Model model) {
		//查询所有专业  老师发布页面
		List<Profession> professions=professionService.getProfessions();
		List<Banji> banjis = banjiService.getBanjis();
		model.addAttribute("professions", professions);
		model.addAttribute("banjis",banjis);
		return "/qiantai/zuoye/teacher_fabu_zuoye2";
	}


	//老师发布作业
	@RequestMapping(value = "/teacher/fabu", method = RequestMethod.POST)
	public String teacherFabu(HttpServletRequest request,String jobTitle,String jobDetail, String lastTime,
							  Integer banjiId, Integer professionId) throws IOException {

		System.out.println("题目详情是什么："+jobDetail);
		Teacher teacher=(Teacher) request.getSession().getAttribute("user");

		jobService.teacherFabu(jobTitle,jobDetail,lastTime,teacher.getId(),banjiId,professionId);
		return "redirect:/job/showJobList";
	}

	//老师作业列表
	@RequestMapping("/showJobList")
	public String showJobList(Model model){
		List<Job> jobs = jobService.getJobs();
		model.addAttribute("jobs",jobs);
		return "qiantai/zuoye/teacher_look_jobList2";
	}

	//老师查看一个作业里学生提交的作业
	@RequestMapping("/Detail")
	public ModelAndView getJobDetail(@RequestParam("jobId") Integer jobId){

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("jobId",jobId);
        List<StuJob> stuJobList = jobService.getStuJobById(jobId);
		modelAndView.addObject("stuJobList",stuJobList);
		modelAndView.setViewName("qiantai/zuoye/teacher_upload_grade");
		return modelAndView;
	}

	//老师批改作业提交得分
	@RequestMapping("/uploadGrade")
	public String uploadGrade(@RequestParam(value = "jobGrade") Integer jobGrade,@RequestParam("id") Integer id){

		jobService.uploadGrade(jobGrade,id);
		return "redirect:/job/showJobList";
	}


	//显示老师提交作业页面
//	@RequestMapping("/teacher/show_tijiao")
//	public String showTeacherTijiao(HttpServletRequest request) {
//		//查询该老师布置的作业（未完成的）
//		Teacher teacher=(Teacher) request.getSession().getAttribute("user");
//		List<TeacherTijiao2> lists= jobService.findJobsForTeacherTijiao(teacher.getId());
//		Set<Integer> banjiIdSet=new HashSet<Integer>();
//		Set<Integer> professionSet=new HashSet<Integer>();
//		for(TeacherTijiao2 ttj:lists) {
//			banjiIdSet.add(ttj.getBanjiId());
//			professionSet.add(ttj.getProfessionId());
//		}
//
//		//查询班级
//		List<Banji> banjis=new ArrayList<Banji>();
//		for(Integer banjiId:banjiIdSet) {
//			Banji b=banjiService.getBanjiById(banjiId);
//			banjis.add(b);
//		}
//		//查询专业
//		List<Profession> professions=new ArrayList<Profession>();
//		for(Integer professionId:professionSet) {
//			Profession p=professionService.getProfessionById(professionId);
//			professions.add(p);
//		}
//		request.setAttribute("professions", professions);
//		request.setAttribute("banjis", banjis);
//		request.setAttribute("lists", lists);
//		return "/qiantai/zuoye/teacher_find_detail";
//	}

	
	//老师提交作业
//	@RequestMapping("/teacher/tijiao")
//	@ResponseBody
//	public String teacherTijiao(double grade,int jobId,int professionId,int banjiId,String stuId,String url,HttpServletRequest request) {
//		Teacher teacher=(Teacher) request.getSession().getAttribute("user");
//		jobService.teacherTijiao(grade,teacher.getId(),jobId,professionId,banjiId,stuId,url);
//		return "200";
//	}
	
	//显示学生提交页面
//	@RequestMapping("/stu/show_tijiao")
//	public String show_stu_tijiao(HttpServletRequest request) {
//		Student stu=(Student) request.getSession().getAttribute("user");
//		List<Job> jobs= jobService.getJobsByBanjiId(stu.getBanji().getId());
//		request.setAttribute("jobs", jobs);
//		return "/qiantai/zuoye/stu_tijiao_zuoye2";
//	}


//	@PostMapping("/stu/tijiao")
//	@ResponseBody
//	public String stu_tijiao(String url,Integer jobId,HttpServletRequest request) {
//		Student stu=(Student) request.getSession().getAttribute("user");
//		String currentTime=TimeUtils.getCurrentTime();
//		jobService.stuTijiao(url,currentTime,stu.getId(),jobId);
//		return "200";
//	}


}
