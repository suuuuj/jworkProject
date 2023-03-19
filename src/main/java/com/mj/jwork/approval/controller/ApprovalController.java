package com.mj.jwork.approval.controller;

import java.io.File;
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
import com.mj.jwork.approval.model.service.ApprovalService;
import com.mj.jwork.approval.model.vo.AppLine;
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
	public String selectList() {
		return "approval/myApprovalList";
	}
	
	// 결재문서 작성 form 페이지
	@RequestMapping("enrollForm.app")
	public String ApprovalEnrollForm() {
		return "approval/approvalEnrollForm";
	}
	
	// 내 결재 리스트 버튼 조회 클릭시
	@ResponseBody
	@RequestMapping(value="btnList.app", produces="application/json; charset=utf-8")
	public String ajaxSelectBtn(Approval a, @RequestParam(value="cpage", defaultValue="1") int currentPage,Model model, HttpServletRequest request) {
		
		int listCount = aService.selectListCount(a); //페이징 매길 전체 게시글 수
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Approval> list = aService.ajaxSelectBtn(pi,a);
		
		HashMap<String, Object> map = new HashMap();
		map.put("listCount", listCount);
		map.put("pi", pi);
		map.put("list", list);
		
		return new Gson().toJson(map);
		
	}
	
	
	// 내결재문서 상세 조회 페이지
	@RequestMapping("myDetail.app")
	public ModelAndView approvalDetail(int no, ModelAndView mv) {
		Approval a = aService.selectApproval(no);
		ArrayList<AppLine> al = aService.selectAppLine(no);
		
		mv.addObject("a",a).setViewName("approval/myApprovalDetail");
		mv.addObject("al",al).setViewName("approval/myApprovalDetail");
		
		//System.out.println(al);
		
		return mv;
	}
	
	//상신 취소 페이지
	@RequestMapping("cancelForm.app")
	public String approvalCancleForm(int no, Model model) {
		model.addAttribute("a",aService.selectApproval(no));
		return "approval/approvalCancleForm";
	}
	
	//결재문서 삭제하기(첨부파일 삭제 추가해야됨)
	@RequestMapping("delete.app") 
	public String deleteApproval(int no, HttpSession session, Model model){
		//System.out.println(no);
		int result = aService.deleteApproval(no);
		session.setAttribute("alertMsg","문서가 삭제되었습니다.");
		return "redirect:mylist.app";
		
//		if(result>0) {
//			//삭제 성공했을 경우 첨부파일이 있을때
//			if(!filePath.equals("")) {
//				new File(session.getServletContext().getRealPath(filePath)).delete();
//			}
//			
//			
//		}else { // 삭제실패
//			model.addAttribute("errorMsg", "문서 삭제 실패");
//			return "common/errorPage";
//		}
	}
	
	
	// 미결재 리스트 조회 페이징
	@RequestMapping("unsignlist.app")
	public String selectUnsignList(@RequestParam(value="cpage", defaultValue="1") int currentPage,Model model, HttpServletRequest request) {
		
		Employee e = (Employee)request.getSession().getAttribute("loginUser");
		
		int listCount = aService.selectUnsignListCount(e.getEmpNo()); //페이징 매길 전체 게시글 수
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectUnsignList(pi,e.getEmpNo()); // 게시글 목록 조회
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		model.addAttribute("listCount",listCount);
		
		return "approval/unsignApprovalList";
		
	}
	
	// 미결재문서 상세 조회 페이지
	@RequestMapping("unsignDetail.app")
	public ModelAndView unsignDetail(int no, ModelAndView mv) {
		Approval a = aService.selectApproval(no);
		ArrayList<AppLine> al = aService.selectAppLine(no);
		
		mv.addObject("a",a).setViewName("approval/unsignApprovalDetail");
		mv.addObject("al",al).setViewName("approval/unsignApprovalDetail");
		
		//System.out.println(al);
		
		return mv;
	}
	
		
	// 결재 리스트 조회 페이징
	@RequestMapping("signlist.app")
	public String selectSignList(@RequestParam(value="cpage", defaultValue="1") int currentPage,Model model, HttpServletRequest request) {
		
		Employee e = (Employee)request.getSession().getAttribute("loginUser");
		
		int listCount = aService.selectSignListCount(e.getEmpNo()); //페이징 매길 전체 게시글 수
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectSignList(pi,e.getEmpNo()); // 게시글 목록 조회
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		model.addAttribute("listCount",listCount);
		
		//System.out.println(list);
		
		return "approval/signApprovalList";
		
	}
			
		
	// 임시보관함 리스트 조회 페이징
	@RequestMapping("draftList.app")
	public String selectdraftList(@RequestParam(value="cpage", defaultValue="1") int currentPage,Model model, HttpServletRequest request) {
		
		Employee e = (Employee)request.getSession().getAttribute("loginUser");
		
		int listCount = aService.selectdraftListCount(e.getEmpNo()); //페이징 매길 전체 게시글 수
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectdraftList(pi,e.getEmpNo()); // 게시글 목록 조회
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		model.addAttribute("listCount",listCount);
		
		//System.out.println(list);
		
		return "approval/appDraftboxList";
		
	}
	
	
}
