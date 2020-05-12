package com.wljx.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wljx.bean.Docdownload;
import com.wljx.bean.Student;
import com.wljx.bean.TeacherJob;
import com.wljx.mapper.StudentMapper;
import com.wljx.service.StudentService;
import com.wljx.utils.JobExtend;
import com.wljx.utils.MD5Utils;
import com.wljx.utils.MyDown;
import com.wljx.utils.MyDownExtend;
import com.wljx.utils.MyJob;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentMapper studentMapper;
	@Override
	public Student login(String name, String password) {
		Student stu = studentMapper.login(name,MD5Utils.md5(password));
		return stu; 
	}
	@Override
	public List<Student> getStusByBanjiId(int banjiId) {
		return studentMapper.getStusByBanjiId(banjiId);
	}
	@Transactional
	@Override
	public void updateStuUrl(String id, String url) {
		studentMapper.updateStuUrl(id,url);
	}
	@Override
	public Student getStuById(String id) {
		return studentMapper.getStuById(id);
	}
	@Override
	public void updateStuPwd(String id, String password) {
		studentMapper.updateStuPwd(id,password);
	}
	@Override
	public MyJob getMyJob(String stuId) {
		 List<TeacherJob> lists = studentMapper.getMyJob(stuId);
		 MyJob myJob=new MyJob();
		 List<JobExtend> jes=new ArrayList<JobExtend>();
		 JobExtend je=null;
		 for(TeacherJob tj:lists) {
			 je=new JobExtend();
			 je.setJobId(tj.getJob().getId());
			 je.setJobName(tj.getJob().getName());
			 je.setGrade(tj.getGrade());
			 je.setPigaiTeacher(tj.getTeacher().getName());
			 je.setPigaiTime(tj.getPigaiTime());
			 je.setUrl(tj.getUrl());
			 jes.add(je);
		 }
		 myJob.setCode(0);
		 myJob.setMsg("");
		 myJob.setCount(jes.size());
		 myJob.setData(jes);
		 return myJob;
	}
	@Override
	public MyDown getMyDown(String stuId) {
		 List<Docdownload> lists = studentMapper.getMyDown(stuId);
		 MyDown myDown=new MyDown();
		 List<MyDownExtend> mdes=new ArrayList<MyDownExtend>();
		 MyDownExtend mde=null;
		 for(Docdownload dd:lists) {
			mde=new MyDownExtend();
			mde.setDocName(dd.getDocdetail().getDoc().getName());
			mde.setFileName(dd.getDocdetail().getName());
			mde.setFileSize(dd.getDocdetail().getSize());
			mde.setDownloadTime(dd.getDownTime());
			mde.setDescription(dd.getDocdetail().getDescription());
			mdes.add(mde);
		 }
		 myDown.setCode(0);
		 myDown.setMsg("");
		 myDown.setCount(mdes.size());
		 myDown.setData(mdes);
		 return myDown;
	}
	@Override
	public List<Student> getStus() {
		return studentMapper.getStus();
	}
	@Transactional
	@Override
	public void addStudent(Student stu, Integer banjiId, Integer professionId) {
		String id = stu.getId();
		stu.setId(id.replace(",", ""));
		String newPwd = MD5Utils.md5(stu.getPassword());
		stu.setPassword(newPwd);
		studentMapper.addStudent(stu.getId(),stu.getName(),newPwd,stu.getSex(),stu.getAge(),stu.getRuxueTime(),stu.getUrl(),banjiId,professionId);
	}
	@Transactional
	@Override
	public void updateStudent(Student stu, Integer banjiId, Integer professionId) {
		if(stu.getPassword()!=null && stu.getPassword().length()!=32) {
			stu.setPassword(MD5Utils.md5(stu.getPassword()));
		}
		studentMapper.updateStudent(stu.getId(),stu.getName(),stu.getPassword(),stu.getSex(),stu.getAge(),stu.getRuxueTime(),stu.getUrl(),banjiId,professionId);
		
	}
	@Transactional
	@Override
	public void deleteStudent(String[] ids) {
		for(String id:ids) {
			studentMapper.deleteStudent(id);
		}
	}

}
