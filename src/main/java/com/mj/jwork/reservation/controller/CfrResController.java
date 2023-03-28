package com.mj.jwork.reservation.controller;

import java.io.Console;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.common.template.Pagination;
import com.mj.jwork.employee.model.vo.Employee;
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
			return "redirect:list.cfrMe";
		}else {
			session.setAttribute("errorMsg", "회의실 예약에 실패하였습니다.");
			return "redirect:list.cfrMe";
		}
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
	public ModelAndView selectMyCfrList(@RequestParam(value="cpage",defaultValue="1")int currentPage,ModelAndView mv,HttpSession session) {
		int reservation=((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int listCount = cRService.selectMyCfrListCount(reservation);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<CfrReservation>list = cRService.selectMyCfrList(pi,reservation);
		
		mv.addObject("list",list)
		.addObject("pi",pi)
		.setViewName("reservation/myCfrReservation");
		
		return mv;
	}
	
	//ajax용 회의실예약목록 조회
	@ResponseBody
	@RequestMapping(value="list.aCfrMe",produces="application/json; charset=utf-8")
	public String selectMyCfrList(@RequestParam(value="cpage",defaultValue="1")int currentPage,HttpSession session) {
		int reservation=((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = cRService.selectMyCfrListCount(reservation);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<CfrReservation>list = cRService.selectMyCfrList(pi,reservation);
		
		return new Gson().toJson(list);
	}
	
	
	//예약 개별 내역 조회
	@ResponseBody
	@RequestMapping(value="detail.cfrRes",produces="application/json; charset=utf-8")
	public String selectMyCfr(int resNo) {
		
		CfrReservation c = cRService.selectMyCfr(resNo);
		return new Gson().toJson(c);
	

	}
	@RequestMapping("status.cfr")
	public ModelAndView getCalendarList(ModelAndView mv, HttpServletRequest request) {
		ArrayList<CfrReservation>list = cRService.selectResList();
		
		mv.addObject("list",list)
		.setViewName("reservation/managerCfrStatus");
		return mv;
	}
	@RequestMapping("list.cfrRes")
	public ModelAndView getDetailCalendarList(ModelAndView mv, HttpServletRequest request) {
		ArrayList<CfrReservation>list = cRService.selectResList();
		
		mv.addObject("list",list)
		.setViewName("reservation/cfrReservationStatus");
		return mv;
	}
	
	
	//회의실 이름 조회
	@ResponseBody
	@RequestMapping(value="list.acfrn",produces="application/json; charset=utf-8")
	public String ajaxselectCfrNList() {
		ArrayList<CfRoom>list = cRService.selectNList();
		return new Gson().toJson(list);
		
		}
	//회의실 예약 내역 조회
	@ResponseBody
	@RequestMapping(value="call.events",produces="application/json; charset=utf-8")
	public String ajaxselectCfrList(@RequestParam(value="cpage", defaultValue="1") int currentPage,Model model, HttpServletRequest request) {
		
		int listCount = cRService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<CfrReservation>list = cRService.selectPagingResList(pi);
		
		HashMap<String, Object> map = new HashMap();
		map.put("listCount", listCount);
		map.put("pi", pi);
		map.put("list", list);
		
		return new Gson().toJson(map);
		
	}
	

	//회의실 예약 취소
	@ResponseBody
	@RequestMapping(value="delete.cfrRes",produces="application/json; charset=utf-8")
	public String ajaxDeleteCfrRes(int resNo) {
		
		int result= cRService.deleteCfrRes(resNo);
		return new Gson().toJson(result);
		
	}
	
	@RequestMapping("update.cfrRes")
	public String updateCfrRes(CfrReservation c,HttpSession session,Model model) {
		int result= cRService.updateCfrRes(c);
		
		if(result>0) {
			session.setAttribute("alertMsg", "회의실 예약 일정 변경 성공");
			return "redirect: list.cfrMe";
			
		}else {
			model.addAttribute("errorMsg", "회의실 예약 일정 변경 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="update.status",produces="application/json; charset=utf-8")
	public String updateStatus(String resNoArr) {

		int result=cRService.updateStatus(resNoArr);
		return new Gson().toJson(result);
	}
	
	@ResponseBody
	@RequestMapping(value="time.cfr",produces="application/json; charset=utf-8")
	public String ajaxSelectTime(CfrReservation c) {
		ArrayList<CfrReservation>list = cRService.ajaxSelectTime(c);
		return new Gson().toJson(list);
	}
	
		
	@ResponseBody
	@RequestMapping(value="select.cfrRes",produces="application/json; charset=utf-8")
	public String selectDetailRes(@RequestParam(value="cpage", defaultValue="1") int currentPage,String cfrName,Model model, HttpServletRequest request) {

		int listCount = cRService.cfrResListCount(cfrName);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<CfrReservation>list = cRService.selectDetailRes(pi,cfrName);
		
		HashMap<String, Object> map = new HashMap();
		map.put("listCount", listCount);
		map.put("pi", pi);
		map.put("list", list);
		
		return new Gson().toJson(map);
	}
	
}