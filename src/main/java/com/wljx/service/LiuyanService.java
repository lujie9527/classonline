package com.wljx.service;

import java.util.List;

import com.wljx.bean.Liuyan;
import com.wljx.bean.Pinglun;
import com.wljx.bean.Pinglun2;

public interface LiuyanService {

	/**
	 * 获取所有留言
	 * @return
	 */
	List<Liuyan> getALlLiuyans();

	/**
	 * 获取老师的评论
	 * @param id
	 * @return
	 */
	List<Pinglun> getTeacherPingluns(int id);

	/**
	 * 获取学生的评论
	 * @param id
	 * @return
	 */
	List<Pinglun2> getStuPingluns(int id);

	Liuyan getLiuyanById(int id);

	void addLiuyan(String content, String title,String stuId);

	/**
	 * 添加学生评论
	 * @param content
	 * @param liuyanId
	 * @param id
	 */
	void addPinglun2(String content, int liuyanId, String stuId);

	/**
	 * 添加老师评论
	 * @param content
	 * @param liuyanId
	 * @param teacherId
	 */
	void addPinglun(String content, int liuyanId, String teacherId);

	void deleteLiuyan(String[] ids);

}
