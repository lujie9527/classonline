package com.wljx.controller;

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

import com.wljx.bean.Student;
import com.wljx.service.DocService;
import com.wljx.utils.TimeUtils;

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
        
       addDocDetailDownload(request,id);
	}

	@Transactional
	private void addDocDetailDownload(HttpServletRequest request, int docdetailId) {
		 //记录下载的资料
        //判断用户类型，如果是老师，就不用记录
        //TODO
        Object object = request.getSession().getAttribute("user");
        if(object instanceof Student) {
        	Student stu=(Student) object;
        	docService.addDocDownload(docdetailId,stu.getId(),TimeUtils.getCurrentTime());
        }
		
	}
}
