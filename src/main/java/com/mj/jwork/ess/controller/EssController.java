package com.mj.jwork.ess.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
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
import com.mj.jwork.ess.model.vo.Annual;
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
	public String leaveMainPage(HttpSession session) {
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		Annual a = eService.selectAnnualCount(empNo);
		session.setAttribute("a", a);
		System.out.println(a);
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
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		Annual a = eService.selectAnnualCount(empNo);

		if (lc != null) {
			mv.addObject("a", a);
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
		
		System.out.println(le.getLeaveCategory());
		if(le.getLeaveCategory() == 0) {
			int result1 = eService.updateAnuualCount(le);
			int result2 = eService.insertLeave(le);
			
			if(result1 > 0 && result2 >0) {
				session.setAttribute("alertMsg", "휴가등록이 완료되었습니다.");
				return "redirect:/list.le";
			}else {
				model.addAttribute("errorMsg", "휴가등록에 실패하였습니다.");
				return "common/errorPage";
			}
		}else {
			int result = eService.insertLeave(le);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "휴가등록이 완료되었습니다.");
				return "redirect:/list.le";
			}else {
				model.addAttribute("errorMsg", "휴가등록에 실패하였습니다.");
				return "common/errorPage";
			}
			
		}
		
	}
	
	/**
	 * 휴가전체리스트
	 * @param currentPage
	 * @param mv
	 * @return
	 */
	@RequestMapping("list.le")
	public ModelAndView selectLeave(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		// 페이징
		int listCount = eService.selectLeaveListCount(e);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		// 페이징 후 게시글 전체조회
		ArrayList<Leave> list = eService.selectLeaveList(e, pi);
		
		mv.addObject("e", e);
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("ess/leaveList");
		
		return mv;
	}
	
	/**
	 * 휴가상세조회
	 * @param le
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="detail.le", produces="application/json; charset=UTF-8")
	public String selectLeaveDetail(Leave le) {
		
		Leave leave = eService.selectLeaveDetail(le);
		return new Gson().toJson(leave);
	}
	
	/**
	 * 휴가삭제하기
	 * @param leaveNo
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("delete.le")
	public ModelAndView deleteLeave(@RequestParam(value="no") int leaveNo, HttpSession session, ModelAndView mv) {
		int result = eService.deleteLeave(leaveNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "휴가등록 삭제에 성공하였습니다.");
			mv.setViewName("redirect:/list.le");
		}else {
			mv.addObject("errorMsg", "휴가등록 삭제에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/**
	 * 관리자 : 휴가내역전체조회
	 * @param currentPage
	 * @param session
	 * @return
	 */
	@RequestMapping("adminList.le")
	public String adminLeaveList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		int jobCode = ((Employee)session.getAttribute("loginUser")).getJobCode();
		
		if(jobCode == 6 || jobCode == 7) {
			model.addAttribute("errorMsg", "접근권한이 없습니다.");
			return "common/errorPage";
		}else {
		
			// 페이징
			int ListCount = eService.adminSelectLeaveListCount();
			PageInfo pi = Pagination.getPageInfo(ListCount, currentPage, 5, 15);
			
			Employee e = (Employee)session.getAttribute("loginUser");
			ArrayList<Leave> list = eService.adminSelectLeaveList(pi, e);
			
			session.setAttribute("pi", pi);
			session.setAttribute("list", list);
			return "ess/adminLeaveList";
		}
		
	}
	
	/**
	 * 관리자 : 휴가상세조회
	 * @param leaveNo
	 * @param mv
	 * @return
	 */
	@RequestMapping("adminDetail.le")
	public ModelAndView adminLeaveDetail(Leave le, HttpSession session, ModelAndView mv) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		Leave lc = eService.adminLeaveDetail(le); 
		
		if(lc.getFirstApproval() == empNo) {
			session.setAttribute("alertMsg", "이미 결재한 신청입니다.");
			mv.setViewName("redirect:/adminList.le");
		}else {
			mv.addObject("lc", lc);
			mv.setViewName("ess/adminLeaveDetailView");
		}
			
		
		return mv;
	}
	
	/**
	 * 관리자 : 휴가 1차결재선
	 * @param le
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("adminFirst.le")
	public ModelAndView adminFirstLeave(Leave le, HttpSession session, ModelAndView mv) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		le.setFirstApproval(empNo);
		int result = eService.adminFirstLeave(le);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "1차 휴가승인이 완료되었습니다.");
			mv.setViewName("redirect:/adminList.le");
		}else {
		mv.addObject("errorMsg", "1차 휴가승인에 실패하였습니다.");
		mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/**
	 * 관리자 : 휴가 2차결재선
	 * @param le
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("adminSecond.le")
	public ModelAndView adminSecondLeave(Leave le, HttpSession session, ModelAndView mv) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		le.setSecondApproval(empNo);
		int result = eService.adminSecondLeave(le);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "2차 휴가승인이 완료되었습니다.");
			mv.setViewName("redirect:/adminList.le");
		}else {
		mv.addObject("errorMsg", "2차 휴가승인에 실패하였습니다.");
		mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/**
	 * 관리자 : 휴가결재선 반려
	 * @param leaveNo
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("adminReturn.le")
	public ModelAndView adminReturnLeave(int leaveNo, HttpSession session, ModelAndView mv) {
		
		int result = eService.adminReturnLeave(leaveNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "휴가등록을 반려하였습니다.");
			mv.setViewName("redirect:/adminList.le");
		}else {
			mv.addObject("errorMsg", "휴가등록 반려에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/**
	 * 관리자 : 1년차이상 연차부여 (매년 1월1일)
	 * @param mv
	 * @return
	 */
	//@Scheduled(cron="0 0 09 1 1 *")
	@RequestMapping("adminYear.le")
	public ModelAndView adminUpdateYear(HttpSession session, ModelAndView mv) {
		
		int result = eService.adminUpdateYear();
		if(result > 0) {
			session.setAttribute("alertMsg", "연차등록이 완료되었습니다.");
			mv.setViewName("redirect:/adminAnnual.le");
		}else {
			mv.addObject("errorMsg", "연차등록에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 관리자 : 1년미만 연차부여 (매월 1일)
	 * @param mv
	 * @return
	 */
	//@Scheduled(cron="0 0 09 1 * *")
	@RequestMapping("adminMonth.le")
	public ModelAndView adminUpdateMonth(HttpSession session, ModelAndView mv) {
		int result = eService.adminUpdateMonth();
		if(result > 0) {
			session.setAttribute("alertMsg", "연차등록이 완료되었습니다.");
			mv.setViewName("redirect:/adminAnnual.le");
		}else {
			mv.addObject("errorMsg", "연차등록에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 관리자 : 연차내역전체조회
	 * @param mv
	 * @return
	 */
	@RequestMapping("adminAnnual.le")
	public ModelAndView adminAnnualList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		// 페이징
		int listCount = eService.adminAnnualListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		
		// 페이징 후 전체조회
		ArrayList<Annual> list = eService.adminAnnualList(pi);
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("ess/adminAnnualList");
		return mv;
	}
	
	/**
	 * 관리자 : 연차상세조회
	 * @param empNo
	 * @param session
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="anDetail.le", produces="application/json; charset=UTF-8")
	public String adminAnnualDetail(int empNo) {
		
		Annual a = eService.adminAnnualDetail(empNo);
		return new Gson().toJson(a);
	}
	
	/**
	 * 관리자 : 전체휴가일정캘린더
	 * @param mv
	 * @return
	 */
	@RequestMapping("adminAll.le")
	public ModelAndView adminAllLeave(ModelAndView mv) {
		mv.setViewName("ess/adminAllLeaveList");
		return mv;
	}
	
	/**
	 * 관리자 : ajax 전체휴가일정
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="adminAllList.le", produces="application/json; charset=UTF-8")
	public String adminAllLeaveList() {
		
		ArrayList<Leave> list = eService.adminSelectAllLeaveList();
		return new Gson().toJson(list);
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
	
	/**
	 * 신청조회
	 * @param session
	 * @param mv
	 * @return
	 */
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
	public String ajaxSelectBusinesstripList(@RequestParam(value="bpage", defaultValue="1") int currentPage, int empNo) {
		
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
	 * 출장상세조회
	 * @param btNo
	 * @param mv
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="detail.bt", produces="application/json; charset=UTF-8")
	public String selectBusinesstrip(int btNo) {
		
		Businesstrip b = eService.selectBusinesstrip(btNo);
		
		return new Gson().toJson(b);
	}
	
	/**
	 * 시간외근무상세조회
	 * @param otNo
	 * @param mv
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="detail.ot", produces="application/json; charset=UTF-8")
	public String selectOvertime(int otNo) {
		
		Overtime o = eService.selectOvertime(otNo);
		
		return new Gson().toJson(o);
	}
	
	
	/**
	 * 관리자 : 출장등록전체조회
	 * @return
	 */
	@RequestMapping("admin.bt")
	public String adminBusinesstripList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		int jobCode = ((Employee)session.getAttribute("loginUser")).getJobCode();
		
		if(jobCode == 6 || jobCode == 7) {
			model.addAttribute("errorMsg", "접근권한이 없습니다.");
			return "common/errorPage";
		}else {
			// 페이징, 리스트전체조회
			int listCount = eService.adminSelectBusinesstripListCount();
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
			
			Employee e = (Employee)session.getAttribute("loginUser");
			ArrayList<Businesstrip> list = eService.adminSelectBusinesstripList(pi,e);
			
			// 사원과 부서코드와 팀코드가 같으면서 직급코드가 3456인사람
			session.setAttribute("list", list);
			session.setAttribute("pi", pi);
			return "ess/adminBusinesstripList";
		}
		
	}
	
	/**
	 * 관리자 : 출장상세조횐
	 * @param btNo
	 * @param mv
	 * @return
	 */
	@RequestMapping("adDetail.bt")
	public ModelAndView adminSelectBusinesstrip(Businesstrip b, HttpSession session, ModelAndView mv) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		Businesstrip bt = eService.adminSelectBusinesstrip(b);
		
		if(bt.getFirstApproval() == empNo) {
			session.setAttribute("alertMsg", "이미 결재한 신청입니다.");
			mv.setViewName("redirect:/admin.bt");
		}else {
			mv.addObject("bt", bt);
			mv.setViewName("ess/adminBusinesstripDetailView");
		}
		
		return mv;
	}
	
	/**
	 * 관리자 : 시간외근무전체조회
	 * @return
	 */
	@RequestMapping("admin.ot")
	public ModelAndView adminOvertimeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv) {
		
		int jobCode = ((Employee)session.getAttribute("loginUser")).getJobCode();
		
		if(jobCode == 6 || jobCode == 7) {
			mv.addObject("errorMsg", "접근권한이 없습니다.");
			mv.setViewName("common/errorPage");
		}else {
			// 페이징
			int listCount = eService.adminSelectOvertimeListCount();
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
			
			Employee e = (Employee)session.getAttribute("loginUser");
			ArrayList<Overtime> list = eService.adminSelectOvertimeList(pi, e);
			
			// 사원과 부서코드와 팀코드가 같으면서 직급코드가 3456인사람
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("ess/adminOvertimeList");
		}
		
		return mv;
	}
	
	/**
	 * 관리자 : 시간외근무상세조회
	 * @param otNo
	 * @param mv
	 * @return
	 */
	@RequestMapping("adDetail.ot")
	public ModelAndView adminSelectOvertime(Overtime o, HttpSession session, ModelAndView mv) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		Overtime ot = eService.adminSelectOvertime(o);
		if(ot.getFirstApproval() == empNo) {
			session.setAttribute("alertMsg", "이미 결재한 신청입니다.");
			mv.setViewName("redirect:/admin.ot");
		}else {
			mv.addObject("ot", ot);
			mv.setViewName("ess/adminOvertimeDetailView");
		}
		
		return mv;
	}
	
	/**
	 * 관리자 : 출장 1차결재선
	 * @param b
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("adminFirst.bt")
	public ModelAndView adminFirstBusinesstrip(Businesstrip b, HttpSession session, ModelAndView mv) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		b.setFirstApproval(empNo);
		int result = eService.adminFirstBusinesstrip(b);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "1차 출장승인이 완료되었습니다.");
			mv.setViewName("redirect:/admin.bt");
		}else {
		mv.addObject("errorMsg", "1차 출장승인에 실패하였습니다.");
		mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/**
	 * 관리자 : 출장 2차결재선
	 * @param b
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("adminSecond.bt")
	public ModelAndView adminSecondbusinesstrip(Businesstrip b, HttpSession session, ModelAndView mv) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		b.setSecondApproval(empNo);
		int result = eService.adminSecondBusinesstrip(b);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "2차 출장승인이 완료되었습니다.");
			mv.setViewName("redirect:/admin.bt");
		}else {
		mv.addObject("errorMsg", "2차 출장승인에 실패하였습니다.");
		mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/**
	 * 관리자 : 출장등록결재선 반려
	 * @param btNo
	 * @param mv
	 * @return
	 */
	@RequestMapping("adminReturn.bt")
	public ModelAndView adminReturnBusinesstrip(int btNo, HttpSession session, ModelAndView mv) {
		int result = eService.adminReturnBusinesstrip(btNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "출장등록을 반려하였습니다.");
			mv.setViewName("redirect:/admin.bt");
		}else {
			mv.addObject("errorMsg", "출장등록 반려에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/**
	 * 관리자 : 시간외근무 1차결재선
	 * @param o
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("adminFirst.ot")
	public ModelAndView adminFirstOvertime(Overtime o, HttpSession session, ModelAndView mv) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		o.setFirstApproval(empNo);
		int result = eService.adminFirstOvertime(o);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "1차 시간외근무 승인이 완료되었습니다.");
			mv.setViewName("redirect:/admin.ot");
		}else {
		mv.addObject("errorMsg", "1차 시간외근무 승인에 실패하였습니다.");
		mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/**
	 * 관리자 : 시간외근무 2차결재선
	 * @param o
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("adminSecond.ot")
	public ModelAndView adminSecondOvertime(Overtime o, HttpSession session, ModelAndView mv) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		o.setSecondApproval(empNo);
		int result = eService.adminSecondOvertime(o);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "2차 시간외근무 승인이 완료되었습니다.");
			mv.setViewName("redirect:/admin.ot");
		}else {
		mv.addObject("errorMsg", "2차 시간외근무 승인에 실패하였습니다.");
		mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/**
	 * 관리자 : 시간외근무결재선 반려
	 * @param otNo
	 * @param mv
	 * @return
	 */
	@RequestMapping("adminReturn.ot")
	public ModelAndView adminReturnOvertime(int otNo, HttpSession session, ModelAndView mv) {
		int result = eService.adminReturnOvertime(otNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "시간외 근무등록록을 반려하였습니다.");
			mv.setViewName("redirect:/admin.ot");
		}else {
			mv.addObject("errorMsg", "시간외 근무등록 반려에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 근래스케줄링
	// @Scheduled(cron="0 0 02 * * ?") // 아무요일,매월,매일 12:00:00
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
