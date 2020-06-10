package com.classonline.service;

import java.util.List;

import com.classonline.bean.Liuyan;
import com.classonline.bean.Pinglun;
import com.classonline.bean.Pinglun2;

public interface LiuyanService {

	/**
	 * 获取所有留言
	 * @return
	 */
	List<Liuyan> getALlLiuyans();

	/**
	 * 获取老师的评论
	 */
	List<Pinglun> getTeacherPingluns(int id);

	/**
	 * 获取学生的评论
	 */
	List<Pinglun2> getStuPingluns(int id);

	Liuyan getLiuyanById(Integer id);

	void addLiuyan(String content, String title,String stuId);

	/**
	 * 添加学生评论
	 */
	void addPinglun2(String content, int liuyanId, String stuId);

	/**
	 * 添加老师评论
	 */
	void addPinglun(String content, int liuyanId, String teacherId);

	void deleteLiuyan(String[] ids);

}
