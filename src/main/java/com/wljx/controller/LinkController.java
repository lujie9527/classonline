package com.wljx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wljx.bean.Link;
import com.wljx.service.LinkService;

@Controller
@RequestMapping("/link")
public class LinkController {
	@Autowired
	private LinkService linkService;
	@RequestMapping("/all")
	public String getAllLink(Model model) {
		List<Link> links=linkService.getAllLink();
		model.addAttribute("links", links);
		return "/qiantai/youqinglianjie/link";
	}
}
