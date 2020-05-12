package com.wljx.service;

import java.util.List;

import com.wljx.bean.Link;

public interface LinkService {

	List<Link> getAllLink();

	void addLink(String name, String url, String imgUrl);

	void updateLink(Integer id, String name, String url, String imgUrl);

	void deleteLinks(String[] ids);

}
