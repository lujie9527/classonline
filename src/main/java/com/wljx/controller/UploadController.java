package com.wljx.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wljx.bean.Student;
import com.wljx.bean.Teacher;
import com.wljx.service.StudentService;
import com.wljx.service.TeacherService;
import com.wljx.utils.TimeUtils;

@Controller
@RequestMapping("/upload")
public class UploadController {

	@Autowired
	private StudentService studentService;
	@Autowired
	private TeacherService teacherService;
	@RequestMapping(value="/job")
	public void uploadJob(@RequestParam(value="job",required=false) MultipartFile uploadFile ,HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		//获取原始名
		String filename = uploadFile.getOriginalFilename();
		//新文件名
		filename=UUID.randomUUID().toString().replace("-","")+"-"+filename;
		//获取服务器地址
		String realPath = request.getServletContext().getRealPath("/upload");
		File storePath=new File(realPath);
		if(!storePath.exists()) storePath.mkdirs();
		
		//解决同一个目录下文件太多
		String childDirectory=makeChildDirectory(storePath);
		File file=new File(storePath,childDirectory+File.separator+filename);
		
		//获取原文件字节
		byte[] bytes = uploadFile.getBytes();
		FileOutputStream fos=new FileOutputStream(file);
		fos.write(bytes);
		
		 String result= childDirectory+"/"+filename;
		//返回文件路径
		 System.out.println("文件路径"+result);
		response.getWriter().write(result);
	}

	private String makeChildDirectory(File storePath) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
		String dateDirectory = sdf.format(new Date());
		File file=new File(storePath,dateDirectory);
		if(!file.exists()) file.mkdirs();
		return dateDirectory;
	}
	
	@RequestMapping(value="/touxiang")
	public void uploadTouxiang(@RequestParam(value="touxiang",required=false) MultipartFile uploadFile ,HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		//获取原始名
		String filename = uploadFile.getOriginalFilename();
		//新文件名
		filename=UUID.randomUUID().toString().replace("-","")+"-"+filename;
		//获取服务器地址
		String realPath = request.getServletContext().getRealPath("/upload");
		File storePath=new File(realPath);
		if(!storePath.exists()) storePath.mkdirs();
		
		//解决同一个目录下文件太多
		String childDirectory=makeChildDirectory(storePath);
		File file=new File(storePath,childDirectory+File.separator+filename);
		
		//获取原文件字节
		byte[] bytes = uploadFile.getBytes();
		FileOutputStream fos=new FileOutputStream(file);
		fos.write(bytes);
		
		 String result= childDirectory+"/"+filename;
		//返回文件路径
		 System.out.println("文件路径"+result);
		 Object user = request.getSession().getAttribute("user");
		 
		 if(user instanceof Student) {
			 Student stu=(Student) user;
			 studentService.updateStuUrl(stu.getId(),result);
			 //查询用户信息
			 Student student=studentService.getStuById(stu.getId());
			 request.getSession().setAttribute("user", student);
		 }else {
			 Teacher tea=(Teacher) user;
			 teacherService.updateTeacherUrl(tea.getId(),result);
			 //查询用户信息
			 Teacher teacher=teacherService.getTeacherById(tea.getId());
			 request.getSession().setAttribute("user", teacher);
		 }
		
		 
		response.getWriter().write(result);
	}
	
	
	
	//老师上传资料
	@RequestMapping(value="/doc")
	public void uploadDoc(@RequestParam(value="doc",required=false) MultipartFile uploadFile ,HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		//获取原始名
		String oldFilename = uploadFile.getOriginalFilename();
		//文件大小
		String size=TimeUtils.getNetFileSizeDescription(uploadFile.getSize());
		
		//新文件名
		String filename=UUID.randomUUID().toString().replace("-","")+"-"+oldFilename;
		//获取服务器地址
		String realPath = request.getServletContext().getRealPath("/upload");
		File storePath=new File(realPath);
		if(!storePath.exists()) storePath.mkdirs();
		
		//解决同一个目录下文件太多
		String childDirectory=makeChildDirectory(storePath);
		File file=new File(storePath,childDirectory+File.separator+filename);
		
		//获取原文件字节
		byte[] bytes = uploadFile.getBytes();
		FileOutputStream fos=new FileOutputStream(file);
		fos.write(bytes);
		
		 String url= childDirectory+"/"+filename;
		//返回文件路径
		 System.out.println("文件路径"+url);
		String data="{\"filename\":\""+oldFilename+"\",\"url\":\""+url+"\",\"size\":\""+size+"\"}";
		response.getWriter().write(data);
	}
}
