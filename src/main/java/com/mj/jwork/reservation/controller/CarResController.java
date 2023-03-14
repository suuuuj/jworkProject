package com.mj.jwork.reservation.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	public String insertReservation(CarReservation cRes,HttpSession session) {
			
		int result= cService.insertReservation(cRes);
		
		if(result>0) {
			session.setAttribute("alertMsg", "차량 예약 등록 성공");
			return "redirect: status.car";
			
		}else {
			session.setAttribute("alertMsg", "차량 예약 등록 실패");
			return "redirect: status.car";
		}
	}
	
	@RequestMapping("list.carMe")
	public ModelAndView selectMyRes(HttpSession session,@RequestParam(value="cpage",defaultValue="1")int currentPage,ModelAndView mv) {
		int reservation= ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount= cService.selectMyResCount(reservation);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		System.out.println(((Employee)session.getAttribute("loginUser")).getEmpNo());
		 System.out.println("maxPage:"+pi.getMaxPage());
		 System.out.println("getBoardLimit:"+pi.getBoardLimit());
		 System.out.println("getListCount:"+pi.getListCount());
		 System.out.println("getPageLimit:"+pi.getPageLimit());
		 System.out.println("getEndPage:"+pi.getEndPage());
		ArrayList<CarReservation>list = cService.selectMyRes(pi,reservation);
		
		mv.addObject("list",list).addObject("pi",pi).setViewName("reservation/myCarReservation");
		return mv;
		
	}
	
	
}
