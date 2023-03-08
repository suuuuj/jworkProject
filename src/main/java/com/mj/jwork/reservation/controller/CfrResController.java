package com.mj.jwork.reservation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mj.jwork.reservation.model.service.CfrResService;
import com.mj.jwork.reservation.model.vo.CfrReservation;

@Controller
public class CfrResController {
	
	@Autowired
	private CfrResService cRService;
	
	@RequestMapping("reserv.cfr")
	public String reserveCfr(CfrReservation cfrRes,HttpSession session) {
		
		int result= cRService.reserveCfr(cfrRes);
		if(result>0) {
			session.setAttribute("alertMsg", "회의실 예약에 성공하였습니다.");
			return "redirect:list.rcfr";
		}else {
			session.setAttribute("errorMsg", "회의실 예약에 실패하였습니다.");
			return "redirect:list.rcfr";
		}
	}

}
