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
import com.mj.jwork.reservation.model.service.CarService;
import com.mj.jwork.reservation.model.vo.Car;

@Controller
public class CarController {
	
	@Autowired
	private CarService cService;
	
	
	//리스트
	@RequestMapping("list.car")
	public ModelAndView selectCarList(@RequestParam(value="cpage",defaultValue="1")int currentPage,ModelAndView mv)  {
		
		int listCount = cService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 9);
		ArrayList<Car>list = cService.selectList(pi);
		
		mv.addObject("list",list)
		.addObject("pi",pi)
		.setViewName("reservation/managerCarMain");
		
		return mv;
				
	}
	
	@RequestMapping("insert.car")
	public String insertCar(Car c,HttpSession session) {
		
		int result= cService.insertCar(c);
		if(result>0) {
			session.setAttribute("alertMsg", "치량 등록 성공");
			return "redirect:list.car";
			
		}else {
			session.setAttribute("alertMsg", "치량 등록 실패");
			return "redirect:list.car";
		}
		
	}
	
	@RequestMapping("enrollForm.car")
	public String carEnrollForm() {
		
		return "enrollForm.car";
	}
}
