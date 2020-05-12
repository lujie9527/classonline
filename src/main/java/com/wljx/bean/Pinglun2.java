package com.wljx.bean;

public class Pinglun2 {


	private int id;
	private String content;
	private String plTime; //评论时间
	
	private Liuyan liuyan;
	private Student student;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPlTime() {
		return plTime;
	}
	public void setPlTime(String plTime) {
		this.plTime = plTime;
	}
	public Liuyan getLiuyan() {
		return liuyan;
	}
	public void setLiuyan(Liuyan liuyan) {
		this.liuyan = liuyan;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	
	
}
