package com.mj.jwork.reservation.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.common.template.FileUpload;
import com.mj.jwork.common.template.Pagination;
import com.mj.jwork.reservation.model.service.CarService;
import com.mj.jwork.reservation.model.vo.Car;
import com.mj.jwork.reservation.model.vo.CfRoom;

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
	public String insertCar(Car c,HttpSession session,MultipartFile upfile) {
		String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/");
		c.setCarImg(saveFilePath);
		
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
		
		return "reservation/carEnrollForm";
	}
	
	@ResponseBody
	@RequestMapping(value="delete.car",produces="application/json; charset=utf-8")
	public String deleteCar(String carName,HttpSession session) {
		
		int result= cService.deleteCar(carName);
		return new Gson().toJson(result);
	}
	
	@ResponseBody
	@RequestMapping(value="detail.car",produces="application/json; charset=utf-8")
	public String ajaxSelectCar(String carName) {
		
		Car car= cService.selectCar(carName);
		
		return new Gson().toJson(car);
		
	}
	
	@RequestMapping("reservForm.car")
	public ModelAndView reservForm(String carName,ModelAndView mv) {
		
		Car car = cService.selectCar(carName);
		
		 mv.addObject("c",car).setViewName("reservation/carReservationForm");
		 return mv;
	}
	
	/*
	 * @RequestMapping("status.car") public ModelAndView
	 * catStatus(@RequestParam(value="cpage",defaultValue="1")int
	 * currentPage,ModelAndView mv) {
	 * 
	 * int listCount = cService.selectListCount(); PageInfo pi =
	 * Pagination.getPageInfo(listCount, currentPage, 5, 2); ArrayList<Car>list =
	 * cService.selectList(pi);
	 * 
	 * mv.addObject("list",list) .addObject("pi",pi)
	 * .setViewName("reservation/carReservationStatus");
	 * 
	 * return mv;
	 * 
	 * 
	 * }
	 */
	
	/*
	  @RequestMapping("status.car") public ModelAndView
	  carStatus(@RequestParam(value="cpage",defaultValue="1")int
	  currentPage,ModelAndView mv) {
	  
	  int listCount = cService.selectListCount(); PageInfo pi =
	  Pagination.getPageInfo(listCount, currentPage, 5, 2); ArrayList<Car>list =
	  cService.selectList(pi);
	  
	  mv.addObject("list",list) .addObject("pi",pi)
	  .setViewName("reservation/carReservationStatus");
	  
	  return mv;
	  
	  
	  }
	*/
	

	
	@ResponseBody
	@RequestMapping(value="list.acar",produces="application/json; charset=utf-8")
	public String ajaxselectCfrNList() {
		ArrayList<Car>list = cService.selectNList();
		
		return new Gson().toJson(list);
		
		}
	
	@RequestMapping("update.car")
	public String updateCar(Car c,HttpSession session,MultipartFile reupfile) {

		if(!reupfile.getOriginalFilename().equals("")) {
		
			if(c.getCarImg() != null) {
				new File(session.getServletContext().getRealPath(c.getCarImg())).delete();
			
			}
				String saveFilePath= FileUpload.saveFile(reupfile, session, "resources/uploadFiles/");
				c.setCarImg(saveFilePath);

			}

				int result= cService.updateCar(c);
				if(result>0) {
					session.setAttribute("alertMsg", "차량 정보 수정 성공");
					return "redirect: list.car";
					
				}else {
					session.setAttribute("alertMsg", "차량 정보 수정 실패");
					return "redirect: list.car";
				}
			}
				
				
		}

