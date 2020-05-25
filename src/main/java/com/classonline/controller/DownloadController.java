package com.classonline.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.classonline.bean.Student;
import com.classonline.service.DocService;
import com.classonline.utils.TimeUtils;

@Controller
@RequestMapping("/download")
public class DownloadController {
	
	@Autowired
	private DocService docService;
	
	
	@GetMapping("/job")
	public void downloadJob(HttpServletRequest request,HttpServletResponse response, String filename) throws IOException {
		//获取服务器地址
		String realPath=request.getServletContext().getRealPath("/upload");
		String path=realPath+"/"+filename;
		InputStream is=new BufferedInputStream(new FileInputStream(new File(path)));
		String name=filename.split("-")[1];
		name=URLEncoder.encode(name, "UTF-8");
		//设置文件下载头  
        response.addHeader("Content-Disposition", "attachment;filename=" + name);
        response.setContentType("multipart/form-data");
        BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
        int len=0;
        while((len=is.read())!=-1) {
        	bos.write(len);
        	bos.flush();
        }
        bos.close();
        is.close();
	}
	
	@GetMapping("/doc")
	public void downloadDoc(HttpServletRequest request,HttpServletResponse response,int id, String filename) throws IOException {
		//获取服务器地址
		String realPath = request.getServletContext().getRealPath("/upload");//获取上传文件的路径
		String path = realPath+"/"+filename;
		InputStream is = new BufferedInputStream(new FileInputStream(new File(path)));//缓冲输入流
		String name = filename.split("-")[1];//将字符串以"-"隔开，形成一个字符串数组，然后再通过索引[1]取出所得数组中的第二个元素的值
		name = URLEncoder.encode(name, "UTF-8");//解决客户端重定向，URL地址中文乱码
		//设置文件下载头  
        response.addHeader("Content-Disposition", "attachment;filename=" + name);//addHeader方法为响应增加新的首部
        response.setContentType("multipart/form-data");//设置响应编码
        BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());//缓冲输出流
        int len=0;
        while((len=is.read())!=-1) {
        	bos.write(len);
        	bos.flush();
        }
        bos.close();
        is.close();
        
       addDocDetailDownload(request,id);

       //这段代码打开了客户端的 output 流和本地文件的 input 流，把这两个流一接上就能向客户端写数据了，客户端要下载哪个文件就写什么。
	}

	@Transactional
	public void addDocDetailDownload(HttpServletRequest request, int docdetailId) {
		 //记录下载的资料
        //判断用户类型，如果是老师，就不用记录
        Object object = request.getSession().getAttribute("user");
        if(object instanceof Student) {
        	Student stu=(Student) object;
        	docService.addDocDownload(docdetailId,stu.getId(),TimeUtils.getCurrentTime());
        }
		
	}
}
