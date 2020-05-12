package com.wljx.bean;

public class Docdownload {

	private int id;
	
	private String downTime;
	
	private Student student;
	private Docdetail docdetail;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDownTime() {
		return downTime;
	}
	public void setDownTime(String downTime) {
		this.downTime = downTime;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Docdetail getDocdetail() {
		return docdetail;
	}
	public void setDocdetail(Docdetail docdetail) {
		this.docdetail = docdetail;
	}
	
	
}
