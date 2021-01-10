package com.soolzari.shop.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soolzari.shop.admin.model.dao.NoticeDao;
import com.soolzari.shop.admin.model.vo.Notice;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;

	public ArrayList<Notice> selectAllNotice() {
		return dao.selectAllNotice();
	}
}
