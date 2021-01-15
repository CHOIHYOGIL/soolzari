package com.soolzari.shop.client.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soolzari.shop.client.model.dao.ClientDao2;
import com.soolzari.shop.client.model.vo.Basket;
import com.soolzari.shop.client.model.vo.BasketList;
import com.soolzari.shop.client.model.vo.Client2;
import com.soolzari.shop.client.model.vo.ExperienceListData;
import com.soolzari.shop.client.model.vo.ExperiencePageData;
import com.soolzari.shop.client.model.vo.Goods2;
import com.soolzari.shop.client.model.vo.GoodsList;
import com.soolzari.shop.client.model.vo.OrderListData;
import com.soolzari.shop.client.model.vo.OrderPageData;
import com.soolzari.shop.client.model.vo.Purchase;
import com.soolzari.shop.client.model.vo.Qna;
import com.soolzari.shop.client.model.vo.QnaPageData;

@Service
public class ClientService2 {
	@Autowired
	private ClientDao2 dao;

	@Transactional
	public int basketInsert(int cliNo, int gdsNo, int basCnt) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cliNo", cliNo);
		map.put("gdsNo",gdsNo);
		map.put("basCnt", basCnt);
		
		int result = 0;
		if(dao.basketSelect(map)>0) {	//장바구니에 같은 상품이 있으면 개수만 update
			result = dao.basketUpdate(map);
		}else {							//장바구니에 같은상품이 없으면 insert
			result = dao.basketInsert(map);
		}
		return result;
	}
	
	//장바구니에 출력할 값(basket,goods gds_no을 기준으로 묶어서 가져옴)
	public ArrayList<BasketList> basketAllSelect(int cliNo) {
		ArrayList<Basket> basketList = dao.basketAllSelect(cliNo);
		Goods2 goods = null;
		//HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		
		ArrayList<BasketList> list = new ArrayList<BasketList>();
		
		for(Basket b : basketList) {
			goods = dao.goodsBasketSelect(b.getGdsNo());
			BasketList bl = new BasketList();
			bl.setGoods(goods);
			bl.setBasket(b);
			list.add(bl);
		}
		return list;
	}

	/*
	 * @Transactional public int basketMinusUpdate(int basNo) { return
	 * dao.basketMinusUpdate(basNo); }
	 */
	@Transactional
	public int basketPlusMinusUpdate(int basNo, int chk) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("chk", chk);	//0이면 마이너스 1이면 플러스
		map.put("basNo", basNo);
		return dao.basketPlusMinusUpdate(map);
	}
	
	@Transactional
	public int basketDelete(ArrayList<Integer> basNoList) {
		return dao.basketDelete(basNoList);
	}
	
	//주문/결제 페이지출력
	public Client2 paymentShow(int cliNo) {
		return dao.memberInfoSelect(cliNo);//사용자정보가져오기
	}
	
	
	//주문/결제 페이지 주소 수정(update)
	@Transactional
	public int clientAddrUpdate(Client2 client) {
		return dao.clientAddrUpdate(client);
	}
	
	
	//주문/결제에 출력할 상품(basket,goods gds_no을 기준으로 묶어서 가져옴)
	public ArrayList<BasketList> paymentAllSelect(ArrayList<Integer> basNoList) {
		Goods2 goods = new Goods2();
		Basket basket = new Basket();
		ArrayList<BasketList> list = new ArrayList<BasketList>();
			
		for(int basNo : basNoList) {
			basket = dao.paymentBasketSelect(basNo);
			goods = dao.goodsBasketSelect(basket.getGdsNo());
			BasketList bl = new BasketList();
			bl.setGoods(goods);
			bl.setBasket(basket);
			list.add(bl);
		}
		return list;
	}
	
	//구매하기버튼으로 주문/결제로 바로 감
	public ArrayList<BasketList> paymentAllSelect(GoodsList goodsList) {
		Goods2 goods = new Goods2();
		Basket basket = new Basket();
		
		ArrayList<BasketList> list = new ArrayList<BasketList>();
		
		goods = dao.goodsBasketSelect(goodsList.getGdsNo());
		basket.setBasCnt(goodsList.getGdsLCnt());
		
		BasketList bl = new BasketList();
		bl.setGoods(goods);
		bl.setBasket(basket);
		list.add(bl);
		
		return list;
	}
	
	@Transactional
	public int updateMInfo(Client2 client) {
		return dao.mInfoUpdate(client);
	}
	
	//마이페이지 내정보수정-비밀번호 확인하기
	public Client2 checkPwMInfo(Client2 client) {
		return dao.mInfoCheckPw(client);
	}
	
	//결제insert
	@Transactional
	public int paymentInsert(Client2 client, String gdsNoStr, String gdsLCntStr, Purchase pur) {
		System.out.println("service");
		//purchase테이블에 insert
		int result = dao.purchaseInsert(pur);
		if(result>0) {
			
			//위에서 insert한 purchase테이블에서 해당사용자의 가장최근 purNo을 조회
			int purNo = dao.purchaseNoSelect(pur.getCliNo());
			System.out.println("purNo : "+purNo);
			StringTokenizer st = new StringTokenizer(gdsNoStr,","); 
			StringTokenizer st2 = new StringTokenizer(gdsLCntStr,","); 
			ArrayList<Integer> gdsNoList = new ArrayList<Integer>(); 
			ArrayList<Integer> gdsLCntList = new ArrayList<Integer>();
			
			while(st.hasMoreTokens()) {//gdsNo을 다시 int타입으로 ArrayList에 저장 
				gdsNoList.add(Integer.parseInt(st.nextToken()));
			}
			while(st2.hasMoreTokens()) {//gdsLCnt을 다시 int타입으로 ArrayList에 저장 
				gdsLCntList.add(Integer.parseInt(st2.nextToken()));
			}
			//결제한 상품의 basket정보(개수)와 goods정보를 가져옴
			//ArrayList<BasketList> basketList = paymentAllSelect(basNoList);//위에서 사용한 메소드 재활용
			Goods2 goods = new Goods2();
			Basket basket = new Basket();
			ArrayList<BasketList> basketList = new ArrayList<BasketList>();
			int i = 0;
			for(int gdsNo : gdsNoList) {
				basket.setBasCnt(gdsLCntList.get(i));
				goods = dao.goodsBasketSelect(gdsNo);
				BasketList bl = new BasketList();
				bl.setGoods(goods);
				bl.setBasket(basket);
				basketList.add(bl);
				i++;
			}
			
			//ArrayList<GoodsList> goodsList = new ArrayList<GoodsList>();
			for(BasketList bl : basketList) {//주문번호 하나당 상품여러개가능하니까(purchase한레코드당 여러개의 goodsList레코드 존재)
				GoodsList gl = new GoodsList();
				gl.setGdsLCnt(bl.getBasket().getBasCnt());	//상품개수
				gl.setGdsNo(bl.getGoods().getGdsNo());		//상품번호
				gl.setGdsLPrice(bl.getGoods().getGdsPri());	//상품가격
				gl.setPurNo(purNo);							//주문번호
				//goodsList.add(gl);
				result = dao.goodsListInsert(gl);
			}
			if(result>0) {
				//point감소
				result = dao.pointUpdate(client);
				if(result>0) {
					//장바구니에서 구매한 상품 삭제
					result = dao.basketGoodsDelete(client,gdsNoList);
				}else {
					result = 0;
				}
			}else {
				result = 0;
			}
			
		}
		return result;
	}

	//주문내역 페이징
	public OrderPageData mOrderListPaging(int reqPage, int period, int cliNo) {//period(조회기간/1,3,6,12개월)
		int totalPage = dao.totalCountPage(cliNo, period); //총개수(purchase에서 저장된)
		int per = 5;	//한페이지에 보여줄 주문개수
		if(totalPage/per==0) {//총페이지수
			totalPage = totalPage/per;
		}else {
			totalPage = totalPage/per+1;
		}
		int end = reqPage*per;
		int start = end-per+1;
		
		//ArrayList<OrderListData> list = dao.orderListSelect(start,end,cliNo);
		ArrayList<Purchase> pList = dao.purchasePageSelect(start,end,cliNo,period);	//purchase디비정보
		if(pList.isEmpty()) {
			return new OrderPageData();
		}
		ArrayList<OrderListData> olDataList = dao.orderListDataSelect(pList); 	//purchase의 purNo과 같은 애들중에 goods,goodslistdb 정보들
		
		int pageAllIdx = 5;
		int pageIdx = (reqPage-1)/pageAllIdx*pageAllIdx+1;
		System.out.println(reqPage);
		String pageNavi = "";
		if(reqPage>1) {//이전버튼
			pageNavi += "<a id='prev1' href='/client/mOrderList.sool?reqPage="+(pageIdx-1)+"&period="+period+"'><</a>";
		}
		
		for(int i = 0;i<pageAllIdx;i++) {
			if(pageIdx!=reqPage) {//a태그잇게
				pageNavi += "<a class='pageA' href='/client/mOrderList.sool?reqPage="+pageIdx+"&period="+period+"'>"+pageIdx+"</a>";
			}else {//a태그없게
				pageNavi += "<span class='selectedPage'>"+pageIdx+"</span>";
			}
			pageIdx++;
			if(pageIdx>totalPage) {
				break;
			}
		}
		if(pageIdx<=totalPage) {//다음버튼
			pageNavi += "<a id='next1' href='/client/mOrderList.sool?reqPage="+pageIdx+"&period="+period+"'>></a>";
		}
		OrderPageData opd = new OrderPageData(pList, olDataList, pageNavi);
		return opd;
	}
	
	//주문내역 배송관리(취소신청/수취확인)
	@Transactional
	public int orderDeliveryStatus(int gdsLNo,int deliveryStatus) {
		return dao.orderDeliveryStatus(gdsLNo,deliveryStatus);
	}
	
	//클래스 예약 내역 페이징
	public ExperiencePageData mExperiencePaging(int reqPage, int period, int cliNo) {
		int totalPage = dao.totalCountExperience(cliNo, period); //총개수(예약된 클래스(class_list_db)에서 저장된)
		int per = 10;	//한페이지에 보여줄 주문개수
		if(totalPage/per==0) {//총페이지수
			totalPage = totalPage/per;
		}else {
			totalPage = totalPage/per+1;
		}
		int end = reqPage*per;
		int start = end-per+1;
		
		ArrayList<ExperienceListData> eList = dao.experienceListDataPageSelect(start,end,cliNo,period);	//experienceListData디비정보(서브쿼리로조합해서)
		
		int pageAllIdx = 5;
		int pageIdx = (reqPage-1)/pageAllIdx*pageAllIdx+1;
		System.out.println(reqPage);
		String pageNavi = "";
		if(reqPage>1) {//이전버튼
			pageNavi += "<a id='prev1' href='/client/mExperience.sool?reqPage="+(pageIdx-1)+"&period="+period+"'><</a>";
		}
		
		for(int i = 0;i<pageAllIdx;i++) {
			if(pageIdx!=reqPage) {//a태그잇게
				pageNavi += "<a class='pageA' href='/client/mExperience.sool?reqPage="+pageIdx+"&period="+period+"'>"+pageIdx+"</a>";
			}else {//a태그없게
				pageNavi += "<span class='selectedPage'>"+pageIdx+"</span>";
			}
			pageIdx++;
			if(pageIdx>totalPage) {
				break;
			}
		}
		if(pageIdx<=totalPage) {//다음버튼
			pageNavi += "<a id='next1' href='/client/mExperience.sool?reqPage="+pageIdx+"&period="+period+"'>></a>";
		}
		ExperiencePageData epd = new ExperiencePageData(eList, pageNavi);
		return epd;
	}
	
	//클래스 취소신청하기
	@Transactional
	public int classCancel(int clsLNo) {
		return dao.classCancel(clsLNo);
	}
	
	//문의하기 페이징
	public QnaPageData mQuestionPaging(int reqPage, int period, int cliNo) {
		int totalPage = dao.totalCountQuestion(cliNo, period); //총개수(예약된 클래스(class_list_db)에서 저장된)
		int per = 10;	//한페이지에 보여줄 주문개수
		if(totalPage/per==0) {//총페이지수
			totalPage = totalPage/per;
		}else {
			totalPage = totalPage/per+1;
		}
		int end = reqPage*per;
		int start = end-per+1;
		System.out.println("totalPage"+totalPage);
		System.out.println("start"+start);
		System.out.println("end"+end);
		
		ArrayList<Qna> list = dao.qnaDataPageSelect(start,end,cliNo,period);	//experienceListData디비정보(서브쿼리로조합해서)
		
		int pageAllIdx = 5;
		int pageIdx = (reqPage-1)/pageAllIdx*pageAllIdx+1;
		System.out.println(reqPage);
		String pageNavi = "";
		if(reqPage>1) {//이전버튼
			pageNavi += "<a id='prev1' href='/client/mQuestion.sool?reqPage="+(pageIdx-1)+"&period="+period+"'><</a>";
		}
		
		for(int i = 0;i<pageAllIdx;i++) {
			if(pageIdx!=reqPage) {//a태그잇게
				pageNavi += "<a class='pageA' href='/client/mQuestion.sool?reqPage="+pageIdx+"&period="+period+"'>"+pageIdx+"</a>";
			}else {//a태그없게
				pageNavi += "<span class='selectedPage'>"+pageIdx+"</span>";
			}
			pageIdx++;
			if(pageIdx>totalPage) {
				break;
			}
		}
		if(pageIdx<=totalPage) {//다음버튼
			pageNavi += "<a id='next1' href='/client/mQuestion.sool?reqPage="+pageIdx+"&period="+period+"'>></a>";
		}
		QnaPageData qpd = new QnaPageData(list, pageNavi);
		return qpd;
	}
	
	@Transactional
	public int questionInsert(Qna question) {
		return dao.questionInsert(question);
	}
	
	//클래스체험다음날0시가 되면 체험완료로 변경(스케줄러/scheduler)
	@Transactional
	public void classCheckUpdate() {
		System.out.println("스케줄러!!!");
		dao.classCheckUpdate();
	}

	

	

	

	
}
