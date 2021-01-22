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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
import com.soolzari.shop.seller.model.vo.Funding;
import com.soolzari.shop.seller.model.vo.FundingDetail;
import com.soolzari.shop.seller.model.vo.FundingGoods;
import com.soolzari.shop.seller.model.vo.FundingPage;

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
	
	@RequestMapping("/fundingAdd.sool")
	public String fundingAdd() {
		return "seller/sellerFundingAdd";
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
		
		System.out.println(cp.getList());
		model.addAttribute("list",cp.getList());
		model.addAttribute("page",cp.getPage());
		return "seller/sellerClassList";
	}
	
	@RequestMapping("/fundingList.sool")
	public String fundingList(int reqPage, int selNo, Model model) {
		FundingPage fp = service.selectAllFunding(reqPage, selNo);
		/* 이부분 수정해야함. selNo로 한번 필터링 필요 */
		System.out.println(fp.getList());
		model.addAttribute("list",fp.getList());
		model.addAttribute("page",fp.getPage());
		return "seller/sellerFundingList";
		
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

	public String insertGoods(Goods g, @RequestParam("files")MultipartFile[] files, Model model, HttpServletRequest request) {
		//상품등록
		System.out.println(files);

		g.setGdsBcnt(0);
		int result = service.insertGoods(g);
		//System.out.println(result);
		int gdsNo = service.searchLastGoods();
		//이미지 업로드
		String root = request.getSession().getServletContext().getRealPath("/");

		String path = root+"resources/upload";
		Image i = new Image();
		int count=0;
		int result2=0;
		for(MultipartFile file:files) {
			if(!file.isEmpty()) {
				System.out.println("hi");
				System.out.println(file);
		
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
					if(count==0) {
						i.setImgType("g");
					}else {
						i.setImgType("gd");
					}
					
					i.setTypeNo(gdsNo);
				 result2 = service.insertImage(i);
					count++;

				} catch (IOException e) {
					e.printStackTrace();
				}
		}

		if(result>0 && result2>0 ) {
			model.addAttribute("msg","상품 등록이 완료되었습니다.");
		}else if(result>0 && !(result2>0) ) {
			model.addAttribute("msg","이미지등록 실패");
		}else if(!(result>0) && result2>0){
			model.addAttribute("msg","글작성 실패 이미지등록 성공");
		}else {
			model.addAttribute("msg","상품 등록이 실패했습니다.");
		}
		model.addAttribute("loc","/seller/goodsList.sool?reqPage=1");

	}
		
		return "common/msg";
	}
	
	@RequestMapping("/goodsDetail.sool")
	public String goodsDetail(int gdsNo, Model model) {
		System.out.println("gdsNo : "+gdsNo);
		String type = "g";
		Goods g = service.selectOneGoods(gdsNo);
		System.out.println("g : "+g);
		Image i1 = service.selectOneImage(gdsNo, 1);
		Image i2 = service.selectOneImage(gdsNo, 2);
		System.out.println("i1 : "+i1);
		System.out.println("i2 : "+i2);
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
		gd.setFilepath1(i1.getFilepath());
		gd.setFilename1(i1.getFilename());
		gd.setImgType1(i1.getImgType());
		gd.setTypeNo1(i1.getTypeNo());
		gd.setFilepath2(i2.getFilepath());
		gd.setFilename2(i2.getFilename());
		gd.setImgType2(i2.getImgType());
		gd.setTypeNo2(i2.getTypeNo());
		gd.setAvgRevScore(s.getAvgRevScore());
		gd.setCountRevScore(s.getCountRevScore());
		
		model.addAttribute("gd",gd);
		return "seller/sellerGoodsDetail";
		
	}
	
	@RequestMapping("/fundingDetail.sool")
	public String fundingDetail(int fundNo, Model model) {
		Funding f = service.selectOneFunding(fundNo);
		Image i1 = service.selectOneImage(fundNo, 3);
		Image i2 = service.selectOneImage(fundNo, 4);
		FundingDetail fd = new FundingDetail();
		ArrayList<FundingGoods> fgs = service.selectAllFundingGoods(fundNo);
		fd.setFundNo(f.getFundNo());
		fd.setFundName(f.getFundName());
		fd.setFundMoney(f.getFundMoney());//fundMoney;
		fd.setFundChk(f.getFundChk());//fundChk;
		fd.setFundDet(f.getFundDet());//fundDet;
		fd.setStatus(f.getStatus());//status;
		fd.setFundEnrollDate(f.getFundEnrollDate());//fundEnrollDate;
		fd.setFundEndDate(f.getFundEndDate());//fundEndDate;
		fd.setFilepath1(i1.getFilepath());//filepath1;
		fd.setFilename1(i1.getFilename());//filename1;
		fd.setImgType1(i1.getImgType());//imgType1;
		fd.setTypeNo1(i1.getTypeNo());//typeNo1;
		fd.setFilepath2(i2.getFilepath());//filepath1;
		fd.setFilename2(i2.getFilename());//filename1;
		fd.setImgType2(i2.getImgType());//imgType1;
		fd.setTypeNo2(i2.getTypeNo());//typeNo1;
		fd.setSelNo(f.getSelNo());
		double tt = 0;
		double percent = 0;
		for(FundingGoods fg : fgs) {
			tt += fg.getFndGPri();
		}
		percent = Math.round((100000*(tt / f.getFundMoney()))/1000.0);
		fd.setFundPercent(percent);
		fd.setFundTotal((int)tt);
		
		System.out.println(percent);
		System.out.println(tt);
		
		model.addAttribute("fd",fd);
		model.addAttribute("list", fgs);
		return "seller/sellerFundingDetail";
	}
	
	@RequestMapping("/classAddChk.sool")
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
	

	@RequestMapping("/fixGds.sool")
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
	

	@RequestMapping("fixClass.sool")
	public String fixClass(Class c, Model model) {
		
		System.out.println("fix :"+c);
		int result = service.modifyClass(c);
		System.out.println(result);
		if(result>0) {
			model.addAttribute("msg","클래스 수정이 완료되었습니다.");
		}else {
			model.addAttribute("msg","클래스 수정이 실패했습니다.");
		}
		model.addAttribute("loc","/seller/classList.sool?reqPage=1");
		return "common/msg";
		
	}
	
	@RequestMapping("logout.sool")
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("loc","/seller/login.sool");
		model.addAttribute("msg","로그아웃됨");
		return "common/msg";
	}
	
	@RequestMapping("/deleteGoods.sool")
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
	
	@RequestMapping("/fundingAddChk.sool")
	public String insertFunding(Funding f, MultipartFile file1, MultipartFile file2, Model model, HttpServletRequest request) {
		//상품등록
				f.setFundChk(0);
				int result = service.insertFunding(f);
				System.out.println(result);
				int fundNo = service.searchLastFunding();
				//이미지 업로드
				String root = request.getSession().getServletContext().getRealPath("/");
				String path = root+"resources/image";
				Image i1 = new Image();
				Image i2 = new Image();
					if( !(file1.isEmpty()) && !(file2.isEmpty()) ) {
						String filename1 = file1.getOriginalFilename();
						String filename2 = file2.getOriginalFilename();
						String filepath1 = new FileNameOverlap().rename(path, filename1);
						String filepath2 = new FileNameOverlap().rename(path, filename2);
						try {
							byte[] bytes1 = file1.getBytes();
							byte[] bytes2 = file2.getBytes();
							File upFile1 = new File(path+filepath1);
							File upFile2 = new File(path+filepath2);
							FileOutputStream fos1 = new FileOutputStream(upFile1);
							FileOutputStream fos2 = new FileOutputStream(upFile2);
							BufferedOutputStream bos1 = new BufferedOutputStream(fos1);
							BufferedOutputStream bos2 = new BufferedOutputStream(fos2);
							bos1.write(bytes1);
							bos2.write(bytes2);
							bos1.close();
							bos2.close();
							i1.setFilename(filename1);
							i1.setFilepath(filepath1);
							i1.setImgType("f");
							i1.setTypeNo(fundNo);
							i2.setFilename(filename2);
							i2.setFilepath(filepath2);
							i2.setImgType("fd");
							i2.setTypeNo(fundNo);
						} catch (IOException e) {
							e.printStackTrace();
						}
				}
				int result2 = service.insertImage(i1);
				int result3 = service.insertImage(i2);
				
				if(result>0 && result2>0 && result3>0) {
					model.addAttribute("msg","펀딩 등록이 완료되었습니다.");
				}else if(result>0 && !(result2>0) && !(result3>0)) {
					model.addAttribute("msg","이미지등록 실패");
				}else if(!(result>0) && result2>0 && result3>0){
					model.addAttribute("msg","글작성 실패 이미지등록 성공");
				}else {
					model.addAttribute("msg","펀딩 등록이 실패했습니다.");
				}
				model.addAttribute("loc","/seller/fundingList.sool?reqPage=1&selNo="+f.getSelNo());
				return "common/msg";
	}
	

	@RequestMapping("deleteClass.sool")
	public String deleteClass(@RequestParam("checkbox") List<Integer> values, Model model) {
		System.out.println("delete");
		int cnt = values.size();
		System.out.println(cnt);
		int result = 0;
		int delResult = 0;
		for(Integer value : values) {
			System.out.println("value : "+value);
			delResult = service.deleteClass(value);
			System.out.println("delResult:"+delResult);
			result += delResult;
		}
		System.out.println("result : "+result);
		if(result < cnt) {
			model.addAttribute("msg","삭제 실패");
		}else {
			model.addAttribute("msg","삭제 성공");
		}
		model.addAttribute("loc","/seller/classList.sool?reqPage=1");
		return "common/msg";
	} 
	
	
}
