package com.wljx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wljx.bean.Profession;
import com.wljx.mapper.ProfessionMapper;
import com.wljx.service.ProfessionService;
@Service
public class ProfessionServiceImpl implements ProfessionService {
	@Autowired
	private ProfessionMapper professionMapper;
	@Override
	public List<Profession> getProfessions() {
		return professionMapper.getProfessions();
	}
	@Override
	public Profession getProfessionById(int professionId) {
		return professionMapper.getProfessionById(professionId);
	}
	@Transactional
	@Override
	public void addProfession(Profession profession) {
		professionMapper.addProfession(profession.getName(),profession.getIntroduction());
		
	}
	@Transactional
	@Override
	public void updateProfession(Profession profession) {
		professionMapper.updateProfession(profession.getId(),profession.getName(),profession.getIntroduction());
		
	}
	@Transactional
	@Override
	public void deleteProfession(String[] ids) {

		for(String id:ids) {
			professionMapper.deleteProfession(Integer.valueOf(id));
		}
		
	}

}
