package com.mj.jwork.ess.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mj.jwork.ess.model.service.EssServiceImpl;
import com.mj.jwork.ess.model.vo.LeaveCategory;

@Controller
public class EssController {
	
	@Autowired
	private EssServiceImpl eService;
	
	@RequestMapping("menu.le")
	public String leaveMainPage() {
		return "ess/leaveMenu";
	}
	
	@RequestMapping("enrollForm.le")
	public ModelAndView selectLeaveCategory(int no, HttpSession session, ModelAndView mv) {
		
		LeaveCategory lcName = eService.selectLeaveCategory(no);
		System.out.println(lcName);
		
		if(lcName != null) {
			
			mv.addObject("lcName", lcName);
			//session.setAttribute("loginUser", loginUser);
			mv.setViewName("ess/leaveEnrollForm");  
			
		}else {
			session.setAttribute("errorMsg", "휴가를 신청할 수 없습니다.");
		}
		
		return mv;
	}

}
