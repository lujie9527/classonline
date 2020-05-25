package com.classonline.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.classonline.bean.Link;
import com.classonline.mapper.LinkMapper;
import com.classonline.service.LinkService;
@Service
public class LinkServiceImpl implements LinkService {

	@Autowired
	private LinkMapper linkMapper;
	@Override
	public List<Link> getAllLink() {
		return linkMapper.getAllLink();
	}
	@Transactional
	@Override
	public void addLink(String name, String url, String imgUrl) {
		linkMapper.addLink(name,url,imgUrl);
		
	}
	@Transactional
	@Override
	public void updateLink(Integer id, String name, String url, String imgUrl) {
		linkMapper.updateLink(id,name,url,imgUrl);
	}
	@Transactional
	@Override
	public void deleteLinks(String[] ids) {
		for(String id:ids) {
			linkMapper.deleteLink(Integer.valueOf(id));
		}
		
	}

}
