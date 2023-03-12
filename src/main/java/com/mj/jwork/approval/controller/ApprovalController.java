package com.mj.jwork.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mj.jwork.approval.model.service.ApprovalService;
import com.mj.jwork.approval.model.vo.Approval;
import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.common.template.Pagination;
import com.mj.jwork.employee.model.vo.Employee;



@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	// 내 결제 리스트 조회 페이징
	@RequestMapping("mylist.app")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage,Model model, HttpServletRequest request) {
		
		Employee e = (Employee)request.getSession().getAttribute("loginUser");
		
		int listCount = aService.selectListCount(e.getEmpNo()); //페이징 매길 전체 게시글 수
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> list = aService.selectMyApprovalList(pi,e.getEmpNo()); // 게시글 목록 조회
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		model.addAttribute("listCount",listCount);
		
		return "approval/myApprovalList";
		
	}
	
	// 결재문서 작성 form 페이지
	@RequestMapping("enrollForm.app")
	public String ApprovalEnrollForm() {
		return "approval/approvalEnrollForm";
	}
	
	// 내 결재 리스트 전체 클릭시
	@ResponseBody
	@RequestMapping(value="allList.app", produces="application/json; charset=utf-8")
	public String ajaxSelectAllBtn(@RequestParam(value="cpage", defaultValue="1") int currentPage,Model model, HttpServletRequest request) {
		
		Employee e = (Employee)request.getSession().getAttribute("loginUser");
		
		int listCount = aService.selectListCount(e.getEmpNo()); //페이징 매길 전체 게시글 수
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> all = aService.selectMyApprovalList(pi,e.getEmpNo());
		
		return new Gson().toJson(all);
		
	}
	
	// 내 결재 리스트 진행 클릭시
	@ResponseBody
	@RequestMapping(value="ingList.app", produces="application/json; charset=utf-8")
	public String ajaxSelectIngBtn(@RequestParam(value="cpage", defaultValue="1") int currentPage,Model model,HttpServletRequest request) {
		
		Employee e = (Employee)request.getSession().getAttribute("loginUser");
		
		int listCount = aService.selectListCount(e.getEmpNo());
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> ing = aService.ajaxSelectIngBtn(pi,e.getEmpNo());
		
		return new Gson().toJson(ing);
	
	}
	
//	// 내결재문서 상세 조회 페이지
//	@RequestMapping("myDetail.app")
//	public String approvalDetail() {
//		return "approval/approvalDetail.jsp"
//	}
	
	
}
