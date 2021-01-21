package com.soolzari.shop.admin.model.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soolzari.shop.admin.model.dao.AdminDao;
import com.soolzari.shop.admin.model.vo.Qrv;
import com.soolzari.shop.admin.model.vo.User;
import com.soolzari.shop.admin.model.vo.UserPage;
import com.soolzari.shop.client.model.vo.Qna;
import com.soolzari.shop.client.model.vo.QnaPageData;

@Service
public class AdminService {
	@Autowired
	private AdminDao dao;

	public UserPage selectAllUser(int type, int reqPage) {
		int numPerPage = 5;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<User> list = new ArrayList<User>();
		int totalCount = 0;
		if(type == 1) {
			list = dao.selectAllClient(map);
			totalCount = dao.totalClient();
		}else if(type == 2) {
			list = dao.selectAllSeller(map);
			totalCount = dao.totalSeller();
		}
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = (totalCount/numPerPage)+1;
		}
		int pageNaviSize = 5;
		String page = "";
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		if(pageNo>1) {
			page += "<a href='/user.sool?type="+type+"&reqPage=1'><<</a>";
			page += "<a href='/user.sool?type="+type+"&reqPage="+(pageNo-1)+"'><</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage != pageNo) {
				page += "<a href='/user.sool?type="+type+"&reqPage="+pageNo+"' class='num'>"+pageNo+"</a>";
			}else {
				page += "<span class='sel'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			page += "<a href='/user.sool?type="+type+"&reqPage="+pageNo+"'>></a>";
			page += "<a href='/user.sool?type="+type+"&reqPage="+totalPage+"'>>></a>";
		}
		UserPage up = new UserPage();
		up.setList(list);
		up.setPage(page);
		return up;
	}

	@Transactional
	public int changeOne(int userNo, int grade) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("userNo", userNo);
		map.put("grade", grade);
		return dao.updateGrade(userNo, map);
	}

	@Transactional
	public int changeAll(int type, String userNo, String grade) {
		StringTokenizer st = new StringTokenizer(userNo, "/");
		StringTokenizer st2 = new StringTokenizer(grade, "/");
		int result = 0;
		while(st.hasMoreTokens()) {
			int cliNo = Integer.parseInt(st.nextToken());
			int gradeNo = Integer.parseInt(st2.nextToken());
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("userNo", cliNo);
			map.put("grade", gradeNo);
			result = dao.updateGrade(cliNo, map);
			if(result == 0) {
				break;
			}
		}
		return result;
	}

	@Transactional
	public int deleteOne(int type, int userNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("type", type);
		map.put("userNo", userNo);
		return dao.delete(map);
	}

	@Transactional
	public int deleteAll(int type, String userNo) {
		StringTokenizer st = new StringTokenizer(userNo, "/");
		int result = 0;
		while(st.hasMoreTokens()) {
			int useNo = Integer.parseInt(st.nextToken());
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("type", type);
			map.put("userNo", useNo);
			result = dao.delete(map);
			if(result == 0) {
				break;
			}
		}
		return result;
	}

	public UserPage searchUser(String startDate, String endDate, int type, String searchType, String search,
			int reqPage) {
		int numPerPage = 5;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("search", search);
		map.put("searchType", searchType);//id, name
		map.put("type", type);
		ArrayList<User> list = new ArrayList<User>();
		int totalCount = 0;
		if(type == 1) {
			list = dao.searchClient(map);
			totalCount = dao.totalSearch(map);
		}else if(type == 2) {
			list = dao.searchSeller(map);
			totalCount = dao.totalSearch(map);
		}
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = (totalCount/numPerPage)+1;
		}
		int pageNaviSize = 5;
		String page = "";
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		if(pageNo>1) {
			page += "<a href='/searchUser.sool?type="+type+"&reqPage=1&startDate="+startDate+"&endDate="+endDate+"&search="+search+"&searchType="+searchType+"'><<</a>";
			page += "<a href='/searchUser.sool?type="+type+"&reqPage="+(pageNo-1)+"&startDate="+startDate+"&endDate="+endDate+"&search="+search+"&searchType="+searchType+"'><</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage != pageNo) {
				page += "<a href='/searchUser.sool?type="+type+"&reqPage="+pageNo+"&startDate="+startDate+"&endDate="+endDate+"&search="+search+"&searchType="+searchType+"' class='num'>"+pageNo+"</a>";
			}else {
				page += "<span class='sel'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			page += "<a href='/searchUser.sool?type="+type+"&reqPage="+pageNo+"&startDate="+startDate+"&endDate="+endDate+"&search="+search+"&searchType="+searchType+"'>></a>";
			page += "<a href='/searchUser.sool?type="+type+"&reqPage="+totalPage+"&startDate="+startDate+"&endDate="+endDate+"&search="+search+"&searchType="+searchType+"'>>></a>";
		}
		UserPage up = new UserPage();
		up.setList(list);
		up.setPage(page);
		return up;
	}

	public QnaPageData selectAllQna(int reqPage) {
		int numPerPage = 10;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Qna> list = dao.selectAllQna(map);
		int totalCount = dao.totalQna();
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = (totalCount/numPerPage)+1;
		}
		int pageNaviSize = 5;
		String page = "";
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		if(pageNo>1) {
			page += "<a href='/qna.sool?reqPage=1'><<</a>";
			page += "<a href='/qna.sool?reqPage="+(pageNo-1)+"'><</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage != pageNo) {
				page += "<a href='/qna.sool?reqPage="+pageNo+"' class='num'>"+pageNo+"</a>";
			}else {
				page += "<span class='sel'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			page += "<a href='/qna.sool?reqPage="+pageNo+"'>></a>";
			page += "<a href='/qna.sool?reqPage="+totalPage+"'>>></a>";
		}
		QnaPageData qpd = new QnaPageData();
		qpd.setList(list);
		qpd.setPageNavi(page);
		return qpd;
	}

	public Qna selectOneQna(int qnaNo) {
		return dao.selectOneQna(qnaNo);
	}

	public Qrv selectOneQrv(int qnaNo) {
		return dao.selectOneQrv(qnaNo);
	}

	@Transactional
	public int deleteQna(String qnaNo) {
		StringTokenizer st = new StringTokenizer(qnaNo,"/");
		int result = 0;
		while(st.hasMoreTokens()) {
			int qna = Integer.parseInt(st.nextToken());
			result = dao.deleteQna(qna);
			if(result == 0) {
				break;
			}
		}
		return result;
	}

	public QnaPageData searchQna(String date, String type, String search, int reqPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Date d = new Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String today = sdf.format(d);
    	Calendar cal = Calendar.getInstance();
    	cal.setTime(d);
    	if(date.equals("week")) {
        	cal.add(Calendar.DATE, -7);
        	String week = sdf.format(cal.getTime());
        	map.put("week", week);
    	}else if(date.equals("month")) {
    		cal.add(Calendar.MONTH, -1);
        	String month = sdf.format(cal.getTime());
        	map.put("month", month);
    	}
		map.put("type", type);//title, content, writer
		map.put("search", search);
		int numPerPage = 10;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		map.put("start", start);
		map.put("end", end);
		ArrayList<Qna> list = dao.searchQna(map);
		QnaPageData qpd = new QnaPageData();
		qpd.setList(list);
		int totalCount = dao.totalQnaSearch(map);//총 게시물 수
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = (totalCount/numPerPage)+1;
		}
		int pageNaviSize = 5;
		String page = "";
		int pageStart = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		if(pageStart>1) {
			page += "<a href='/searchQna.sool?reqPage=1&date="+date+"&type="+type+"&search"+search+"'><<</a>";
			page += "<a href='/searchQna.sool?reqPage="+(pageStart-1)+"&date="+date+"&type="+type+"&search"+search+"'><</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage != pageStart) {
				page += "<a href='/searchQna.sool?reqPage="+pageStart+"&date="+date+"&type="+type+"&search"+search+"' class='num'>"+pageStart+"</a>";
			}else {
				page += "<span class='sel'>"+pageStart+"</span>";
			}
			pageStart++;
			if(pageStart>totalPage) {
				break;
			}
		}
		if(pageStart<=totalPage) {
			page += "<a href='/searchQna.sool?reqPage="+pageStart+"&date="+date+"&type="+type+"&search"+search+"'>></a>";
			page += "<a href='/searchQna.sool?reqPage="+totalPage+"&date="+date+"&type="+type+"&search"+search+"'>>></a>";
		}
		qpd.setPageNavi(page);
		return qpd;
	}

	@Transactional
	public int insertQrv(Qrv qrv) {
		return dao.insertQrv(qrv);
	}

	@Transactional
	public int updateQrv(Qrv qrv) {
		return dao.updateQrv(qrv);
	}

	@Transactional
	public int deleteQrv(int qnaNo, int qrvNo) {
		int result = dao.deleteQna(qnaNo);
		result += dao.deleteQrv(qrvNo);
		return result;
	}

}
