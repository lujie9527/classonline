package com.wljx.service;

import java.util.List;

import com.wljx.bean.Doc;
import com.wljx.bean.Docdetail;
import com.wljx.bean.Teacher;

public interface DocService {

	/**
	 * 获取所有资料分类表
	 * @param keyword
	 * @return
	 */
	List<Doc> getAllDocs(String keyword);

	List<Docdetail> getDocDetailsById(int docId);

	void addDocDownload(int docdetailId, String useId, String downTime);

	List<Docdetail> getAllDocDetails();

	void deleteDocDetail(String[] ids);

	List<Doc> getAllDocsByTeacherId(String teacherId);

	void teacherAddDoc(String size,String docId, String name, String url, String filename, String description, Teacher teacher);


}
