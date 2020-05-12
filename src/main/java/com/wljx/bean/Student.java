package com.wljx.bean;
/**
 * 
 * @author 13603
 *
 */
public class Student {
	private String id;
	private String name;
	private String password;
	private String sex;
	private Integer age;
	private String ruxueTime;
	private String url;
	
	private Banji banji;
	private Profession profession;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getRuxueTime() {
		return ruxueTime;
	}
	public void setRuxueTime(String ruxueTime) {
		this.ruxueTime = ruxueTime;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Banji getBanji() {
		return banji;
	}
	public void setBanji(Banji banji) {
		this.banji = banji;
	}
	public Profession getProfession() {
		return profession;
	}
	public void setProfession(Profession profession) {
		this.profession = profession;
	}
	
	
	
}
