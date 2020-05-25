package com.classonline.service;

import java.util.List;

import com.classonline.bean.Link;

public interface LinkService {

	List<Link> getAllLink();

	void addLink(String name, String url, String imgUrl);

	void updateLink(Integer id, String name, String url, String imgUrl);

	void deleteLinks(String[] ids);

}
