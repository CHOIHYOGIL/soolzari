package com.soolzari.shop.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soolzari.shop.admin.model.vo.Notice;

@Repository
public class NoticeDao {
	@Autowired
	SqlSessionTemplate session;

	public ArrayList<Notice> selectAllNotice(int start, int end) {
		int[] page = {start, end};
		List<Notice> list = session.selectList("admin.selectAllNotice", page);
		return (ArrayList<Notice>)list;
	}
}
