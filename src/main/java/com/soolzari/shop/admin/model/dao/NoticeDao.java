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

	public ArrayList<Notice> selectAllNotice() {
		List<Notice> list = session.selectList("admin.selectAllNotice");
		return (ArrayList<Notice>)list;
	}
}
