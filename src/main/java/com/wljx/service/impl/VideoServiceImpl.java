package com.wljx.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wljx.bean.Video;
import com.wljx.bean.Videoplay;
import com.wljx.mapper.VideoMapper;
import com.wljx.service.VideoService;
import com.wljx.utils.IPUtils;
import com.wljx.utils.TimeUtils;
@Service
public class VideoServiceImpl implements VideoService {

	@Autowired
	private VideoMapper videoMapper;
	@Override
	public List<Video> getAllVideos(String keyword) {
		return videoMapper.getAllVideos(keyword);
	}
	@Override
	public Video getVideoById(int id) {
		return videoMapper.getVideoById(id);
	}
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
	@Transactional
	@Override
	public void deleteVideo(String[] ids) {
		for(String id:ids) {
			videoMapper.deleteVideo(Integer.valueOf(id));
		}
	}
	@Transactional
	@Override
	public void addVideo(String name, String videoUrl, String imageUrl, String teacherId, String description) {
		String uploadTime=TimeUtils.getCurrentTime2();
		videoMapper.addVideo(name,uploadTime,videoUrl,imageUrl,teacherId,description);
	}

}
