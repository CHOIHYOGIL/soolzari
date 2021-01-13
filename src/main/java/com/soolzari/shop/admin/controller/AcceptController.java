package com.soolzari.shop.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soolzari.shop.admin.model.service.AcceptService;

@Controller
public class AcceptController {
	@Autowired
	private AcceptService service;
	
	@RequestMapping("/accept.sool")
	public String accept() {
		return "admin/accept";
	}
}
