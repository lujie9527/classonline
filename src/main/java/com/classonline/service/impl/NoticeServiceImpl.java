package com.classonline.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.classonline.bean.Notice;
import com.classonline.mapper.NoticeMapper;
import com.classonline.service.NoticeService;
import com.classonline.utils.TimeUtils;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper noticeMapper;
	@Override
	public List<Notice> getNotices() {

		List<Notice> list = noticeMapper.getNotices();
		
		return list;
	}
	@Override
	public Notice getNoticeById(Integer id) {
		Notice notice=noticeMapper.getNoticeById(id);
		return notice;
	}
	@Override
	public List<Notice> findNoticeByKeyword(String keyWord) {
		return noticeMapper.findNoticeByKeyword(keyWord);
		
	}
	@Transactional
	@Override
	public void addNotice(String title, String content, int adminId) {
		String noticeTime=TimeUtils.getCurrentTime();
		noticeMapper.addNotice(title,content,noticeTime,adminId);
	}
	@Transactional
	@Override
	public void updateNotice(String id, String title, String content) {
		noticeMapper.updateNotice(id,title,content);
		
	}
	@Transactional
	@Override
	public void deleteNotice(String[] ids) {
		for(String id:ids ) {
			noticeMapper.deleteNotice(Integer.valueOf(id));
		}
	}

}
