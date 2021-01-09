package com.soolzari.shop.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping("/faq.sool")
	public String faq() {
		return "admin/faq";
	}
}
