package com.soolzari.shop.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soolzari.shop.admin.model.dao.NoticeDao;
import com.soolzari.shop.admin.model.vo.Notice;
import com.soolzari.shop.admin.model.vo.NoticePage;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;

	public NoticePage selectAllNotice(int reqPage) {		
		int numPerPage = 10;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<Notice> list = dao.selectAllNotice(start, end);
		NoticePage np = new NoticePage();
		np.setList(list);
		return np;
	}
}
