package com.classonline.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.classonline.bean.Student;
import com.classonline.bean.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.classonline.bean.Video;
import com.classonline.service.VideoService;

@Controller
@RequestMapping("/video")
public class VideoController {

	@Autowired
	private VideoService videoService;
	
	@RequestMapping("/all")
	public String getAllVideos(HttpServletRequest request, @RequestParam(required=false,defaultValue="1")int pageNum, String keyword,Model model){

		Object user=request.getSession().getAttribute("user");
		if(user instanceof Student){
			Student stu = (Student) user;
			PageHelper.startPage(pageNum, 10);
			List<Video> lists=videoService.getAllVideos(keyword );
			PageInfo<Video> pageInfo=new PageInfo<Video>(lists,10);

			model.addAttribute("keyword", keyword);
			model.addAttribute("pageInfo", pageInfo);
			return "/qiantai/ziyuanzhongxin/jiaoxueshipin";
		}else {
			Teacher tea = (Teacher) user;

			return "/qiantai/gerenzhongxin/teacher_video";
		}

	}
	
	@RequestMapping("/vid/{id}")
	public String getVideoById(Model model,HttpServletRequest request,@PathVariable("id") int id) {
		Video video=videoService.getVideoById(id);
		model.addAttribute("video", video);
		//更新播放量
		videoService.updateVideoPlayNum(request,id);
		return "/qiantai/ziyuanzhongxin/jiaoxueshipin_detail";
	}
}
