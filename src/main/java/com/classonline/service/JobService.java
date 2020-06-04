package com.classonline.service;

import com.classonline.bean.Job;
import com.classonline.bean.StuJob;
import com.classonline.utils.TeacherPigai2;
import com.classonline.utils.TeacherTijiao2;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface JobService {


    void teacherFabu(String jobTitle,String jobDetail, String lastTime,String teacherId,Integer banjiId,
                     Integer professionId);


    List<Job> getAllJobs(int banjiId);



    List<Job> getJobsByBanjiId(int banjiId);


    void stuTijiao(String homework, String finishTime, String stuId,String stuName, Integer jobId);


    List<TeacherPigai2> getStuJobs(String teacherId, String jobTitle, int professionId, int banjiId);


    List<TeacherTijiao2> findJobsForTeacherTijiao(String teacherId);


    void teacherTijiao(double grade,String teacherId, int jobId, int professionId, int banjiId, String stuId, String jobDetail);

    List<Job> getJobs();

    void deleteJob(String[] ids);

    List<StuJob> getStuJobById(Integer jobId);

//    List<TeacherPigai2> getStudentJob(Integer jobId);

    void uploadGrade(@Param("jobGrade") Integer jobGrade, @Param("id") Integer id);

    Job getJobById(Integer id);

    List<StuJob> getStuHomework(String stuId);

    int getState(Integer id);

    void updateState(@Param("state") Integer state,@Param("id") Integer id);

}
