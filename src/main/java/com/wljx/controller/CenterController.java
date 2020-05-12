package com.wljx.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wljx.bean.Doc;
import com.wljx.bean.Teacher;
import com.wljx.service.DocService;
import com.wljx.service.VideoService;

@Controller
@RequestMapping("/gerenzhongxin")
public class CenterController {
	@Autowired
	private VideoService videoService;
	@Autowired
	private DocService docService;
	
	@RequestMapping("/home")
	public String showGerenzhongxin(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer flag=(Integer) session.getAttribute("isStu");
		if(flag!=null) { //学生
			
			return "/qiantai/gerenzhongxin/stu_gerenzhongxin";
		}else {
			
			return "/qiantai/gerenzhongxin/teacher_gerenzhongxin";
		}
	}
	
	@RequestMapping("/gerenxinxi")
	public String gerenxinxi() {
		return "/qiantai/gerenzhongxin/stu_gerenxinxi";
	}
	@RequestMapping("/wodezuoye")
	public String wodezuoye() {
		return "/qiantai/gerenzhongxin/wodezuoye";
		
	}
	@RequestMapping("/yixiazai")
	public String yixiazai() {
		return "/qiantai/gerenzhongxin/yixiazaiziliao";
	}
	
	//老师
	@RequestMapping("/teacher/gerenxinxi")
	public String teacher_gerenxinxi() {
		return "/qiantai/gerenzhongxin/teacher_gerenxinxi";
	}
	
	@RequestMapping("/teacher/doc")
	public String showTeacherDoc(HttpServletRequest request) {
		Teacher teacher=(Teacher) request.getSession().getAttribute("user");
		//查询该老师的资料分类名
		List<Doc> docs=docService.getAllDocsByTeacherId(teacher.getId());
		request.setAttribute("docs", docs);
		return "/qiantai/gerenzhongxin/teacher_doc";
	}
	@RequestMapping("/teacher/video")
	public String showTeacherVideo() {
		return "/qiantai/gerenzhongxin/teacher_video";
	}
	
	@RequestMapping("/teacher/addVideo")
	@ResponseBody
	public String teacherAddVideo(String name,String imageUrl,String videoUrl,String description,HttpServletRequest request) {
		Teacher teacher=(Teacher) request.getSession().getAttribute("user");
		videoService.addVideo(name,videoUrl,imageUrl,teacher.getId(),description);
		return "200";
	}
	
	@RequestMapping("/teacher/addDoc")
	@ResponseBody
	public String teacherAddDoc(String size,String docId,String name,String url,String filename,String description,HttpServletRequest request) {
		Teacher teacher=(Teacher) request.getSession().getAttribute("user");
		docService.teacherAddDoc(size,docId,name,url,filename,description,teacher);
		return "200";
	}
}
