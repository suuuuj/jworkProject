package com.mj.jwork.ess.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
import com.mj.jwork.ess.model.service.EssServiceImpl;
import com.mj.jwork.ess.model.vo.Businesstrip;
import com.mj.jwork.ess.model.vo.Leave;
import com.mj.jwork.ess.model.vo.LeaveCategory;
import com.mj.jwork.ess.model.vo.Overtime;

@Controller
public class EssController {

	@Autowired
	private EssServiceImpl eService;

	/**
	 * 휴가메뉴창 띄우기
	 * @return
	 */
	@RequestMapping("menu.le")
	public String leaveMainPage() {
		return "ess/leaveMenu";
	}

	/**
	 * 휴가등록폼
	 * @param no
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("enrollForm.le")
	public ModelAndView selectLeaveCategory(int no, HttpSession session, ModelAndView mv) {

		Employee e = (Employee) session.getAttribute("loginUser");
		LeaveCategory lc = eService.selectLeaveCategory(no);
		// System.out.println(lc);

		if (lc != null) {
			mv.addObject("lc", lc);
			mv.addObject("e", e);
			// session.setAttribute("loginUser", loginUser);
			mv.setViewName("ess/leaveEnrollForm");

		}

		return mv;
	}

	/**
	 * 휴가등록(insert)
	 * @param le
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("insert.le")
	public String insertLeave(Leave le, HttpSession session, Model model) {
		
		int result = eService.insertLeave(le);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "휴가등록이 완료되었습니다.");
			return "redirect:/menu.le";
		}else {
			model.addAttribute("errorMsg", "휴가등록에 실패하였습니다.");
			return "common/errorPage";
		}
		
	}
	
	/**
	 * 휴가전체리스트
	 * @param currentPage
	 * @param mv
	 * @return
	 */
	@RequestMapping("list.le")
	public ModelAndView selectLeave(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		// 페이징
		int listCount = eService.selectLeaveListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		// 페이징 후 게시글 전체조회
		ArrayList<Leave> list = eService.selectLeaveList(pi);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("ess/leaveList");
		
		return mv;
	}
	
	/**
	 * 시간외근무등록폼
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("enrollForm.ot")
	public ModelAndView overtimeEnrollForm(HttpSession session, ModelAndView mv) {
		
	
		Employee e = (Employee) session.getAttribute("loginUser");

		mv.addObject("e", e);
		mv.setViewName("ess/overtimeEnrollForm");
			
		return mv;
	}
	
	/**
	 * 출장등록폼
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("enrollForm.bt")
	public ModelAndView businesstripEnrollForm(HttpSession session, ModelAndView mv) {
		
		Employee e = (Employee)session.getAttribute("loginUser");

		mv.addObject("e", e);
		mv.setViewName("ess/businesstripEnrollForm");
			
		return mv;
	}
	
	/**
	 * 시간외근무등록신청(insert)
	 * @return
	 */
	@RequestMapping("insert.ot")
	public String insertOvertime(Overtime o, HttpSession session, Model model) {
		
		int result = eService.insertOvertime(o);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "시간외 근무등록이 완료되었습니다.");
			return "redirect:/list.wt";
		}else {
			model.addAttribute("errorMsg", "시간외 근무등록에 실패하였습니다.");
			return "common/errorPage";
		}
		
	}
	
	/**
	 * 시간외근무신청 삭제
	 * @param otNo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("delete.ot")
	public String deleteOvertime(int otNo, HttpSession session, Model model) {
		int result = eService.deleteOvertime(otNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "시간외 근무신청이 삭제되었습니다.");
			return "redirect:/list.wt";
		}else {
			model.addAttribute("errorMsg", "시간외 근무신청 삭제에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	/**
	 * 출장등록신청(insert)
	 * @return
	 */
	@RequestMapping("insert.bt")
	public String insertBusinesstrip(Businesstrip b, HttpSession session, Model model) {
		
		int result = eService.insertBusinesstrip(b);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "출장등록이 완료되었습니다.");
			return "redirect:/list.wt";
		}else {
			model.addAttribute("errorMsg", "출장등록에 실패하였습니다.");
			return "common/errorPage";
		}
		
	}
	
	/**
	 * 출장등록삭제
	 * @param btNo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("delete.bt")
	public String deleteBusinesstrip(int btNo, HttpSession session, Model model) {
		int result = eService.deleteBusinesstrip(btNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "출장신청이 삭제되었습니다.");
			return "redirect:/list.wt";
		}else {
			model.addAttribute("errorMsg", "출장신청삭제에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("list.wt")
	public ModelAndView selectEnrollList(HttpSession session, ModelAndView mv) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		mv.addObject("e", e);
		mv.setViewName("ess/workingEnrollList");
		
		return mv;
	}
	
	/**
	 * ajax 출장조회
	 * @param currentPage
	 * @param empNo
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="list.bt", produces="application/json; charset=UTF-8")
	public String ajaxSelectBusinesstripList(@RequestParam(value="bpage", defaultValue="1") int currentPage, int empNo, HttpSession session) {
		
		// 페이징
		int bListCount = eService.selectBusinesstripListCount(empNo);
		PageInfo bPi = Pagination.getPageInfo(bListCount, currentPage, 5, 5);
		
		// 페이징 후 게시글조회
		ArrayList<Businesstrip> bList = eService.selectBusinesstripList(empNo, bPi);
		
		HashMap<String, Object> bmap = new HashMap();
		bmap.put("bListCount", bListCount);
		bmap.put("bPi", bPi);
		bmap.put("bList", bList);
		
		return new Gson().toJson(bmap);
	}
	
	/**
	 * ajax 시간외근무 조회
	 * @param currentPage
	 * @param empNo
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="list.ot", produces="application/json; charset=UTF-8")
	public String ajaxSelectOvertimeList(@RequestParam(value="opage", defaultValue="1") int currentPage, int empNo, HttpSession session) {
		
		// 페이징
		int oListCount = eService.selectOvertimeListCount(empNo);
		PageInfo oPi = Pagination.getPageInfo(oListCount, currentPage, 5, 5);
		
		// 페이징 후 게시글조회
		ArrayList<Overtime> oList = eService.selectOvertimeList(empNo, oPi);
		
		HashMap<String, Object> omap = new HashMap();
		omap.put("oListCount", oListCount);
		omap.put("oPi", oPi);
		omap.put("oList", oList);
		
		return new Gson().toJson(omap);
		
	}
	
	/**
	 * 관리자 : 출장등록조회
	 * @return
	 */
	@RequestMapping("admin.bt")
	public String adminBusinesstripList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		// 페이징
		int listCount = eService.adminSelectBusinesstripListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		
		ArrayList<Businesstrip> list = eService.adminSelectBusinesstripList(pi);
		
		session.setAttribute("list", list);
		session.setAttribute("pi", pi);
		return "ess/adminBusinesstripList";
		
	}
	
	/**
	 * 관리자 : 시간외근무조회
	 * @return
	 */
	@RequestMapping("admin/ot")
	public ModelAndView adminOvertimeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		// 페이징
		int listCount = eService.adminSelectOvertimeListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		
		ArrayList<Overtime> list = eService.adminSelectOvertimeList(pi);
		
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("ess/adminOvertimeList");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
