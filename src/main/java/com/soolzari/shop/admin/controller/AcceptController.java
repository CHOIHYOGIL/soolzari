package com.soolzari.shop.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.soolzari.shop.admin.model.service.AcceptService;

@Controller
public class AcceptController {
	@Autowired
	private AcceptService service;
}
