package com.soolzari.shop.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soolzari.shop.admin.model.service.NoticeService;
import com.soolzari.shop.admin.model.vo.Notice;

@RequestMapping("/notice")
@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/list.sool")
	public String noticeList(Model model) {
		ArrayList<Notice> list = service.selectAllNotice();
		model.addAttribute("list", list);
		return "admin/noticeList";
	}
}
