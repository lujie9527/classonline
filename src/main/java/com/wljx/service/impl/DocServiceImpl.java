package com.wljx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wljx.bean.Doc;
import com.wljx.bean.Docdetail;
import com.wljx.bean.Teacher;
import com.wljx.mapper.DocMapper;
import com.wljx.service.DocService;
import com.wljx.utils.TimeUtils;
@Service
public class DocServiceImpl implements DocService {

	@Autowired
	private DocMapper docMapper;
	@Override
	public List<Doc> getAllDocs(String keyword) {
		return docMapper.getAllDocs(keyword);
	}
	@Override
	public List<Docdetail> getDocDetailsById(int docId) {
		return docMapper.getDocDetailsById(docId);
	}
	@Override
	public void addDocDownload(int docdetailId, String stuId, String downTime) {
		 docMapper.addDocDetailDownload(docdetailId,stuId,downTime);
	}
	@Override
	public List<Docdetail> getAllDocDetails() {
		return docMapper.getAllDocDetails();
	}
	@Transactional
	@Override
	public void deleteDocDetail(String[] ids) {
		for(String id:ids) {
			docMapper.deleteDocDetail(Integer.valueOf(id));
		}
	}
	@Override
	public List<Doc> getAllDocsByTeacherId(String teacherId) {
		return docMapper.getAllDocsByTeacherId(teacherId);
	}
	@Transactional
	@Override
	public void teacherAddDoc(String size,String docId, String name, String url, String filename, String description, Teacher teacher) {
		String createTime = TimeUtils.getCurrentTime();
		//封装Doc
		Doc doc=new Doc();
		doc.setCreateTime(createTime);
		doc.setName(name);
		doc.setTeacher(teacher);
		
		
		if("-1".equals(docId)) {
			//需要插入doc表
			docMapper.addDoc(doc);
			docMapper.addDocDetail(doc.getId(),filename,url,createTime,size,description);
		}else {
			docMapper.addDocDetail(Integer.valueOf(docId),filename,url,createTime,size,description);
		}
	}

}
