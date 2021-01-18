package com.soolzari.shop.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soolzari.shop.admin.model.service.AdminService;
import com.soolzari.shop.admin.model.vo.UserPage;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	@RequestMapping("/faq.sool")
	public String faq() {
		return "admin/faq";
	}
	
	@RequestMapping("/admin.sool")
	public String admin() {
		return "admin/admin";
	}
	
	@RequestMapping("/user.sool")
	public String user(int type, int reqPage, Model model) {//1=고객, 2=판매자
		UserPage up = service.selectAllUser(type, reqPage);
		model.addAttribute("list", up.getList());
		model.addAttribute("page", up.getPage());
		model.addAttribute("type", type);
		return "admin/user";
	}
	
	@RequestMapping("/changeOne.sool")
	public String changeOne(int type, int userNo, int grade, Model model) {
		int result = service.changeOne(userNo, grade);
		if(result>0) {
			model.addAttribute("msg", "변경 성공");
		}else {
			model.addAttribute("msg", "변경 실패");
		}
		model.addAttribute("loc", "/user.sool?type="+type+"&reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/changeAll.sool")
	public String changeAll(int type, String userNo, String grade, Model model) {
		int result = service.changeAll(type, userNo, grade);
		if(result>0) {
			model.addAttribute("msg", "변경 성공");
		}else {
			model.addAttribute("msg", "변경 실패");
		}
		model.addAttribute("loc", "/user.sool?type="+type+"&reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/deleteOne.sool")
	public String deleteOne(int type, int userNo, Model model) {
		int result = service.deleteOne(type, userNo);
		if(result>0) {
			model.addAttribute("msg", "탈퇴 성공");
		}else {
			model.addAttribute("msg", "탈퇴 실패");
		}
		model.addAttribute("loc", "/user.sool?type="+type+"&reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/deleteAll.sool")
	public String deleteAll(int type, String userNo, Model model) {
		int result = service.deleteAll(type, userNo);
		if(result>0) {
			model.addAttribute("msg", "탈퇴 성공");
		}else {
			model.addAttribute("msg", "탈퇴 실패");
		}
		model.addAttribute("loc", "/user.sool?type="+type+"&reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/searchUser.sool")
	public String searchUser(String startDate, String endDate, int type, int reqPage, String searchType, String search, Model model) {
		UserPage up = service.searchUser(startDate, endDate, type, searchType, search, reqPage);
		model.addAttribute("list", up.getList());
		model.addAttribute("page", up.getPage());
		model.addAttribute("type", type);
		model.addAttribute("search", search);
		model.addAttribute("searchType", searchType);
		return "admin/user";
	}
}
