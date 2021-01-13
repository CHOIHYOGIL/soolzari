package com.soolzari.shop.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soolzari.shop.admin.model.service.NoticeService;
import com.soolzari.shop.admin.model.vo.Notice;
import com.soolzari.shop.admin.model.vo.NoticePage;

@RequestMapping("/notice")
@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/list.sool")
	public String noticeList(int reqPage, Model model) {
		NoticePage np = service.selectAllNotice(reqPage);
		model.addAttribute("list", np.getList());
		model.addAttribute("page", np.getPage());
		return "admin/noticeList";
	}
	
	@RequestMapping("/form.sool")
	public String noticeFrm() {
		return "admin/noticeFrm";
	}
	
	
}
