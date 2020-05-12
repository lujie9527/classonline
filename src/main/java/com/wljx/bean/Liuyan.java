package com.wljx.bean;

public class Liuyan {
	
	private int id;
	private String title;
	private String content;
	private String liuyanTime;
	private int state;//问题是否解决了  0没有解决
	private int answer;//回答数
	private Student student;
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
	public String getLiuyanTime() {
		return liuyanTime;
	}
	public void setLiuyanTime(String liuyanTime) {
		this.liuyanTime = liuyanTime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	
}
