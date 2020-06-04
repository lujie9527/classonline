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
	 *
	 * @param docId
	 * @return
	 */
	List<Docdetail> getDocDetailsById(int docId);

	void addDocDownload(int docdetailId, String useId, String downTime);

	List<Docdetail> getAllDocDetails();

	void deleteDocDetail(String[] ids);

	List<Doc> getAllDocsByTeacherId(String teacherId);

	void teacherAddDoc(String size,String docId, String name, String url, String filename, String description, Teacher teacher);


}
