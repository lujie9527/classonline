package com.classonline.utils;

public class TeacherTijiao2 {

    private int id;//jobId
    private String jobTitle;//jobName
    private String jobDetail;
    private int banjiId;
    private int professionId;

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

    public String getJobDetail(){
        return jobDetail;
    }

    public void setJobDetail(String jobDetail){
        this.jobDetail = jobDetail;
    }

    public int getBanjiId() {
        return banjiId;
    }
    public void setBanjiId(int banjiId) {
        this.banjiId = banjiId;
    }
    public int getProfessionId() {
        return professionId;
    }
    public void setProfessionId(int professionId) {
        this.professionId = professionId;
    }
}
