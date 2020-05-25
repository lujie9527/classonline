package com.classonline.service;

import java.util.List;

import com.classonline.bean.Job;
import com.classonline.utils.TeacherPigai;
import com.classonline.utils.TeacherTijiao;

public interface JobService {

	/**
	 * 老师发布作业
	 * @param teacherId
	 * @param name
	 * @param professionId
	 * @param banjiId
	 * @param url
	 * @param lastTime
	 */
	void teacherFabu(String teacherId,String name, Integer professionId, Integer banjiId, String url, String lastTime);

	/**
	 * 获取所有未结束的作业
	 * @param banjiId
	 * @return
	 */
	List<Job> getAllJobs(int banjiId);

	/**
	 * 获取该班级下的作业
	 * @param banjiId
	 * @return
	 */
	List<Job> getJobsByBanjiId(int banjiId);

	/**
	 * 学生提交作业
	 * @param url
	 * @param finishTime
	 * @param stuId
	 * @param jobId
	 */
	void stuTijiao(String url, String finishTime, String stuId, Integer jobId);

	/**
	 * 获取老师批改作业列表
	 * @param name
	 * @param professionId
	 * @param banjiId
	 * @return
	 */
	List<TeacherPigai> getStuJobs(String teacherId,String name, int professionId, int banjiId);

	/**
	 * 为显示教师提交页面准备
	 * @param teacherId
	 * @return
	 */
	List<TeacherTijiao> findJobsForTeacherTijiao(String teacherId);

	/**
	 * 老师提交作业（改好了）
	 * @param grade
	 * @param teacherId
	 * @param jobId
	 * @param professionId
	 * @param banjiId
	 * @param stuId
	 * @param url
	 */
	void teacherTijiao(double grade,String teacherId, int jobId, int professionId, int banjiId, String stuId, String url);

	List<Job> getJobs();

	void deleteJob(String[] ids);

	
}
