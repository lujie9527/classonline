package com.classonline.bean;

public class StuJob {

    private int id;
    private String finishTime;
    private String homework;
    private Integer jobGrade;

    private Student student;
    private Job job;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getFinishTime() {
        return finishTime;
    }
    public void setFinishTime(String finishTime) {
        this.finishTime = finishTime;
    }
    public String getHomework() {
        return homework;
    }
    public void setHomework(String homework) {
        this.homework = homework;
    }
    public Integer getJobGrade(){
        return jobGrade;
    }
    public void setJobGrade(Integer jobGrade){
        this.jobGrade = jobGrade;
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
}
