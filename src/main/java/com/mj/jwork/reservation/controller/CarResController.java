package com.mj.jwork.reservation.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
import com.mj.jwork.reservation.model.service.CarResService;
import com.mj.jwork.reservation.model.vo.CarReservation;

@Controller
public class CarResController {

	@Autowired
	private CarResService cService;

	@RequestMapping("reserv.car")
	public String insertReservation(CarReservation cRes, HttpSession session) {

		int result = cService.insertReservation(cRes);

		if (result > 0) {
			session.setAttribute("alertMsg", "차량 예약 신청 성공");
			return "redirect: list.carMe";

		} else {
			session.setAttribute("alertMsg", "차량 예약 등록 실패");
			return "redirect: list.carMe";
		}
	}

	@RequestMapping("list.carMe")
	public ModelAndView selectMyRes(HttpSession session,
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		int reservation = ((Employee) session.getAttribute("loginUser")).getEmpNo();
		int listCount = cService.selectMyResCount(reservation);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<CarReservation> list = cService.selectMyRes(pi, reservation);

		mv.addObject("list", list).addObject("pi", pi).setViewName("reservation/myCarReservation");
		return mv;

	}

	  @RequestMapping("confirmList.car") 
	  public ModelAndView selectResList(HttpSession
	  session,@RequestParam(value="cpage",defaultValue="1")int currentPage,ModelAndView mv,String option) { int listCount=
	  cService.ajaxselectResCount(option); 
	  PageInfo pi= Pagination.getPageInfo(listCount, currentPage, 5, 10);
	  ArrayList<CarReservation>list = cService.ajaxselectResList(pi,option);
	  
	  mv.addObject("list",list).addObject("pi",pi).setViewName(
	  "reservation/carReservationConfirm"); return mv;
	  
	  }

	@ResponseBody
	@RequestMapping(value = "detail.carRes", produces = "application/json; charset=utf-8")
	public String selectCarRes(int resNo) {
		CarReservation c = cService.selectCarRes(resNo);

		return new Gson().toJson(c);

	}
	
	@ResponseBody
	@RequestMapping(value = "ajaxdetail.carRes", produces = "application/json; charset=utf-8")
	public String ajaxselectCarRes(int resNo) {
		CarReservation c = cService.ajaxselectCarRes(resNo);

		return new Gson().toJson(c);

	}

	@ResponseBody
	@RequestMapping(value = "approve.res", produces = "application/json; charset=utf-8")
	public String updateApStatus(CarReservation c, HttpSession session) {
		int approver = ((Employee) session.getAttribute("loginUser")).getEmpNo();
		c.setApprover(approver);

		int result = cService.updateApStatus(c);
		return new Gson().toJson(c.getApStatus());
	}

	/*
	  @ResponseBody
	  
	  @RequestMapping(value="ajaxConfirmList.car",
	  produces="application/json; charset=utf-8") public String
	  ajaxSelectConfirmList(HttpSession
	  session,@RequestParam(value="cpage",defaultValue="1")int
	  currentPage,ModelAndView mv,String option) {
	  
	  int listCount= cService.ajaxselectResCount(option); PageInfo pi=
	  Pagination.getPageInfo(listCount, currentPage, 5, 10);
	  ArrayList<CarReservation>list = cService.ajaxselectResList(pi,option);
	  
	  JSONObject jObj = new JSONObject(); jObj.put("pi",pi); jObj.put("list",list);
	  
	  return jObj.toJSONString(); }
	 */

	@RequestMapping("status.car")
	public ModelAndView selectResList(ModelAndView mv) {

		ArrayList<CarReservation> list = cService.selectResList();

		mv.addObject("list", list).setViewName("reservation/carReservationStatus");

		return mv;

	}
	
	 @ResponseBody
	@RequestMapping(value="carRes.select", produces = "application/json; charset=utf-8")
	public String selectList(CarReservation c) {

		ArrayList<CarReservation> list = cService.selectResList(c);


		return new Gson().toJson(list);

	}

}
