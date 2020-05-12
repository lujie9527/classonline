package com.wljx.bean;

public class TeacherJob {

	private int id;
	private String pigaiTime;
	private String url;
	private int grade;
	
	private Student student;
	private Job job;
	private Teacher teacher;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPigaiTime() {
		return pigaiTime;
	}
	public void setPigaiTime(String pigaiTime) {
		this.pigaiTime = pigaiTime;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
	
}
