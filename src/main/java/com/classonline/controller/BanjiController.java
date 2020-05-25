package com.classonline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.classonline.bean.Banji;
import com.classonline.service.BanjiService;

@Controller
@RequestMapping("/banji")
public class BanjiController {
	@Autowired
	private BanjiService banjiService;
	
	@PostMapping("/professionId")
	@ResponseBody
	public List<Banji> getBanjisByProfessionId(Integer pid){
		List<Banji> banjis=banjiService.getBanjisByPid(pid);
		return banjis;
	}
}
