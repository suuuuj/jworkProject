package com.mj.jwork.employee.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.common.template.FileUpload;
import com.mj.jwork.common.template.Pagination;
import com.mj.jwork.employee.model.service.EmployeeService;
import com.mj.jwork.employee.model.vo.Department;
import com.mj.jwork.employee.model.vo.Employee;
import com.mj.jwork.employee.model.vo.Team;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService eService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	// 로그인
	@RequestMapping("login.emp")
	public String loginEmployee(Employee e, Model model, HttpSession session) {
		 
		Employee loginUser = eService.loginEmployee(e);
		if(loginUser == null) {
			model.addAttribute("errorMsg", "로그인 실패");
			return "common/errorPage";
		}else {
			session.setAttribute("loginUser", loginUser);
			return "common/menubar";
		}
	}
	
	// 마이페이지
	@RequestMapping("myPage.emp")
	public String myPage() {
		return "employee/myPage";
	}
	
	// 마이페이지 - 개인정보수정
	@RequestMapping("update.emp")
	public String updateEmployee(Employee e, HttpSession session, Model model) {
		int result = eService.updateEmployee(e);
		if(result>0) {
			Employee updateEmp = eService.loginEmployee(e);
			session.setAttribute("loginUser", updateEmp);
			session.setAttribute("alertMsg", "사원정보 변경 성공");
			return "redirect:myPage.emp";	
		}else {
			model.addAttribute("errorMsg", "사원정보 변경 실패");
			return "common/errorPage";
		}
	}
	
	// 마이페이지 - 프로필이미지수정
	@ResponseBody	
	@RequestMapping("uploadProfile.emp")
	public void uploadProfileImg(MultipartFile uploadFile, Employee e, 
								 String originalFile, HttpSession session) { 
		
		if(uploadFile != null) {
			String saveFilePath = FileUpload.saveFile(uploadFile, session, "resources/profile_images/");
			e.setProfileUrl(saveFilePath);
			
			int result = eService.updateProfileImg(e);
			
			if(result>0) {
				if(!originalFile.equals("")) {
					new File(session.getServletContext().getRealPath(originalFile)).delete();
				}
				
				session.setAttribute("loginUser", eService.loginEmployee(e));
			}
		}	
	}
	
	// 일정 페이지
	@RequestMapping("schedule.emp")
	public String schedule() {
		return "employee/schedule";
	}
	
	// 일정 등록 화면
	@RequestMapping("enrollSchedule.emp")
	public String enrollSchedule() {
		return "employee/enrollSchedule";
	}
	
	
	//결재선 선택시 사원조회리스트(ajax)
	@ResponseBody
	@RequestMapping(value="empList.app", produces="application/json; charset=utf-8")
	public String ajaxSelectEmpList() {
		
		ArrayList<Employee> empList = eService.ajaxSelectEmpList();
		
		ArrayList<Department> deptList = eService.ajaxSelectDeptList();
		
		ArrayList<Team> teamList = eService.ajaxSelectTeamList();
		
		Map<String, ArrayList> data = new HashMap<>();
		data.put("empList",empList);
		data.put("deptList",deptList);
		data.put("teamList",teamList);
		
		return new Gson().toJson(data);
	}
	
	
	// 사내 주소록 조회 페이지
	@RequestMapping("addressIn.emp")
	public String addressInList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int listCount = eService.selectAddressInListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		ArrayList<Employee> list = eService.selectAddressInList(empNo, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "employee/addressInList";
	}
	
	// 사내 주소록 상세 조회 페이지(ajax)
	@ResponseBody
	@RequestMapping(value="selectAdressEmploye.emp", produces="application/json; charset=utf-8")
	public String ajaxSelectAddressEmployee(Employee e, HttpSession session) {
		
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		e.setLoginNo(loginNo);
		
		Employee emp = eService.ajaxSelectAddressEmployee(e);
		//System.out.println(emp);
		return new Gson().toJson(emp);

	}
	
	// 사내 주소록 검색
	@RequestMapping("addressInSearch.emp")
	public String addressInSearch(@RequestParam(value="cpage", defaultValue="1") int currentPage, String condition, String keyword, Model model, HttpSession session) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int searchCount = eService.selectAddressInSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, 15);
		ArrayList<Employee> list = eService.selectAddressInSearchList(map, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "employee/addressInList";
	}
	
	// 사내 주소록 즐겨찾기(ajax)
	@ResponseBody
	@RequestMapping("insertAddressFav.emp")
	public String ajaxInsertAddressFav(Employee e, HttpSession session, Model model) {
		
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		e.setLoginNo(loginNo);
		
		int result = eService.ajaxInsertAddressFav(e);
		//System.out.println(result);
		return result > 0 ? "success" : "fail";
	}
	
	// 사내 주소록 즐겨찾기 해제(ajax)
	@ResponseBody
	@RequestMapping("deleteAddressFav.emp")
	public String ajaxDeleteAddressFav(Employee e, HttpSession session, Model model) {
		
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		e.setLoginNo(loginNo);
		
		int result = eService.ajaxDeleteAddressFav(e);
		return result > 0 ? "success" : "fail";

	}
   
	// 개인 주소록 조회 페이지
	@RequestMapping("addressOut.emp")
	public String addressOutList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int listCount = eService.selectAddressOutListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		ArrayList<Employee> list = eService.selectAddressOutList(empNo, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "employee/addressOutList";
	}
	
	// 개인 주소록 상세 조회(ajax)
	@ResponseBody
	@RequestMapping(value="selectAdressOut.emp", produces="application/json; charset=utf-8")
	public String ajaxSelectAddressOut(Employee e, HttpSession session) {
		
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		e.setLoginNo(loginNo);
		
		Employee out = eService.ajaxSelectAddressOut(e);
		//System.out.println(out);
		return new Gson().toJson(out);

	}
	
	// 개인 주소록 상세 수정 
	@RequestMapping("updateAddressOut.emp")
	public String updateAddressOut(Employee e, HttpSession session, Model model) {
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		e.setLoginNo(loginNo);
		
		int result = eService.updateAddressOut(e);
		System.out.println(result);
		if(result>0) {
			session.setAttribute("alertMsg", "정보 변경 성공");
			return "redirect:addressOut.emp";	
		}else {
			model.addAttribute("errorMsg", "사원정보 변경 실패");
			return "common/errorPage";
		}
	}
	
	
	

   
	// 즐겨찾기 주소록 페이지
	@RequestMapping("addressFav.emp")
	public String addressFav() {
		return "employee/addressFavList";
	}
	
	// 메일 사원번호 입력시 사원조회 서비스 (ajax)
	@ResponseBody
	@RequestMapping(value="findEmployee.ma", produces="application/json; charset=utf-8")
	public String ajaxSelectEmployee(int empNo) {
		Employee e = eService.selectEmployee(empNo);
		
		return new Gson().toJson(e);
		
	}
	
}
