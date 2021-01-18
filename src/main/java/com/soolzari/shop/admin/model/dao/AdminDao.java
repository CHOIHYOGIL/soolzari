package com.soolzari.shop.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soolzari.shop.admin.model.vo.Qrv;
import com.soolzari.shop.admin.model.vo.User;
import com.soolzari.shop.client.model.vo.Qna;

@Repository
public class AdminDao {
	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<User> selectAllClient(HashMap<String, Integer> map) {
		List<User> list = session.selectList("admin.selectAllClient", map);
		return (ArrayList<User>)list;
	}

	public int totalClient() {
		return session.selectOne("admin.totalClient");
	}

	public ArrayList<User> selectAllSeller(HashMap<String, Integer> map) {
		List<User> list = session.selectList("admin.selectAllSeller", map);
		return (ArrayList<User>)list;
	}

	public int totalSeller() {
		return session.selectOne("admin.totalSeller");
	}

	public int updateGrade(int userNo, HashMap<String, Integer> map) {
		return session.update("admin.updateGrade", map);
	}

	public int delete(HashMap<String, Integer> map) {
		return session.delete("admin.deleteUser", map);
	}

	public ArrayList<User> searchClient(HashMap<String, Object> map) {
		List<User> list = session.selectList("admin.searchClient", map);
		return (ArrayList<User>)list;
	}

	public ArrayList<User> searchSeller(HashMap<String, Object> map) {
		List<User> list = session.selectList("admin.searchSeller", map);
		return (ArrayList<User>)list;
	}

	public int totalSearch(HashMap<String, Object> map) {
		return session.selectOne("admin.totalSearch", map);
	}

	public ArrayList<Qna> selectAllQna(HashMap<String, Integer> map) {
		List<Qna> list = session.selectList("admin.selectAllQna", map);
		return (ArrayList<Qna>)list;
	}

	public int totalQna() {
		return session.selectOne("admin.totalQna");
	}

	public Qna selectOneQna(int qnaNo) {
		return session.selectOne("admin.selectOneQna", qnaNo);
	}

	public Qrv selectOneQrv(int qnaNo) {
		return session.selectOne("admin.selectOneQrv", qnaNo);
	}

	public int deleteQna(int qnaNo) {
		return session.delete("admin.deleteQna", qnaNo);
	}

	public ArrayList<Qna> searchQna(HashMap<String, Object> map) {
		List<Qna> list = session.selectList("admin.searchQna", map);
		return (ArrayList<Qna>)list;
	}

	public int totalQnaSearch(HashMap<String, Object> map) {
		return session.selectOne("admin.totalQnaSearch", map);
	}

}
