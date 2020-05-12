package com.wljx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wljx.bean.Banji;
import com.wljx.mapper.BanjiMapper;
import com.wljx.service.BanjiService;
@Service
public class BanjiServiceImpl implements BanjiService {

	@Autowired
	private BanjiMapper banjiMapper;
	@Override
	public List<Banji> getBanjisByPid(int pid) {
		return banjiMapper.getBanjisByPid(pid);
	}
	@Override
	public List<Banji> getBanjis() {
		return banjiMapper.getBanjis();
	}
	@Override
	public Banji getBanjiById(int banjiId) {
		return banjiMapper.getBanjiById(banjiId);
	}
	@Transactional
	@Override
	public void addBanji(String name, String description, String professionId) {
		banjiMapper.addBanji(name,description,professionId);
		
	}
	@Transactional
	@Override
	public void updateBanji(Integer id, String name, String description, String professionId) {
		banjiMapper.updateBanji(id,name,description,professionId);
	}
	@Transactional
	@Override
	public void deleteBanji(String[] ids) {
		for(String id:ids) {
			banjiMapper.deleteBanji(Integer.valueOf(id));
		}
		
	}

}
