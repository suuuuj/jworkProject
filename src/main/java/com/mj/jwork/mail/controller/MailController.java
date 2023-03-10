package com.mj.jwork.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.common.template.Pagination;
import com.mj.jwork.employee.model.vo.Employee;
import com.mj.jwork.mail.model.service.MailServiceImpl;
import com.mj.jwork.mail.model.vo.Mail;

@Controller
public class MailController {
	
	@Autowired
	private MailServiceImpl mService;
	
	// 메일 리스트 조회
	@RequestMapping(value="list.ma")
	public ModelAndView mailListForward(@RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="box", defaultValue="받은 메일함") String mailBox ,HttpSession session, ModelAndView mv) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int listCount = mService.selectReceiveListCount(empNo);
		int unReadCount = mService.selectUnReadReceiveCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Mail> mList = mService.selectReceiveMailList(empNo, pi);
		mv.addObject("mailBox", mailBox)
		  .addObject("listCount", listCount)
		  .addObject("unReadCount", unReadCount)
		  .addObject("pi", pi)
		  .addObject("mList", mList)
		  .setViewName("mail/mailListView");
		  
		return mv;
		
	}
	
	
	// 사용자 메일함 조회 서비스
	@ResponseBody
	@RequestMapping(value="mailBoxList.ma", produces="application/json; charset=UTF-8")
	public String ajaxSelectMailBox(int empNo) {
		
		ArrayList<Mail> mblist = mService.selectMailBoxList(empNo);
		
		return new Gson().toJson(mblist);
		
	}
	
	// 사용자 메일함 수정 서비스
	@ResponseBody
	@RequestMapping("updateMailBox.ma")
	public String ajaxUpdateMailBox(Mail m) {
		int result = mService.updateMailBox(m);
		
		return result > 0 ? "success" : "fail" ;
		
	}
	
	// 사용자 메일함 추가 서비스
	@ResponseBody
	@RequestMapping(value="insertMailBox.ma", produces="application/json; charset=UTF-8")
	public String ajaxInsertMailBox(Mail m) {
		
		int result = mService.insertMailBox(m);
		Mail mailbox = null;
		if(result > 0) {
			mailbox = mService.selectMailBox(m);
		}
		
		return new Gson().toJson(mailbox);
		
	}
	
	// 사용자 메일함 삭제 서비스
	@ResponseBody
	@RequestMapping("deleteMailBox.ma")
	public String ajaxDeleteMailBox(int mailBoxNo) {
		
		// 해당 메일함에 있는 메일들을 휴지통으로 이동
		int mailsResult = mService.updateMailsWithMailBox(mailBoxNo);
		int mailBoxResult = 0;
		if(mailsResult > 0) {
			mailBoxResult = mService.deleteMailBox(mailBoxNo);
		}
		
		return mailBoxResult > 0 ? "success" : "fail";
		
	}
	
	//메일작성페이지 포워딩
	@RequestMapping("mailEnrollForm.ma")
	public String mailEnrollForm() {
		
		return "mail/mailEnrollForm";
		
	}
	
	
}
