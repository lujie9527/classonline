package com.wljx.service;

import java.util.List;

import com.wljx.bean.Notice;

public interface NoticeService {
	/**
	 * 查询前四个公告
	 * @return
	 */
	public List<Notice> get4Notices();

	/**
	 * 根据id查询具体的哪条公告
	 * @param id
	 * @return
	 */
	public Notice getNoticeById(Integer id);

	/**
	 * 条件查询
	 * @param keyWord
	 * @return
	 */
	public List<Notice> findNoticeByKeyword(String keyWord);

	public void addNotice(String title, String content, int id);

	public void updateNotice(String id, String title, String content);

	public void deleteNotice(String[] ids);
}
