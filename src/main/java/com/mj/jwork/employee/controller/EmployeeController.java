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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.mj.jwork.common.template.FileUpload;
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
		
		Map<String, Object> data = new HashMap<>();
		data.put("empList",empList);
		data.put("deptList",deptList);
		data.put("teamList",teamList);
		
		return new Gson().toJson(data);
	}
	
}
