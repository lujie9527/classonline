package com.classonline.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.classonline.bean.Liuyan;
import com.classonline.bean.Pinglun;
import com.classonline.bean.Pinglun2;
import com.classonline.mapper.LiuyanMapper;
import com.classonline.service.LiuyanService;
import com.classonline.utils.TimeUtils;
@Service
public class LiuyanServiceImpl implements LiuyanService {

	@Autowired
	private LiuyanMapper liuyanMapper;

	@Override
	public List<Liuyan> getALlLiuyans() {
		return liuyanMapper.getAllLiuyans();
	}

	@Override
	public List<Pinglun> getTeacherPingluns(int id) {
		return liuyanMapper.getTeacherPingluns(id);
	}

	@Override
	public List<Pinglun2> getStuPingluns(int id) {
		return liuyanMapper.getStuPingluns(id);
	}

	@Override
	public Liuyan getLiuyanById(Integer id) {
		return liuyanMapper.getLiuyanById(id);
	}

	@Transactional
	@Override
	public void addLiuyan(String content, String title, String stuId) {
		//获取当前时间
		String liuyanTime = TimeUtils.getCurrentTime();
		liuyanMapper.addLiuyan(title,content,liuyanTime,0,0,stuId);
	}

	@Transactional
	@Override
	public void addPinglun2(String content, int liuyanId, String stuId) {
		String plTime=TimeUtils.getCurrentTime();
		liuyanMapper.addPinglun2(content,liuyanId,stuId,plTime);
		
		//修改留言的回答数
		int answer= liuyanMapper.getAnswerById(liuyanId);
		answer+=1;
		liuyanMapper.updateAnswer(liuyanId,answer);
	}

	@Transactional
	@Override
	public void addPinglun(String content, int liuyanId, String teacherId) {
		String plTime=TimeUtils.getCurrentTime();
		liuyanMapper.addPinglun(content,liuyanId,teacherId,plTime);
		
		//修改留言的回答数
		int answer= liuyanMapper.getAnswerById(liuyanId);
		answer+=1;
		liuyanMapper.updateAnswer(liuyanId,answer);
	}

	@Transactional
	@Override
	public void deleteLiuyan(String[] ids) {
		for(String id:ids) {
			liuyanMapper.deleteLiuyan(Integer.valueOf(id));
			
		}
		
	}
}
