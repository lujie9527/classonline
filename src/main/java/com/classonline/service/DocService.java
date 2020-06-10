package com.classonline.service;

import java.util.List;

import com.classonline.bean.Doc;
import com.classonline.bean.Docdetail;
import com.classonline.bean.Teacher;

public interface DocService {

	/**
	 * 获取所有资料分类表
	 * @param keyword
	 * @return
	 */
	List<Doc> getAllDocs(String keyword);


	/**
	 * 根据资料ID获取资料
	 * @param docId
	 * @return
	 */
	List<Docdetail> getDocDetailsById(int docId);

	/**
	 * 下载资料
	 * @param docdetailId
	 * @param useId
	 * @param downTime
	 */
	void addDocDownload(int docdetailId, String useId, String downTime);

	/**
	 * 获取资料的详细信息
	 * @return
	 */
	List<Docdetail> getAllDocDetails();

	void deleteDocDetail(String[] ids);

	List<Doc> getAllDocsByTeacherId(String teacherId);

	void teacherAddDoc(String size,String docId, String name, String url, String filename, String description, Teacher teacher);


}
