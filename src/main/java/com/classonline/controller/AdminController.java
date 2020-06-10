package com.classonline.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classonline.bean.*;
import com.classonline.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;


@Controller
//这个注解是用来声明控制器的
@RequestMapping("/admin")

//如果 @RequestMapping 作用在类上，那么就相当于是给该类所有配置的映射地址前加上了一个地址
public class AdminController {
	@Autowired
	//spring可以自动帮你把Bean里面引用的对象的setter/getter方法省略，它会自动帮你set/get（其实是通过反射技术实现的）。
	private AdminService adminService;
	@Autowired
	private ProfessionService professionService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private BanjiService banjiService;
	@Autowired
	private VideoService videoService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private LiuyanService liuyanService;
	@Autowired
	private DocService docService;
	@Autowired
	private JobService jobService;

	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		Object obj = request.getSession().getAttribute("admin");
		if(obj==null) {
			return "/admin/login";
		}
		return "/admin/index";
	}


	@RequestMapping("/login")
	public String login(String name,String password,HttpServletRequest request) {
		Admin admin=adminService.login(name,password);
		if(admin!=null) {
			request.getSession().setAttribute("admin", admin);
			return "/admin/index";
		}else {
			request.setAttribute("error", "用户名或密码错误");
			return "/admin/login";
		}
	}


	@RequestMapping("/loginOut")
	public String loginOut(HttpServletRequest request) {
		request.getSession().setAttribute("admin", null);
		return "/admin/login";
	}


	@RequestMapping("/editpassword")
	@ResponseBody
	public String editpassword(String password,HttpServletRequest request) {
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		adminService.updatePwd(admin.getId(),password);
		return "200";
	}


	@RequestMapping("/tip")
	public String tip() {
		return "/admin/tip";
	}



	// 学生信息列表
	@RequestMapping("/student/list")
	public String ShowlistStudent() {
		return "/admin/studentList";
	}


	@RequestMapping("/student/list/json")
	@ResponseBody
	public List<Student> listStudent(){
		return studentService.getStus();
	}


	@RequestMapping("/student/addOrUpdate")
	//使用 @RequestParam("前台参数名") 来注入，以此减少和前台的耦合
