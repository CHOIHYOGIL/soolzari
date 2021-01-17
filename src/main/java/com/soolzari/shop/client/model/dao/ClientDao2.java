package com.soolzari.shop.client.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soolzari.shop.client.model.vo.Basket;
import com.soolzari.shop.client.model.vo.BasketDel;
import com.soolzari.shop.client.model.vo.Client2;
import com.soolzari.shop.client.model.vo.ExperienceListData;
import com.soolzari.shop.client.model.vo.Goods2;
import com.soolzari.shop.client.model.vo.GoodsList;
import com.soolzari.shop.client.model.vo.GoodsSellerDetail;
import com.soolzari.shop.client.model.vo.OrderListData;
import com.soolzari.shop.client.model.vo.Purchase;
import com.soolzari.shop.client.model.vo.Qna;

@Repository
public class ClientDao2 {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public int basketSelect(HashMap<String, Integer> map) {
		return sqlSession.selectOne("order.basketSelect", map);
	}
	
	public int basketUpdate(HashMap<String, Integer> map) {
		return sqlSession.update("order.basketUpdate", map);
	}
	
	public int basketInsert(HashMap<String, Integer> map) {
		return sqlSession.insert("order.basketInsert", map);
	}

	public ArrayList<Basket> basketAllSelect(int cliNo) {
		List<Basket> list = sqlSession.selectList("order.basketAllSelect", cliNo);
		return (ArrayList<Basket>) list;
	}

	public Goods2 goodsBasketSelect(int gdsNo) {
		return sqlSession.selectOne("order.goodsBasketSelect",gdsNo);
	}

	/*
	 * public int basketMinusUpdate(int basNo) { return
	 * sqlSession.update("order.basketMinusUpdate",basNo); }
	 */

	public int basketPlusMinusUpdate(HashMap<String, Integer> map) {
		return sqlSession.update("order.basketPlusMinusUpdate",map);
	}

	public int basketDelete(ArrayList<Integer> basNoList) {
		return sqlSession.delete("order.basketDelete",basNoList);
	}

	public Client2 memberInfoSelect(int cliNo) {
		return sqlSession.selectOne("order.memberInfoSelect",cliNo);
	}

	public int clientAddrUpdate(Client2 client) {
		return sqlSession.update("order.clientAddrUpdate",client);
	}

	public Basket paymentBasketSelect(int basNo) {
		return sqlSession.selectOne("order.paymentBasketSelect",basNo);
	}

	public int mInfoUpdate(Client2 client) {
		return sqlSession.update("mypage.mInfoUpdate",client);
	}

	public Client2 mInfoCheckPw(Client2 client) {
		return sqlSession.selectOne("mypage.mInfoCheckPw",client);
	}

	public int purchaseInsert(Purchase pur) {
		return sqlSession.insert("order.purchaseInsert",pur);
	}

	public int purchaseNoSelect(int cliNo) {
		return sqlSession.selectOne("order.purchaseNoSelect",cliNo);
	}

	public int goodsListInsert(GoodsList gl) {
		return sqlSession.insert("order.goodsListInsert",gl);
	}

	public int pointUpdate(Client2 client) {
		return sqlSession.update("order.pointUpdate",client);
	}

	public int totalCountPage(int cliNo, int period) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cliNo", cliNo);
		map.put("period", period);
		return sqlSession.selectOne("mypage.totalCountPage",map);
	}

	public ArrayList<OrderListData> orderListSelect(int start, int end, int cliNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("cliNo", cliNo);
		List<OrderListData> list =  sqlSession.selectList("mypage.orderListSelect",map);
		return (ArrayList<OrderListData>)list;
	}
	public ArrayList<Purchase> purchasePageSelect(int start, int end, int cliNo, int period) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("cliNo", cliNo);
		map.put("period", period);
		List<Purchase> list =  sqlSession.selectList("mypage.purchasePageSelect",map);
		return (ArrayList<Purchase>)list;
	}

	public ArrayList<OrderListData> orderListDataSelect(ArrayList<Purchase> pList) {
		List<OrderListData> list =  sqlSession.selectList("mypage.orderListDataSelect",pList);
		return (ArrayList<OrderListData>)list;
	}
	
	//주문내역 배송관리(취소신청/수취확인)
	public int orderDeliveryStatus(int gdsLNo, int deliveryStatus) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("gdsLNo", gdsLNo);
		map.put("deliveryStatus", deliveryStatus);
		return sqlSession.update("mypage.orderDeliveryStatus",map);
	}
	
	//마이페이지 - 클래스 예약현황-------------------------------

	public int totalCountExperience(int cliNo, int period) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cliNo", cliNo);
		map.put("period", period);
		return sqlSession.selectOne("mypage.totalCountExperience",map);
	}

	public ArrayList<ExperienceListData> experienceListDataPageSelect(int start, int end, int cliNo, int period) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("cliNo", cliNo);
		map.put("period", period);
		List<ExperienceListData> list =  sqlSession.selectList("mypage.experienceListDataPageSelect",map);
		return (ArrayList<ExperienceListData>)list;
	}

	//클래스 취소신청하기
	public int classCancel(int clsLNo) {
		return sqlSession.update("mypage.classCancel",clsLNo);
	}
	
	//마이페이지 - 문의하기-------------------------------
	public int questionInsert(Qna question) {
		return sqlSession.insert("mypage.questionInsert",question);
	}

	public int totalCountQuestion(int cliNo, int period) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cliNo", cliNo);
		map.put("period", period);
		return sqlSession.selectOne("mypage.totalCountQuestion",map);
	}

	public ArrayList<Qna> qnaDataPageSelect(int start, int end, int cliNo, int period) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("cliNo", cliNo);
		map.put("period", period);
		List<Qna> list =  sqlSession.selectList("mypage.qnaDataPageSelect",map);
		return (ArrayList<Qna>)list;
	}

	//구매완료 시 장바구니에서 상품삭제
	public int basketGoodsDelete(Client2 client, ArrayList<Integer> gdsNoList) {
		BasketDel bd = new BasketDel(gdsNoList,client.getCliNo());
		return sqlSession.delete("order.basketGoodsDelete",bd);
	}

	//클래스체험다음날0시가 되면 체험완료로 변경(스케줄러/scheduler)
	public void classCheckUpdate() {
		sqlSession.update("mypage.classCheckUpdate");
	}

	
	//상품상세페이지
	public GoodsSellerDetail oGoodsDetail(int gdsNo) {
		return sqlSession.selectOne("order.oGoodsDetail",gdsNo);
	}

	

	
}
