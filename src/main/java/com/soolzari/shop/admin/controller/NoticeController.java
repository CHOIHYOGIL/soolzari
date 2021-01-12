package com.soolzari.shop.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.soolzari.shop.admin.model.service.NoticeService;
import com.soolzari.shop.admin.model.vo.Notice;
import com.soolzari.shop.admin.model.vo.NoticePage;

@RequestMapping("/notice")
@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/list.sool")
	public String noticeList(int reqPage, Model model) {
		NoticePage np = service.selectAllNotice(reqPage);
		Date date = new Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String today = sdf.format(date);
		model.addAttribute("list", np.getList());
		model.addAttribute("page", np.getPage());
		model.addAttribute("today", today);
		return "admin/noticeList";
	}
	
	@RequestMapping("/form.sool")
	public String noticeFrm() {
		return "admin/noticeFrm";
	}
	
	@RequestMapping("/find.sool")//나중에 페이징 처리
	public String findNotice(String date, String type, String search, Model model) {
		ArrayList<Notice> list = service.findNotice(date, type, search);
		model.addAttribute("list", list);
		return "admin/noticeList";
	}
	
	@RequestMapping("/delete.sool")
	public String deleteNotice(String noticeNo, Model model) {
		int result = service.deleteNotice(noticeNo);
		if(result>0) {
			model.addAttribute("msg", "공지사항 삭제 성공");
		}else {
			model.addAttribute("msg", "공지사항 삭제 실패");
		}
		model.addAttribute("loc", "/notice/list.sool?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/delete.sool")
	public String deleteNotice(int noticeNo, Model model) {
		int result = service.deleteNotice(noticeNo);
		if(result>0) {
			model.addAttribute("msg", "공지사항 삭제 성공");
		}else {
			model.addAttribute("msg", "공지사항 삭제 실패");
		}
		model.addAttribute("loc", "/notice/list.sool?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/insert.sool")//이미지 넣어야함
	public String insertNotice(Notice n, Model model) {
		int result = service.insertNotice(n);
		if(result>0) {
			model.addAttribute("msg", "공지사항 등록 성공");
		}else {
			model.addAttribute("msg", "공지사항 등록 실패");
		}
		model.addAttribute("loc", "/notice/list.sool?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/insertImage.sool")
	public String insertImage(MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
		
	}
	
	@RequestMapping("/view.sool")
	public String noticeView(int noticeNo, Model model) {
		Notice n = service.selectOneNotice(noticeNo);
		model.addAttribute("n", n);
		return "admin/noticeView";
	}
}
