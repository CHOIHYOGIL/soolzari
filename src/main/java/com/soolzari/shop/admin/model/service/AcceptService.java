package com.soolzari.shop.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soolzari.shop.admin.model.dao.AcceptDao;

@Service
public class AcceptService {
	@Autowired
	private AcceptDao dao;
}