//	@RequestParam 注解细节：
//	该注解有三个变量：value、required、defaultvalue
//	value ：指定 name 属性的名称是什么，value 属性都可以默认不写
//	required ：是否必须要有该参数，可以设置为【true】或者【false】
//	defaultvalue ：设置默认值
	public String addOrUpdate(Student stu,@RequestParam(value="isUpdate",required=false)Integer isUpdate,
			@RequestParam("banjiId")Integer banjiId,@RequestParam("professionId") Integer professionId) {
		System.out.println("isUpdate:"+isUpdate);
		if(isUpdate==null) {
			studentService.addStudent(stu,banjiId,professionId);
		}else {
			studentService.updateStudent(stu,banjiId,professionId);
		}
		return "/admin/studentList";
	}


	@RequestMapping("/student/delete")
	@ResponseBody
	public String deleteStudent(@RequestParam(value="ids[]") String[] ids) {
		studentService.deleteStudent(ids);
		return "200";
	}



	//老师信息列表
	@RequestMapping("/teacher/list")
	public String showlistTeacher() {
		return "/admin/teacherList";
	}


	@RequestMapping("/teacher/list/json")
	@ResponseBody
	public List<Teacher> listTeacher(){
		return teacherService.getTeachers();
	}


	@RequestMapping("/teacher/addOrUpdate")
	public String addOrUpdateTeacher(Teacher teacher,@RequestParam(value="isUpdate",required=false)Integer isUpdate) {
		if(isUpdate==null) {
			teacherService.addTeacher(teacher);
		}else {
			teacherService.updateTeacher(teacher);
		}
		return "/admin/teacherList";
	}


	@RequestMapping("/teacher/delete")
	@ResponseBody
	public String deleteTeacher(@RequestParam(value="ids[]") String [] ids) {
		teacherService.deleteTeacher(ids);
		return "200";
	}
	

	//专业信息列表
	@RequestMapping("/profession/list")
	public String showlistProfession(){
		return "/admin/professionList";
	}


	@RequestMapping("/profession/list/json")
	@ResponseBody
	public List<Profession> listProfession(){
		return professionService.getProfessions();
		
	}


	@RequestMapping("/profession/addOrUpdate")
	public String addOrUpdateProfession(Profession profession,@RequestParam(value="isUpdate",required=false)Integer isUpdate) {

		if(isUpdate==null) {
			professionService.addProfession(profession);
		}else {
			professionService.updateProfession(profession);
		}
		return "/admin/professionList";
	}


	@RequestMapping("/profession/delete")
	@ResponseBody
	public String deleteProfession(@RequestParam(value="ids[]") String [] ids) {
		professionService.deleteProfession(ids);
		return "200";
	}

	
	//班级信息列表
	@RequestMapping("/banji/list")
	public String showListBanji() {
		return "/admin/banjiList";
	}


	@RequestMapping("/banji/list/json")
	@ResponseBody
	public List<Banji> listBanji(){
		return banjiService.getBanjis();
	}


	@RequestMapping("/banji/list/pid")
	@ResponseBody
	public List<Banji> getBanjisByPid(@RequestParam("id") Integer id){
		return banjiService.getBanjisByPid(id);
	}


	@RequestMapping("/banji/addOrUpdate")
	public String addOrUpdateBanji(@RequestParam(value="id",required=false)Integer id,@RequestParam(value="name",required=false)String name
			, @RequestParam(value="professionId",required=false) String professionId
			,@RequestParam(value="isUpdate",required=false)Integer isUpdate) {
		if(isUpdate==null) {
			banjiService.addBanji(name,professionId);
		}else {
			banjiService.updateBanji(id,name,professionId);
		}
		return "/admin/banjiList";
	}


	@RequestMapping("/banji/delete")
	@ResponseBody
	public String deleteBanji(@RequestParam(value="ids[]") String [] ids) {
		banjiService.deleteBanji(ids);
		return "200";
	}
	

	//视频信息列表
	@RequestMapping("/video/list")
	public String showListVideo() {
		return "/admin/videoList";
	}


	@RequestMapping("/video/list/json")
	@ResponseBody
	public List<Video> listVideo(){
		return videoService.getAllVideos("");
	}


	@RequestMapping("/video/delete")
	@ResponseBody
	public String deleteVideo(@RequestParam(value="ids[]") String [] ids) {
		videoService.deleteVideo(ids);
		return "200";
	}


	// 公告
	@RequestMapping("/notice/list")
	public String showListNotice() {
		return "/admin/noticeList";
	}


	@RequestMapping("/notice/list/json")
	@ResponseBody
	public List<Notice> listNotices(){
		return noticeService.findNoticeByKeyword("");
	}


	@RequestMapping("/notice/addOrUpdate")
	public String addOrUpdateNotice(@RequestParam(value="title",required=false)String title,
			@RequestParam(value="content",required=false)String content,@RequestParam(value="id",required=false)String id
			,@RequestParam(value="isUpdate",required=false)Integer isUpdate,HttpServletRequest request) {
		if(isUpdate==null) {
			Admin admin = (Admin) request.getSession().getAttribute("admin");
			noticeService.addNotice(title,content,admin.getId());
		}else {
			noticeService.updateNotice(id,title,content);
			
		}
		return "/admin/noticeList";
	}


	@RequestMapping("/notice/delete")
	@ResponseBody
	public String deleteNotice(@RequestParam(value="ids[]") String [] ids) {
		noticeService.deleteNotice(ids);
		return "200";
	}


	//题目信息列表
	@RequestMapping("/subject/list")
	public String showListSubject(){
		return "/admin/subjectList";
	}

	@RequestMapping("/subject/list/json")
	@ResponseBody
	public List<Subject> listSubject(){
		return subjectService.getSubjects();
	}

	@RequestMapping("/subject/delete")
	@ResponseBody
	public String deleteSubject(@RequestParam(value="subjectIds[]") String[] subjectIds){
		System.out.println("subjectId:"+subjectIds);
		subjectService.deleteSubjectByList(subjectIds);
		return "200";
	}

	@RequestMapping("/subject/addSub")
	public String addOrUpdateSubject(@RequestParam(value = "subjectId")Integer subjectId,
									 @RequestParam(value="subjectTitle") String subjectTitle,
									 @RequestParam(value="subjectOptionA") String subjectOptionA,
									 @RequestParam(value="subjectOptionB") String subjectOptionB,
									 @RequestParam(value="subjectOptionC") String subjectOptionC,
									 @RequestParam(value="subjectOptionD") String subjectOptionD,
									 @RequestParam(value="subjectAnswer") String subjectAnswer,
									 @RequestParam(value="subjectParse") String subjectParse,
									 @RequestParam(value = "isUpdate",required=false)Integer isUpdate) {
		//String keyword = new String(request.getParameter("keyword").getBytes("ISO-8859-1"), "utf-8");
//		String subjectTitles = new String (request.getParameter("subjectTitle").getBytes("ISO-8859-1"),"utf-8");
//		String subjectOptionAs = new String (request.getParameter("subjectOptionA").getBytes("ISO-8859-1"),"utf-8");
//		String subjectOptionBs = new String (request.getParameter("subjectOptionB").getBytes("ISO-8859-1"),"utf-8");
//		String subjectOptionCs = new String (request.getParameter("subjectOptionC").getBytes("ISO-8859-1"),"utf-8");
//		String subjectOptionDs = new String (request.getParameter("subjectOptionD").getBytes("ISO-8859-1"),"utf-8");
//		String subjectAnswers = new String (request.getParameter("subjectAnswer").getBytes("ISO-8859-1"),"utf-8");
//		String subjectParses = new String (request.getParameter("subjectParse").getBytes("ISO-8859-1"),"utf-8");
		System.out.println("adminController在这里的isupdate"+isUpdate);
		if (isUpdate==null){
			System.out.println(subjectTitle);
			System.out.println(subjectOptionA);
			System.out.println(subjectOptionB);
			subjectService.addSubject(subjectTitle,subjectOptionA,subjectOptionB,subjectOptionC,subjectOptionD,
					subjectAnswer,subjectParse);

		}else{
			subjectService.updateSubject(subjectId,subjectTitle,subjectOptionA,subjectOptionB,subjectOptionC,subjectOptionD,
					subjectAnswer,subjectParse);

		}

		return "/admin/subjectList";
	}

	

	// 留言
	@RequestMapping("/liuyan/list")
	public String showListLiuyan() {
		return "/admin/liuyanList";
	}

	@RequestMapping("/liuyan/list/json")
	@ResponseBody
	public List<Liuyan> listLiuyans(){
		return liuyanService.getALlLiuyans();
	}

	@RequestMapping("/liuyan/delete")
	@ResponseBody
	public String deleteLiuyan(@RequestParam(value="ids[]") String [] ids) {
		liuyanService.deleteLiuyan(ids);
		return "200";
	}
	
	
	
	// 课件资料
	@RequestMapping("/doc/list")
	public String showDocList() {
		return "/admin/docList";
	}
	@RequestMapping("/doc/list/json")
	@ResponseBody
	public List<Docdetail> listDocs(){
		return docService.getAllDocDetails();
		
	}
	@RequestMapping("/doc/delete")
	@ResponseBody
	public String deleteDoc(@RequestParam(value="ids[]") String [] ids) {
		docService.deleteDocDetail(ids);
		return "200";
	}
	
	
	//作业
	@RequestMapping("/job/list")
	public String showJobList() {
		return "/admin/jobList";
	}
	@RequestMapping("/job/list/json")
	@ResponseBody
	public List<Job> listJobs(){
		return jobService.getJobs();
		
	}


	@RequestMapping("/job/delete")
	@ResponseBody
	public String deleteJob(@RequestParam(value="ids[]") String [] ids) {
		jobService.deleteJob(ids);
		return "200";
	}
}
