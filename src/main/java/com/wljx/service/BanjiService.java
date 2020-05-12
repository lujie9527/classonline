package com.wljx.service;

import java.util.List;

import com.wljx.bean.Banji;

public interface BanjiService {

	/**
	 * 根据专业id获取该班级
	 * @param pid
	 * @return
	 */
	List<Banji> getBanjisByPid(int pid);

	List<Banji> getBanjis();

	/**
	 * 根据班级id查询该班级
	 * @param banjiId
	 * @return
	 */
	Banji getBanjiById(int banjiId);

	void addBanji(String name, String description, String professionId);

	void updateBanji(Integer id, String name, String description, String professionId);

	void deleteBanji(String[] ids);

}
