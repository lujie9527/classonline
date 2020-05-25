package com.classonline.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.classonline.bean.Video;

public interface VideoService {

	/**
	 * 获取所有视频列表
	 */
	List<Video> getAllVideos(String keyword);

	/**
	 * 根据id查询视频
	 */
	Video getVideoById(int id);

	/**
	 * 更新视频播放量
	 */
	void updateVideoPlayNum(HttpServletRequest request,int videoId);

	void deleteVideo(String[] ids);

	void addVideo(String name, String videoUrl, String imageUrl, String teacherId, String description);

}
