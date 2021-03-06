package com.classonline.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.classonline.bean.Video;
import com.classonline.bean.Videoplay;
import com.classonline.mapper.VideoMapper;
import com.classonline.service.VideoService;
import com.classonline.utils.IPUtils;
import com.classonline.utils.TimeUtils;
@Service
public class VideoServiceImpl implements VideoService {

	@Autowired
	private VideoMapper videoMapper;

	///获取视频列表
	@Override
	public List<Video> getAllVideos(String keyword) {
		return videoMapper.getAllVideos(keyword);
	}


	//根据视频编号播放视频
	@Override
	public Video getVideoById(int id) {
		return videoMapper.getVideoById(id);
	}


	//更新播放量
	@Transactional
	@Override
	public void updateVideoPlayNum(HttpServletRequest request,int videoId) {
		String ip = IPUtils.getClientIP(request);
		String clickTime = TimeUtils.getCurrentTime2();
		
		Videoplay vp=videoMapper.getVideoPlay(videoId,ip,clickTime);
		if(vp==null) {
			videoMapper.addVideoPlay(videoId,ip,clickTime);
			//根据视频id获取播放量
			int playNum=videoMapper.getVideoPlayNum(videoId);
			playNum+=1;
			videoMapper.updatePlayNum(videoId,playNum);
		}
	}

	//删除视频（管理员）
	@Transactional
	@Override
	public void deleteVideo(String[] ids) {
		for(String id:ids) {
			videoMapper.deleteVideo(Integer.valueOf(id));
		}
	}

	//上传视频
	@Transactional
	@Override
	public void addVideo(String name, String videoUrl, String imageUrl, String teacherId, String description) {
		String uploadTime=TimeUtils.getCurrentTime2();
		videoMapper.addVideo(name,uploadTime,videoUrl,imageUrl,teacherId,description);
	}

}
