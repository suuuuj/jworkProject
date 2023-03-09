package com.mj.jwork.reservation.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.common.template.Pagination;
import com.mj.jwork.reservation.model.service.CfrResService;
import com.mj.jwork.reservation.model.vo.CfRoom;
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
	
	//예약화면 조회용
	@RequestMapping("list.cfrRes")
	public String listcfrRes() {
		return "reservation/cfrReservationStatus";
	}
	
	
	
	//회의실 이름 조회
	@RequestMapping("list.cfrn")
	public String selectCfrNList(Model model) {
		ArrayList<CfRoom>list = cRService.selectNList();
		
		model.addAttribute("list",list);
		return "reservation/cfrReservationStatus";
		
		}
	

	
	//내 회의실 예약 목록 조회
	@RequestMapping("list.cfrMe")
	public ModelAndView selectMyCfrList(@RequestParam(value="cpage",defaultValue="1")int currentPage,ModelAndView mv,CfrReservation cfrRes) {
		int listCount = cRService.selectMyCfrListCount(cfrRes);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<CfrReservation>list = cRService.selectMyCfrList(pi,cfrRes);
		
		mv.addObject("list",list)
		.addObject("pi",pi)
		.setViewName("reservation/myCfrReservation");
		
		return mv;
	}
	

}
