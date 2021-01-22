package com.soolzari.shop.seller.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soolzari.shop.admin.model.vo.Notice;
import com.soolzari.shop.admin.model.vo.NoticePage;
import com.soolzari.shop.seller.model.dao.SellerDao;
import com.soolzari.shop.seller.model.vo.Class;
import com.soolzari.shop.seller.model.vo.ClassPage;
import com.soolzari.shop.seller.model.vo.Goods;
import com.soolzari.shop.seller.model.vo.GoodsPage;
import com.soolzari.shop.seller.model.vo.Image;
import com.soolzari.shop.seller.model.vo.Score;
import com.soolzari.shop.seller.model.vo.Seller;

@Service
public class SellerService {
	
	@Autowired
	SellerDao dao;
	
	public int insertSeller(Seller s) {
		return dao.insertSeller(s);
	}
	
	public Seller selectOneSeller(Seller s) {
		return dao.selectOneSeller(s);
	}

	public ArrayList<Goods> selectAllGoods() {
		return dao.selectAllGoods();
	}

	public ClassPage selectAllClass(int reqPage) {
		int numPerPage = 10;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		HashMap<String, Integer> pageNo = new HashMap<String, Integer>();
		pageNo.put("start", start);
		pageNo.put("end", end);
		ArrayList<Class> list = dao.selectAllClass(pageNo);
		ClassPage cp = new ClassPage();
		cp.setList(list);
		int totalCount = dao.classTotalCount();//총 게시물 수
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
			page += "<a href='/seller/ClassList.sool?reqPage=1'></a>";
			page += "<a href='/seller/ClassList.sool?reqPage="+(pageStart-1)+"'></a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage != pageStart) {
				page += "<a href='/seller/ClassList.sool?reqPage="+pageStart+"' class='num'>"+pageStart+"</a>";
			}else {
				page += "<span class='sel'>"+pageStart+"</span>";
			}
			pageStart++;
			if(pageStart>totalPage) {
				break;
			}
		}
		if(pageStart<=totalPage) {
			page += "<a href='/seller/ClassList.sool?reqPage="+pageStart+"'></a>";
			page += "<a href='/seller/ClassList.sool?reqPage="+totalPage+"'></a>";
		}
		cp.setPage(page);
		return cp;
	}

public GoodsPage selectAllGoods(int reqPage) {
	int numPerPage = 10;
	int start = (reqPage-1)*numPerPage+1;
	int end = reqPage*numPerPage;
	HashMap<String, Integer> pageNo = new HashMap<String, Integer>();
	pageNo.put("start", start);
	pageNo.put("end", end);
	ArrayList<Goods> list = dao.selectAllGoods(pageNo);
	GoodsPage gp = new GoodsPage();
	gp.setList(list);
	int totalCount = dao.goodsTotalCount();//총 게시물 수
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
		page += "<a href='/seller/goodsList.sool?reqPage=1'></a>";
		page += "<a href='/seller/goodsList.sool?reqPage="+(pageStart-1)+"'></a>";
	}
	for(int i=0;i<pageNaviSize;i++) {
		if(reqPage != pageStart) {
			page += "<a href='/seller/goodsList.sool?reqPage="+pageStart+"' class='num'>"+pageStart+"</a>";
		}else {
			page += "<span class='sel'>"+pageStart+"</span>";
		}
		pageStart++;
		if(pageStart>totalPage) {
			break;
		}
	}
	if(pageStart<=totalPage) {
		page += "<a href='/seller/goodsList.sool?reqPage="+pageStart+"'></a>";
		page += "<a href='/seller/goodsList.sool?reqPage="+totalPage+"'></a>";
	}
	gp.setPage(page);
	return gp;
}

public int insertGoods(Goods g) {
	return dao.insertGoods(g);
}	

public int searchLastGoods() {
	return dao.searchLastGoods();
}

public int insertImage(Image i) {
	return dao.insertImage(i);
}

public Goods selectOneGoods(int gdsNo) {
	return dao.selectOneGoods(gdsNo);
}

public Image selectOneImage(int gdsNo) {
	return dao.selectOneImage(gdsNo);
}

public Score selectOneScore(int gdsNo) {
	return dao.selectOneScore(gdsNo);
}

public int addClass(Class cls) {
	return dao.addClass(cls);
}

public int modifyGoods(Goods g) {
	return dao.modifyGoods(g);
}

public int deleteGoods(int temp) {
	return dao.deleteGoods(temp);
}

public Class getClassInfo(int classNo) {
	return dao.getClassInfo(classNo);
}

public int deleteClass(int value) {
	
	return dao.deleteClass(value);
}

public int modifyClass(Class c) {
	return dao.modifyClass(c);
}


}
