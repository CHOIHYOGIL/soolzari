package com.soolzari.shop.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soolzari.shop.admin.model.vo.Notice;


@Repository
public class NoticeDao {
	@Autowired
	SqlSessionTemplate session;

	public ArrayList<Notice> selectAllNotice(HashMap<String, Integer> pageNo) {
		List<Notice> list = session.selectList("admin.selectAllNotice", pageNo);
		return (ArrayList<Notice>)list;
	}

	public int totalCount() {
		return session.selectOne("admin.totalCount");
	}

	public int insertNotice(Notice n) {
		return session.insert("admin.insertNotice", n);
	}

	public int deleteNotice(int noticeNo) {
		return session.delete("admin.deleteNotice", noticeNo);
	}

	public ArrayList<Notice> findNotice(HashMap<String, Object> map) {
		List<Notice> list = session.selectList("admin.findNotice", map);
		return (ArrayList<Notice>)list;
	}

	public Notice selectOneNotice(int noticeNo) {
		return session.selectOne("admin.selectOneNotice", noticeNo);
	}

	public int updateNotice(Notice n) {
		return session.update("admin.updateNotice", n);
	}
}
