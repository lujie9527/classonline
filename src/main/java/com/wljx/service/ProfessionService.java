package com.wljx.service;

import java.util.List;

import com.wljx.bean.Profession;

public interface ProfessionService {

	/**
	 * 查询所有专业
	 * @return
	 */
	List<Profession> getProfessions();

	/**
	 * 根据专业id查询该专业
	 * @param professionId
	 * @return
	 */
	Profession getProfessionById(int professionId);

	void addProfession(Profession profession);

	void updateProfession(Profession profession);

	void deleteProfession(String[] ids);

}
