package com.mj.jwork.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mj.jwork.employee.model.service.EmployeeService;
import com.mj.jwork.employee.model.vo.Employee;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService eService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	/** 로그인
	 * @param m
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("login.em")
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
	
}
