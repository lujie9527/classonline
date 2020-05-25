package com.classonline.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.classonline.bean.Job;
import com.classonline.bean.StuJob;
import com.classonline.mapper.JobMapper;
import com.classonline.service.JobService;
import com.classonline.utils.TeacherPigai;
import com.classonline.utils.TeacherTijiao;
import com.classonline.utils.TimeUtils;

@Service
public class JobServiceImpl implements JobService{

	@Autowired
	private JobMapper jobMapper;
	
	@Transactional
	@Override
	public void teacherFabu(String teacherId,String name, Integer professionId, Integer banjiId, String url, String lastTime) {
		//获取当前时间
		String uploadTime=TimeUtils.getCurrentTime();
		jobMapper.teacherFabu(name,url,uploadTime,lastTime,teacherId,banjiId,professionId);
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
	public void stuTijiao(String url, String finishTime, String stuId, Integer jobId) {
		jobMapper.stuTijiao(url,finishTime,stuId,jobId);
	}


	@Override
	public List<TeacherPigai> getStuJobs(String teacherId,String name, int professionId, int banjiId) {

		List<Job> jobs=jobMapper.findJobsByTeacherId(teacherId,name,professionId,banjiId);
		
		List<TeacherPigai> pigais = new ArrayList<TeacherPigai>();
		TeacherPigai tg = null;
		for (Job job : jobs) {
			tg = new TeacherPigai();
			List<StuJob> stuJobs = jobMapper.getStuJobsByJobId(job.getId());
			for (StuJob sj : stuJobs) {
				tg.setStu_jobId(sj.getId());
				tg.setJobName(job.getName());
				tg.setStuName(sj.getStudent().getName());
				tg.setProfessionName(job.getProfession().getName());
				tg.setBanjiName(job.getBanji().getName());
				tg.setJobfabuTime(job.getUploadTime());
				tg.setJobfinishTime(sj.getFinishTime());
				tg.setJoblastTime(job.getLastTime());
				tg.setStu_job_url(sj.getUrl());

				pigais.add(tg);
			}
		}
		return pigais;
	}


	@Override
	public List<TeacherTijiao> findJobsForTeacherTijiao(String teacherId) {
		
		return jobMapper.findJobsForTeacherTijiao(teacherId);
	}


	@Transactional
	@Override
	public void teacherTijiao(double grade,String teacherId, int jobId, int professionId, int banjiId, String stuId, String url) {
		//获取当前时间
		String pigaiTime = TimeUtils.getCurrentTime();
		jobMapper.teacherTijiao(stuId,jobId,teacherId,url,grade,pigaiTime,banjiId,professionId);
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

}
