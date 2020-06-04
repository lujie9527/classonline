package com.classonline.service.impl;

import com.classonline.bean.Job;
import com.classonline.bean.StuJob;
import com.classonline.bean.Teacher;
import com.classonline.mapper.JobMapper;
import com.classonline.service.JobService;
import com.classonline.utils.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.swing.event.ListDataEvent;
import java.util.ArrayList;
import java.util.List;

@Service
public class JobServiceImpl implements JobService {

    @Autowired
    private JobMapper jobMapper;

    @Transactional
    @Override
    public void teacherFabu(String jobTitle,String jobDetail, String lastTime,String teacherId,Integer banjiId,
                            Integer professionId) {
        //获取当前时间
        String uploadTime=TimeUtils.getCurrentTime();
        jobMapper.teacherFabu(jobTitle,jobDetail,uploadTime,lastTime,teacherId,banjiId,professionId);
    }

    @Override
//	使用@Override注解主要有两个好处：
//
//	1）帮助自己检查是否正确的重写父类方法
//
//  2）明显的提示看代码的人，这是重写的方法
    public List<Job> getAllJobs(int banjiId) {
        return jobMapper.getAllJobs(banjiId);
    }


    @Override
    public List<Job> getJobsByBanjiId(int banjiId) {
        return jobMapper.getJobsByBanjiId(banjiId);
    }


    @Transactional
    @Override
    public void stuTijiao(String homework, String finishTime, String stuId,String stuName, Integer jobId) {
        jobMapper.stuTijiao(homework,finishTime,stuId,stuName,jobId);
    }


    @Override
    public List<TeacherPigai2> getStuJobs(String teacherId, String name, int professionId, int banjiId) {

        List<Job> jobs=jobMapper.findJobsByTeacherId(teacherId,name,professionId,banjiId);

        List<TeacherPigai2> pigais = new ArrayList<TeacherPigai2>();
        TeacherPigai2 tg = null;
        for (Job job : jobs) {
            tg = new TeacherPigai2();
            List<StuJob> stuJobs = jobMapper.getStuJobsByJobId(job.getId());
            for (StuJob sj : stuJobs) {
                tg.setStu_jobId(sj.getId());
                tg.setJobTitle(job.getJobTitle());
                tg.setStuName(sj.getStudent().getName());
                tg.setProfessionName(job.getProfession().getName());
                tg.setBanjiName(job.getBanji().getName());
                tg.setJobfabuTime(job.getUploadTime());
                tg.setJobfinishTime(sj.getFinishTime());
                tg.setJoblastTime(job.getLastTime());
                tg.setStu_homework(sj.getHomework());

                pigais.add(tg);
            }
        }
        return pigais;
    }




    @Override
    public List<TeacherTijiao2> findJobsForTeacherTijiao(String teacherId) {

        return jobMapper.findJobsForTeacherTijiao(teacherId);
    }


    @Transactional
    @Override
    public void teacherTijiao(double grade,String teacherId, int jobId, int professionId, int banjiId, String stuId, String jobDetail) {
        //获取当前时间
        String pigaiTime = TimeUtils.getCurrentTime();
        jobMapper.teacherTijiao(stuId,jobId,teacherId,jobDetail,grade,pigaiTime,banjiId,professionId);
    }


    @Override
    public List<Job> getJobs() {
        return jobMapper.getJobs();
    }


    @Transactional
    @Override
    public void deleteJob(String[] ids) {
        for(String id:ids) {
            jobMapper.deleteJob(Integer.valueOf(id));

        }
    }


    public List<StuJob> getStuJobById(Integer jobId){
        return jobMapper.getStuJobById(jobId);
    }


//    public List<TeacherPigai2> getStudentJob(int jobId){
//
//        Job job = jobMapper
//        List<TeacherPigai2> teacherPigai2s = new ArrayList<TeacherPigai2>();
//    }

    public void uploadGrade(@Param("jobGrade") Integer jobGrade, @Param("id") Integer id){
        jobMapper.uploadGrade(jobGrade,id);
    }

    public Job getJobById(Integer id){
        return jobMapper.getJobById(id);
    }

    public List<StuJob> getStuHomework(String stuId){
        return jobMapper.getStuHomework(stuId);
    }

    public int getState(Integer id){
        return jobMapper.getState(id);
    }

    public void updateState(@Param("state") Integer state,@Param("id") Integer id){

        jobMapper.updateState(state,id);
    }

}
