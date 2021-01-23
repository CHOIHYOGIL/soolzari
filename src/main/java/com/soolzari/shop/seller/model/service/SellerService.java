package com.soolzari.shop.seller.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soolzari.shop.admin.model.vo.Notice;
import com.soolzari.shop.admin.model.vo.NoticePage;
import com.soolzari.shop.seller.model.dao.SellerDao;
import com.soolzari.shop.seller.model.vo.Class;
import com.soolzari.shop.seller.model.vo.ClassPage;
import com.soolzari.shop.seller.model.vo.Funding;
import com.soolzari.shop.seller.model.vo.FundingGoods;
import com.soolzari.shop.seller.model.vo.FundingList;
import com.soolzari.shop.seller.model.vo.FundingListPage;
import com.soolzari.shop.seller.model.vo.FundingPage;
import com.soolzari.shop.seller.model.vo.Goods;
import com.soolzari.shop.seller.model.vo.GoodsList;
import com.soolzari.shop.seller.model.vo.GoodsListPage;
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

	public ClassPage selectAllClass(int reqPage, int selNo) {
		int numPerPage = 10;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		HashMap<String, Integer> pageNo = new HashMap<String, Integer>();
		pageNo.put("start", start);
		pageNo.put("end", end);
		pageNo.put("selNo", selNo);
		ArrayList<Class> list = dao.selectAllClass(pageNo);
		ClassPage cp = new ClassPage();
		cp.setList(list);
		int totalCount = dao.classTotalCount(selNo);//총 게시물 수
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

public GoodsPage selectAllGoods(int reqPage, int selNo) {
	int numPerPage = 10;
	int start = (reqPage-1)*numPerPage+1;
	int end = reqPage*numPerPage;
	HashMap<String, Integer> pageNo = new HashMap<String, Integer>();
	pageNo.put("start", start);
	pageNo.put("end", end);
	pageNo.put("selNo", selNo);
	ArrayList<Goods> list = dao.selectAllGoods(pageNo);
	GoodsPage gp = new GoodsPage();
	gp.setList(list);
	int totalCount = dao.goodsTotalCount(selNo);//총 게시물 수
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

public Funding selectOneFunding(int fundNo) {
	return dao.selectOneFunding(fundNo);
}

public Image selectOneImage(int No,int num) {
	return dao.selectOneImage(No, num);
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

//마이페이지 - 판매자 정보 수정
public int mypageUpdateSeller(Seller seller) {
	return dao.mypageUpdateSeller(seller);
}


public int deleteClass(int value) {
	
	return dao.deleteClass(value);
}

public int modifyClass(Class c) {
	return dao.modifyClass(c);
}


public FundingPage selectAllFunding(int reqPage, int selNo) {
	int numPerPage = 10;
	int start = (reqPage-1)*numPerPage+1;
	int end = reqPage*numPerPage;
	HashMap<String, Integer> pageNo = new HashMap<String, Integer>();
	pageNo.put("start", start);
	pageNo.put("end", end);
	pageNo.put("selNo", selNo);
	System.out.println(start);
	System.out.println(end);
	ArrayList<Funding> list = dao.selectAllFunding(pageNo);
	FundingPage fp = new FundingPage();
	fp.setList(list);
	int totalCount = dao.FundingTotalCount(selNo);//총 게시물 수
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
		page += "<a href='/seller/fundingList.sool?reqPage=1'></a>";
		page += "<a href='/seller/fundingList.sool?reqPage="+(pageStart-1)+"'></a>";
	}
	for(int i=0;i<pageNaviSize;i++) {
		if(reqPage != pageStart) {
			page += "<a href='/seller/fundingList.sool?reqPage="+pageStart+"' class='num'>"+pageStart+"</a>";
		}else {
			page += "<span class='sel'>"+pageStart+"</span>";
		}
		pageStart++;
		if(pageStart>totalPage) {
			break;
		}
	}
	if(pageStart<=totalPage) {
		page += "<a href='/seller/fundingList.sool?reqPage="+pageStart+"'></a>";
		page += "<a href='/seller/fundingList.sool?reqPage="+totalPage+"'></a>";
	}
	fp.setPage(page);
	return fp;
}

public ArrayList<FundingGoods> selectAllFundingGoods(int fundNo) {
	return dao.selectAllFundingGoods(fundNo);
}

public int insertFunding(Funding f) {
	return dao.insertFunding(f);
}

public int searchLastFunding() {
	return dao.searchLastFunding();
}

public int deleteFunding(String[] tokens) {
	int result = 1;
	for(int i=0;i<tokens.length;i++) {
		int rt = dao.deleteFunding(Integer.parseInt(tokens[i]));
		if(rt>0) {
			result = 1;
		}else {
			result = 0;
		}
	}
	return result;
}

public int insertFundingGoods(FundingGoods fg) {
	return dao.insertFundingGoods(fg);
}

public int updateGdsDStatus(int gdsLNo, int gdsDStatus) {
	HashMap<String, Integer> gdsInfo = new HashMap<String, Integer>();
	gdsInfo.put("gdsLNo", gdsLNo);
	gdsInfo.put("gdsDStatus", gdsDStatus);
	int result1 = dao.updateGdsDStatus(gdsInfo);
	int purNo = 0;
	int result2 = 1;
	if(gdsDStatus==2) {
		purNo = dao.selectPurNo(gdsLNo);
		result2 = dao.updatePurchaseStatus(purNo);
	}
	return result1+result2;
}

public GoodsListPage selectAllGoodsList(int reqPage, int selNo) {
	GoodsListPage glp = new GoodsListPage();
	int numPerPage = 10;
	int start = (reqPage-1)*numPerPage+1;
	int end = reqPage*numPerPage;
	HashMap<String, Integer> pageNo = new HashMap<String, Integer>();
	pageNo.put("start", start);
	pageNo.put("end", end);
	pageNo.put("selNo",selNo);
	ArrayList<GoodsList> gdsList = dao.selectAllGoodsList(pageNo);
	glp.setGdsList(gdsList);
	int totalCount = dao.goodsListTotalCount();//총 게시물 수
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
		page += "<a href='/seller/mypage2.sool?reqPage=1&selNo="+selNo+"'></a>";
		page += "<a href='/seller/mypage2.sool?reqPage="+(pageStart-1)+"&selNo"+selNo+"'></a>";
	}
	for(int i=0;i<pageNaviSize;i++) {
		if(reqPage != pageStart) {
			page += "<a href='/seller/mypage2.sool?reqPage="+pageStart+"&selNo="+selNo+"' class='num'>"+pageStart+"</a>";
		}else {
			page += "<span class='sel'>"+pageStart+"</span>";
		}
		pageStart++;
		if(pageStart>totalPage) {
			break;
		}
	}
	if(pageStart<=totalPage) {
		page += "<a href='/seller/mypage2.sool?reqPage="+pageStart+"&selNo="+selNo+"'></a>";
		page += "<a href='/seller/mypage2.sool?reqPage="+totalPage+"&selNo="+selNo+"'></a>";
	}
	glp.setGdsPage(page);
	return glp;
}

public FundingListPage selectAllFundingList(int reqPage) {
	FundingListPage flp = new FundingListPage();
	int numPerPage = 10;
	int start = (reqPage-1)*numPerPage+1;
	int end = reqPage*numPerPage;
	HashMap<String, Integer> pageNo = new HashMap<String, Integer>();
	pageNo.put("start", start);
	pageNo.put("end", end);
	ArrayList<FundingList> fndList = dao.selectAllFundingList(pageNo);
	System.out.println(fndList);
	flp.setFndList(fndList);
	int totalCount = dao.fundingListTotalCount();//총 게시물 수
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
		page += "<a href='/seller/mypage3.sool?reqPage=1'></a>";
		page += "<a href='/seller/mypage3.sool?reqPage="+(pageStart-1)+"'></a>";
	}
	for(int i=0;i<pageNaviSize;i++) {
		if(reqPage != pageStart) {
			page += "<a href='/seller/mypage3.sool?reqPage="+pageStart+"' class='num'>"+pageStart+"</a>";
		}else {
			page += "<span class='sel'>"+pageStart+"</span>";
		}
		pageStart++;
		if(pageStart>totalPage) {
			break;
		}
	}
	if(pageStart<=totalPage) {
		page += "<a href='/seller/mypage3.sool?reqPage="+pageStart+"'></a>";
		page += "<a href='/seller/mypage3.sool?reqPage="+totalPage+"'></a>";
	}
	flp.setFndPage(page);
	return flp;
}

public int updateFndDStatus(int fndDNo, int fndDStatus) {
	HashMap<String, Integer> fndInfo = new HashMap<String, Integer>();
	fndInfo.put("fndDNo", fndDNo);
	fndInfo.put("fndDStatus", fndDStatus);
	int result = dao.updateFndDStatus(fndInfo);
	return result;
}








}
