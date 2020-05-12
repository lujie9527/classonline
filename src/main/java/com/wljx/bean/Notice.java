package com.wljx.bean;
/**
 * 公告
 * @author 13603
 *
 */
public class Notice {
	private int id;
	private String title;
	private String content;
	private String noticeTime;
	private Admin admin;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getNoticeTime() {
		return noticeTime;
	}
	public void setNoticeTime(String noticeTime) {
		this.noticeTime = noticeTime;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
	
}
