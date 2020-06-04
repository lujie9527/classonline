package com.classonline.bean;

public class Job {

    private int id;
    private String jobTitle;
    private String jobDetail;
    private String uploadTime;
    private String lastTime;
    private int state;
    private Teacher teacher;
    private Banji banji;
    private Profession profession;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getJobTitle() {
        return jobTitle;
    }
    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }
    public String getJobDetail() {
        return jobDetail;
    }
    public void setJobDetail(String jobDetail) {
        this.jobDetail = jobDetail;
    }
    public String getUploadTime() {
        return uploadTime;
    }
    public void setUploadTime(String uploadTime) {
        this.uploadTime = uploadTime;
    }
    public String getLastTime() {
        return lastTime;
    }
    public void setLastTime(String lastTime) {
        this.lastTime = lastTime;
    }
    public int getState() {
        return state;
    }
    public void setState(int state) {
        this.state = state;
    }
    public Teacher getTeacher() {
        return teacher;
    }
    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
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
