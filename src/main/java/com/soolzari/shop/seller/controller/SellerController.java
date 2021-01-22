package com.soolzari.shop.seller.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.soolzari.shop.client.model.vo.Client;
import com.soolzari.shop.common.FileNameOverlap;
import com.soolzari.shop.seller.model.service.SellerService;
import com.soolzari.shop.seller.model.vo.Goods;
import com.soolzari.shop.seller.model.vo.GoodsDetail;
import com.soolzari.shop.seller.model.vo.GoodsPage;
import com.soolzari.shop.seller.model.vo.Image;
import com.soolzari.shop.seller.model.vo.Score;
import com.soolzari.shop.seller.model.vo.Seller;
import com.soolzari.shop.seller.model.vo.Class;
import com.soolzari.shop.seller.model.vo.ClassPage;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
	@Autowired
	private SellerService service;
	
	@RequestMapping("/regist.sool")
	public String regist() {
		return "seller/sellerRegist";
	}
	
	@RequestMapping("/login.sool")
	public String login() {
		return "seller/sellerLogin";
	}
	
	@RequestMapping("/sellerMain.sool")
	public String main() {
		return "seller/sellerMain";
	}
	
	@RequestMapping("/goodsAdd.sool")
	public String goodsAdd() {
		return "seller/sellerGoodsAdd";
	}
	
	@RequestMapping("/goodsList.sool")
	public String goodsList(int reqPage, Model model) {
		GoodsPage gp = service.selectAllGoods(reqPage);
		model.addAttribute("list", gp.getList());
		model.addAttribute("page",gp.getPage());
		return "seller/sellerGoodsList";
	}
	
	@RequestMapping("/classAdd.sool")
	public String classAdd() {
		return "seller/sellerClassAdd";
	}
	
	@RequestMapping("/classList.sool")
	public String classList(int reqPage, Model model) {
		ClassPage cp = service.selectAllClass(reqPage);
		
		System.out.println("cp");
		System.out.println(cp.getList());
		model.addAttribute("list",cp.getList());
		model.addAttribute("page",cp.getPage());
		return "seller/sellerClassList";
	}
	
	@RequestMapping("/classDetail.sool")
	public String classDetail(int classNo, Model model) {
		
		System.out.println("classNo : "+classNo);
		Class cl=service.getClassInfo(classNo);
		
		System.out.println("cl : "+cl);
		
		model.addAttribute("cl",cl);
	
		return "seller/sellerClassDetail";
	}
	
	//로그인
	@RequestMapping("/loginCheck.sool")
	public String login(Seller s, HttpSession session, Model model) {
		Seller seller = service.selectOneSeller(s);
		if(seller!=null) {
			session.setAttribute("sessionSeller", seller);
			model.addAttribute("loc","/seller/sellerMain.sool");
			model.addAttribute("msg","로그인 성공");
		}else {
			model.addAttribute("loc","/seller/login.sool");
			model.addAttribute("msg","아이디 혹은 비밀번호가 다르거나 존재하지 않는 회원입니다");
		}
		return "common/msg";
	}
	
	//회원가입
	@RequestMapping("/registChk.sool")
	public String registChk(Seller s, Model model) {
		
		int result = service.insertSeller(s);
		System.out.println(s.getSelPw());
		System.out.println(s.getSelName());
		
		if(result>0) {
			model.addAttribute("msg","회원가입이 완료되었습니다");
		}else {
			model.addAttribute("msg","회원가입이 실패했습니다.");
		}
		model.addAttribute("loc","/seller/login.sool");
		return "common/msg";
	}
	
	//상품등록
	@RequestMapping("/insertGoods.sool")
	public String insertGoods(Goods g, MultipartFile file, Model model, HttpServletRequest request) {
		//상품등록

		g.setGdsBcnt(0);
		int result = service.insertGoods(g);
		System.out.println(result);
		int gdsNo = service.searchLastGoods();
		//이미지 업로드
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root+"resources/image";
		Image i = new Image();
			if(!file.isEmpty()) {
				String filename = file.getOriginalFilename();
				String filepath = new FileNameOverlap().rename(path, filename);
				try {
					byte[] bytes = file.getBytes();
					File upFile = new File(path+filepath);
					FileOutputStream fos = new FileOutputStream(upFile);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(bytes);
					bos.close();
					i.setFilename(filename);
					i.setFilepath(filepath);
					i.setImgType("g");
					i.setTypeNo(gdsNo);
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		int result2 = service.insertImage(i);
		
		if(result>0 && result2>0) {
			model.addAttribute("msg","상품 등록이 완료되었습니다.");
		}else if(result>0 && !(result2>0)) {
			model.addAttribute("msg","이미지등록 실패");
		}else if(!(result>0) && result2>0){
			model.addAttribute("msg","글작성 실패 이미지등록 성공");
		}else {
			model.addAttribute("msg","상품 등록이 실패했습니다.");
		}
		model.addAttribute("loc","/seller/goodsList.sool?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("goodsDetail.sool")
	public String goodsDetail(int gdsNo, Model model) {
		System.out.println("gdsNo : "+gdsNo);
		String type = "g";
		Goods g = service.selectOneGoods(gdsNo);
		System.out.println("g : "+g);
		Image i = service.selectOneImage(gdsNo);
		System.out.println("i : "+i);
		Score s = service.selectOneScore(gdsNo);
		System.out.println("s : "+s);
		GoodsDetail gd = new GoodsDetail();
		gd.setGdsNo(g.getGdsNo());
		gd.setGdsName(g.getGdsName());
		gd.setGdsPri(g.getGdsPri());
		gd.setGdsBcnt(g.getGdsBcnt());
		gd.setSelNo(g.getSelNo());
		gd.setStatus(g.getStatus());
		gd.setGoodsDate(g.getGoodsDate());
		gd.setGoodsType(g.getGoodsType());
		gd.setFilepath(i.getFilepath());
		gd.setFilename(i.getFilename());
		gd.setImgType(i.getImgType());
		gd.setTypeNo(i.getTypeNo());
		gd.setAvgRevScore(s.getAvgRevScore());
		gd.setCountRevScore(s.getCountRevScore());
		
		model.addAttribute("gd",gd);
		return "seller/sellerGoodsDetail";
		
	}
	
	@RequestMapping("classAddChk.sool")
	public String classAddChk(Class cls, Model model){
		System.out.println(cls);

		System.out.println(cls.getClassEnroll());
		int result = service.addClass(cls);
		if(result>0) {
			model.addAttribute("msg","클래스 등록이 완료되었습니다.");
		}else {
			model.addAttribute("msg","클래스 등록이 실패했습니다.");
		}
		model.addAttribute("loc","/seller/classList.sool?reqPage=1");
		return "common/msg";
	}
	

	@RequestMapping("fixGds.sool")
	public String fixGds(Goods g, Model model) {
		System.out.println("fix:"+g);
		int result = service.modifyGoods(g);
		System.out.println(result);
		if(result>0) {
			model.addAttribute("msg","상품 수정이 완료되었습니다.");
		}else {
			model.addAttribute("msg","상품 수정이 실패했습니다.");
		}
		model.addAttribute("loc","/seller/goodsList.sool?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("logout.sool")
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("loc","/seller/login.sool");
		model.addAttribute("msg","로그아웃됨");
		return "common/msg";
	}
	
	@RequestMapping("deleteGoods.sool")
	public String deleteGoods(@RequestParam("checkbox") List<Integer> values, Model model) {
		System.out.println("delete");
		int cnt = values.size();
		System.out.println(cnt);
		int result = 0;
		int delResult = 0;
		for(Integer value : values) {
			System.out.println("value : "+value);
			delResult = service.deleteGoods(value);
			System.out.println("delResult:"+delResult);
			result += delResult;
		}
		System.out.println("result : "+result);
		if(result < cnt) {
			model.addAttribute("msg","삭제 실패");
		}else {
			model.addAttribute("msg","삭제 성공");
		}
		model.addAttribute("loc","/seller/goodsList.sool?reqPage=1");
		return "common/msg";
	}

	//마이페이지 이동
	@RequestMapping("mypage.sool")
	public String mypage() {
		return "seller/sellerMypage";
	}
	
	//마이페이지 - 판매자 정보 수정
	@RequestMapping("/mypageSellerUpdate.sool")
	public String mypageSellerUpdate (Seller seller,Model model, @SessionAttribute(required=false) Seller sessionSeller) {
		int selNo = sessionSeller.getSelNo();
		seller.setSelNo(selNo);
		int result = service.mypageUpdateSeller(seller);
		if(result>0) {
			model.addAttribute("msg","수정 성공");
		}else {
			model.addAttribute("msg","수정 실패");
		}
		model.addAttribute("loc","/seller/sellerMain.sool");
		return "common/msg";
	}
	
}
