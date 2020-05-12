package com.wljx.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wljx.bean.Admin;
import com.wljx.bean.Banji;
import com.wljx.bean.Docdetail;
import com.wljx.bean.Job;
import com.wljx.bean.Link;
import com.wljx.bean.Liuyan;
import com.wljx.bean.Notice;
import com.wljx.bean.Profession;
import com.wljx.bean.Student;
import com.wljx.bean.Teacher;
import com.wljx.bean.Video;
import com.wljx.service.AdminService;
import com.wljx.service.BanjiService;
import com.wljx.service.DocService;
import com.wljx.service.JobService;
import com.wljx.service.LinkService;
import com.wljx.service.LiuyanService;
import com.wljx.service.NoticeService;
import com.wljx.service.ProfessionService;
import com.wljx.service.StudentService;
import com.wljx.service.TeacherService;
import com.wljx.service.VideoService;
import com.wljx.utils.JedisUtil;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
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
	private LinkService linkService;
	@Autowired
	private LiuyanService liuyanService;
	@Autowired
	private DocService docService;
	@Autowired
	private JobService jobService;
	
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
	
	//1 学生
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
	public String addOrUpdate(Student stu,@RequestParam(value="isUpdate",required=false)Integer isUpdate,
			@RequestParam("banjiId")Integer banjiId,@RequestParam("professionId") Integer professionId) {
		
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
	//2 老师
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
	
	
	
	
	
	
	
	//3 专业
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
	
	
	
	
	
	
	
	
	
	//4 班级
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
	public List<Banji> getBanjisByPid(@RequestParam("id") int id){
		return banjiService.getBanjisByPid(id);
	}
	@RequestMapping("/banji/addOrUpdate")
	public String addOrUpdateBanji(@RequestParam(value="id",required=false)Integer id,@RequestParam(value="name",required=false)String name
			,@RequestParam(value="description",required=false)String description,
			@RequestParam(value="professionId",required=false) String professionId
			,@RequestParam(value="isUpdate",required=false)Integer isUpdate) {
		if(isUpdate==null) {
			banjiService.addBanji(name,description,professionId);
		}else {
			banjiService.updateBanji(id,name,description,professionId);
		}
		return "/admin/banjiList";
	}
	@RequestMapping("/banji/delete")
	@ResponseBody
	public String deleteBanji(@RequestParam(value="ids[]") String [] ids) {
		banjiService.deleteBanji(ids);
		return "200";
	}
	
	
	
	
	
	
	
	//5 视频
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
	
	
	
	
	
	//6 公告
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
		List<Notice> notices = noticeService.get4Notices();
		//存放在redis中
		String json=new Gson().toJson(notices);
		try {
			JedisUtil.setEx("redis_notices", json, 259200);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//3天
		
		return "/admin/noticeList";
	}
	@RequestMapping("/notice/delete")
	@ResponseBody
	public String deleteNotice(@RequestParam(value="ids[]") String [] ids) {
		noticeService.deleteNotice(ids);
		List<Notice> notices = noticeService.get4Notices();
		//存放在redis中
		String json=new Gson().toJson(notices);
		try {
			JedisUtil.setEx("redis_notices", json, 259200);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//3天
		return "200";
	}
	
	
	
	
	
	
	
	
	
	//7 友情链接
	@RequestMapping("/link/list")
	public String showListLink() {
		return "/admin/linkList";
	}
	@RequestMapping("/link/list/json")
	@ResponseBody
	public List<Link> listLinks(){
		return linkService.getAllLink();
	}
	@RequestMapping("/link/addOrUpdate")
	public String addOrUpdateLink(@RequestParam(value="name",required=false)String name
			,@RequestParam(value="url",required=false)String url
			,@RequestParam(value="imgUrl",required=false)String imgUrl
			,@RequestParam(value="id",required=false)Integer id
			,@RequestParam(value="isUpdate",required=false)Integer isUpdate) {
		if(isUpdate==null) {
			linkService.addLink(name,url,imgUrl);
		}else {
			linkService.updateLink(id,name,url,imgUrl);
		}
		return "/admin/linkList";
	}
	@RequestMapping("/link/delete")
	@ResponseBody
	public String deleteLink(@RequestParam(value="ids[]") String [] ids) {
		linkService.deleteLinks(ids);
		return "200";
	}
	
	
	
	
	
	
	
	
	//8 留言
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
	
	
	
	//9 资料
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
	
	
	//10 作业
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
