package com.wljx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wljx.bean.Liuyan;
import com.wljx.bean.Pinglun;
import com.wljx.bean.Pinglun2;
import com.wljx.mapper.LiuyanMapper;
import com.wljx.service.LiuyanService;
import com.wljx.utils.TimeUtils;
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
	public Liuyan getLiuyanById(int id) {
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
