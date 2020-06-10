package com.classonline.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.classonline.bean.Student;
import com.classonline.bean.Teacher;
import com.classonline.service.StudentService;
import com.classonline.service.TeacherService;
import com.classonline.utils.TimeUtils;

@Controller
@RequestMapping("/upload")
public class UploadController {

	@Autowired
	private StudentService studentService;
	@Autowired
	private TeacherService teacherService;

//	@RequestMapping(value="/job")
//	public void uploadJob(@RequestParam(value="job",required=false) MultipartFile uploadFile ,HttpServletRequest request,
//						  HttpServletResponse response) throws IOException {
//		response.setCharacterEncoding("UTF-8");
//		//获取原始名称
//		String filename = uploadFile.getOriginalFilename();
//		//新文件名
//		filename=UUID.randomUUID().toString().replace("-","")+"-"+filename;
//		//获取服务器地址
//		String realPath = request.getServletContext().getRealPath("/upload");
//		File storePath=new File(realPath);
//		if(!storePath.exists()) storePath.mkdirs();//如果路径不存在，就在upload下创建多层目录
//
//		//解决同一个目录下文件太多
//		String childDirectory=makeChildDirectory(storePath);
//		File file=new File(storePath,childDirectory+File.separator+filename);
//
//		//获取原文件字节
//		byte[] bytes = uploadFile.getBytes();
//		FileOutputStream fos=new FileOutputStream(file);
//		fos.write(bytes);
//
//		 String result= childDirectory+"/"+filename;
//		//返回文件路径
//		 System.out.println("文件路径"+result);
//		response.getWriter().write(result);
//	}

	//建子文件夹
	private String makeChildDirectory(File storePath) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
		String dateDirectory = sdf.format(new Date());//制定字符串格式和参数生成格式化的新字符串
		File file=new File(storePath,dateDirectory);//将年月日作为每层的文件名
		if(!file.exists()) file.mkdirs();
		return dateDirectory;
	}


	//上传头像
	@RequestMapping(value="/touxiang")
	public void uploadTouxiang(@RequestParam(value="touxiang",required=false) MultipartFile uploadFile ,HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		//获取原始名
		String filename = uploadFile.getOriginalFilename();
		System.out.println("111在这里filename是什么:"+filename);
		//新文件名
		filename=UUID.randomUUID().toString().replace("-","")+"-"+filename;
		//UUID.randomUUID().toString()是自动生成主键的方法，把文件名称中的“-”替换成空
		System.out.println("222在这里filename是什么:"+filename);
		//获取服务器地址
		String realPath = request.getServletContext().getRealPath("/upload");
		//获得当前请求对象的绝对路径
		System.out.println("realPath是什么："+realPath);

		File storePath=new File(realPath);
		//在realPath路径下创建一个File
		if(!storePath.exists())   //如果保存文件地址不存在则创建目录
			storePath.mkdirs();//mkdirs()生成所有目录
		
		//解决同一个目录下文件太多，建子文件夹
		String childDirectory=makeChildDirectory(storePath);
		System.out.println("makeChildDirectory（）:"+childDirectory);
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
		
		//解决同一个目录下文件太多,在服务器地址下建子文件夹
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

    //在作业、留言模块在富文本编辑器中上传图片内容
	@RequestMapping(value ="/tupian",method= RequestMethod.POST)
	@ResponseBody
	public Object UpLoadImg(@RequestParam(value="myFileName")MultipartFile myFileName,HttpServletRequest request) {
		String realPath = request.getSession().getServletContext().getRealPath("/upload");

		//获取源文件
		String filename = myFileName.getOriginalFilename();
		String[] names=filename.split("\\.");//  "\\."实际上就是 .    即用“.”分隔文件名字
		String tempNum=(int)(Math.random()*100000)+"";
		String uploadFileName=tempNum +System.currentTimeMillis()+"."+names[names.length-1];
		//System.currentTimeMillis()是当前系统时间的毫秒数
		//names[names.length-1]  是图片的后缀，例如jpg
		File targetFile = new File (realPath,uploadFileName);//目标文件

		//开始从源文件拷贝到目标文件

		//传图片一步到位
		try {
			myFileName.transferTo(targetFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Map<String, String> map = new HashMap<String, String>();
		map.put("data","http://localhost:8080/classonline_war_exploded/upload/"+uploadFileName);//项目路径
		return map;//将图片地址返回
	}
}
