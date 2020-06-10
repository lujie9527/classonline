package com.classonline.controller;

import java.io.*;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.classonline.bean.Doc;
import com.classonline.bean.Docdetail;
import com.classonline.service.DocService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 资料下载
 * @author 13603
 *
 */
@Controller
@RequestMapping("/doc")
public class DocController {

	@Autowired
	private DocService docService;

	//获取资料列表
	@RequestMapping("/all")
	public String getAllDocs(@RequestParam(required = false, defaultValue = "1", value = "pageNum") int pageNum
			, Model model, String keyword) {
		PageHelper.startPage(pageNum, 10);//起始页默认为1，每页显示数量为10
		List<Doc> docs = docService.getAllDocs(keyword);
		PageInfo<Doc> pageInfo = new PageInfo<Doc>(docs, 100);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("keyword", keyword);
		return "/qiantai/ziyuanzhongxin/doc_download";
	}


	//根据资料分类id查询资料所有详情
	@RequestMapping("/id/{id}")
	public String getDocDetailsById(@PathVariable("id") int id, Model model) {
		List<Docdetail> docDetails = docService.getDocDetailsById(id);
		model.addAttribute("docDetails", docDetails);
		return "/qiantai/ziyuanzhongxin/doc_detail";
	}

}
