package com.mj.jwork.employee.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
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
import com.mj.jwork.employee.model.vo.Job;
import com.mj.jwork.employee.model.vo.Schedule;
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
			return "common/mainPage";
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
	@RequestMapping(value="selectAdressEmployee.emp", produces="application/json; charset=utf-8")
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
		
		ArrayList<Employee> glist = eService.ajaxSelectAddressGroup(loginNo);
		Employee out = eService.ajaxSelectAddressOut(e);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("glist", glist);
		map.put("out", out);
		
		
		//System.out.println(map);
		return new Gson().toJson(map);

	}
	
	
	// 개인 주소록 상세 수정 
	@RequestMapping("updateAddressOut.emp")
	public String updateAddressOut(Employee e, HttpSession session, Model model) {
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		e.setLoginNo(loginNo);
		
		int result = eService.updateAddressOut(e);
		//System.out.println(result);
		if(result>0) {
			session.setAttribute("alertMsg", "수정완");
			return "redirect:addressOut.emp";	
		}else {
			model.addAttribute("errorMsg", "수정실패");
			return "common/errorPage";
		}
	}
	
	// 개인 주소록 검색
	@RequestMapping("addressOutSearch.emp")
	public String addressOutSearch(@RequestParam(value="cpage", defaultValue="1") int currentPage, String condition, String keyword, Model model, HttpSession session) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int searchCount = eService.selectAddressOutSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, 15);
		ArrayList<Employee> list = eService.selectAddressOutSearchList(map, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "employee/addressOutList";
	}
	
	// 개인 주소록 즐겨찾기(ajax)
	@ResponseBody
	@RequestMapping("insertAddressOutFav.emp")
	public String ajaxInsertAddressOutFav(Employee e, HttpSession session, Model model) {
		
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		e.setLoginNo(loginNo);
		
		int result = eService.ajaxInsertAddressOutFav(e);
		return result > 0 ? "success" : "fail";
	}
		
	// 개인 주소록 즐겨찾기 해제(ajax)
	@ResponseBody
	@RequestMapping("deleteAddressOutFav.emp")
	public String ajaxDeleteAddressOutFav(Employee e, HttpSession session, Model model) {
		
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		e.setLoginNo(loginNo);
		
		int result = eService.ajaxDeleteAddressOutFav(e);
		return result > 0 ? "success" : "fail";

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
	
	// 주소록 그룹 조회(ajax)
	@ResponseBody
	@RequestMapping(value="selectAddressGroup.emp", produces="application/json; charset=UTF-8")
	public String ajaxSelectAddressGroup(HttpSession session) {	
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		ArrayList<Employee> glist = eService.ajaxSelectAddressGroup(empNo);	

		return new Gson().toJson(glist);				
	}
	
	// 주소록 그룹 수정 - 조회(ajax)
	@ResponseBody
	@RequestMapping(value="selectAddGroupName.emp", produces="application/json; charset=UTF-8")
	public String ajaxSelectAddGroupName(int groupNo) {	
		
		Employee e = eService.ajaxSelectAddGroupName(groupNo);
		return new Gson().toJson(e);				
	}
	// 주소록 그룹 수정
	@RequestMapping("updateAddGroupName.emp")
	public String updateAddGroupName(Employee e, HttpSession session, Model model) {	
		
		int result = eService.updateAddGroupName(e);
		if(result>0) {
			session.setAttribute("alertMsg", "수정완");
			return "redirect:addressOut.emp";	
		}else {
			model.addAttribute("errorMsg", "수정실패");
			return "common/errorPage";
		}				
	}
	
	// 주소록 그룹 삭제
	@ResponseBody
	@RequestMapping("deleteAddressGroup.emp")
	public String ajaxDeleteAddGroup(int groupNo, HttpSession session, Model model) {	
		
		int result = eService.ajaxDeleteAddGroup(groupNo);
		eService.ajaxUpdateAddoutGrNo(groupNo);

		return result > 0 ? "success" : "fail";				
	}
	
	// 주소록 그룹 추가
	@RequestMapping("insertAddressGroup.emp")
	public String insertAddressGroup(Employee e, HttpSession session, Model model) {
		
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		e.setLoginNo(loginNo);
		
		int result = eService.insertAddressGroup(e);
		if(result > 0) {
			session.setAttribute("alertMsg", "추가완");
			return "redirect:addressOut.emp";
		}else {
			model.addAttribute("errorMsg", "추가실패");
			return "common/errorPage";
		}
	}
	
	// 주소록 연락처 추가
	@RequestMapping("insertAddressOut.emp")
	public String insertAddressOut(Employee e, HttpSession session, Model model) {
		
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		e.setLoginNo(loginNo);
		
		if(e.getCheckStar() == 1) {
			int result1 = eService.insertAddressOut(e);
			int result2 = eService.insertAddressOutFav(e);

			if (result1 > 0 && result2 > 0) {
				session.setAttribute("alertMsg", "추가완");
				return "redirect:addressOut.emp";
			} else {
				model.addAttribute("errorMsg", "추가실패");
				return "common/errorPage";
			}
		} else {
			int result = eService.insertAddressOut(e);
			if (result > 0) {
				session.setAttribute("alertMsg", "추가완");
				return "redirect:addressOut.emp";
			} else {
				model.addAttribute("errorMsg", "추가실패");
				return "common/errorPage";
			}
		}
		
	}
	
	// 주소록 연락처 삭제(ajax)
	@ResponseBody
	@RequestMapping("deleteAddressOut.emp")
	public String deleteAddressOut(Integer addoutNo, HttpSession session, Model model) {
		int result = eService.deleteAddressOut(addoutNo);
		return result > 0 ? "success" : "fail";
	}
	
	
	// 즐겨찾기된 사내 주소록 리스트 조회(ajax)
	@ResponseBody
	@RequestMapping(value="favAddressInList.emp", produces="application/json; charset=UTF-8")
	public String ajaxFavAddressInList(@RequestParam(value="ipage", defaultValue="1") int currentPage, HttpSession session) {	
		
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int iListCount = eService.favAddressInListCount(loginNo);
		PageInfo iPi = Pagination.getPageInfo(iListCount, currentPage, 5, 5);
			
		ArrayList<Employee> iList = eService.ajaxFavAddressInList(loginNo, iPi);	
		
		HashMap<String, Object> imap = new HashMap();
		imap.put("iListCount", iListCount);
		imap.put("iPi", iPi);
		imap.put("iList", iList);
		
		return new Gson().toJson(imap);				
	}
	
	// 즐겨찾기된 개인 주소록 리스트 조회(ajax)
	@ResponseBody
	@RequestMapping(value="favAddressOutList.emp", produces="application/json; charset=UTF-8")
	public String ajaxFavAddressOutList(@RequestParam(value="opage", defaultValue="1") int currentPage, HttpSession session) {	
		
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int oListCount = eService.favAddressOutListCount(loginNo);
		PageInfo oPi = Pagination.getPageInfo(oListCount, currentPage, 5, 5);
			
		ArrayList<Employee> oList = eService.ajaxFavAddressOutList(loginNo, oPi);	
		
		HashMap<String, Object> omap = new HashMap();
		omap.put("oListCount", oListCount);
		omap.put("oPi", oPi);
		omap.put("oList", oList);
		
		return new Gson().toJson(omap);				
	}
	
	// 캘린더 그룹 조회(ajax)
	@ResponseBody
	@RequestMapping(value="selectSchGroup.emp", produces="application/json; charset=UTF-8")
	public String ajaxSelectSchGroup(HttpSession session) {	
		
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		ArrayList<Employee> slist = eService.ajaxSelectSchGroup(loginNo);	

		return new Gson().toJson(slist);				
	}
	
	// 캘린더 그룹 수정 - 조회(ajax)
	@ResponseBody
	@RequestMapping(value="selectSchGroupName.emp", produces="application/json; charset=UTF-8")
	public String ajaxSelectSchGroupName(int groupNo) {	
		Employee e = eService.ajaxSelectSchGroupName(groupNo);
		return new Gson().toJson(e);				
	}
	// 캘린더 그룹 수정
	@RequestMapping("updateSchGroupName.emp")
	public String updateSchGroupName(Employee e, HttpSession session, Model model) {	
		int result = eService.updateSchGroupName(e);
		if(result>0) {
			session.setAttribute("alertMsg", "수정완");
			return "redirect:schedule.emp";
		}else {
			model.addAttribute("errorMsg", "수정실패");
			return "common/errorPage";
		}				
	}
	
	// 캘린더 그룹 삭제
	@ResponseBody
	@RequestMapping("deleteSchGroup.emp")
	public String ajaxDeleteSchGroup(int groupNo, HttpSession session, Model model) {	
		int result = eService.ajaxDeleteSchGroup(groupNo);
		eService.ajaxUpdateSchGrNo(groupNo);
		
		return result > 0 ? "success" : "fail";				
	}
	
	// 캘린더 그룹 추가
	@RequestMapping("insertSchGroup.emp")
	public String insertSchGroup(Employee e, HttpSession session, Model model) {
		
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		e.setLoginNo(loginNo);
		
		int result = eService.insertSchGroup(e);
		if(result > 0) {
			session.setAttribute("alertMsg", "추가완");
			return "redirect:schedule.emp";
		}else {
			model.addAttribute("errorMsg", "추가실패");
			return "common/errorPage";
		}
	}
	
	// 부서 관리 페이지
	@RequestMapping("department.ad")
	public String selectDepartment() {
		return "employee/adminDepartment";
	}
	
	// 부서 관리 - 부서 조회(ajax)
	@ResponseBody
	@RequestMapping(value="selectDept.ad", produces="application/json; charset=UTF-8")
	public String ajaxSelectDept(HttpSession session) {		
		ArrayList<Department> deptList = eService.ajaxSelectDeptList();
		return new Gson().toJson(deptList);				
	}
	
	// 부서 관리 - 부서 추가
	@RequestMapping("insertDept.ad")
	public String insertDept(Department d, HttpSession session, Model model) {		
		int result = eService.insertDept(d);
		if(result > 0) {
			session.setAttribute("alertMsg", "추가완");
			return "redirect:department.ad";
		}else {
			model.addAttribute("errorMsg", "추가실패");
			return "common/errorPage";
		}
	}
	
	// 부서 관리 - 부서 삭제
	@ResponseBody
	@RequestMapping("deleteDept.ad")
	public String ajaxDeleteDept(int deptCode, HttpSession session, Model model) {	
		int result = eService.ajaxDeleteDept(deptCode);	
		return result > 0 ? "success" : "fail";				
	}
	
	// 부서 관리 - 팀 조회(ajax)
	@ResponseBody
	@RequestMapping(value="selectTeam.ad", produces="application/json; charset=UTF-8")
	public String ajaxSelectTeam(HttpSession session) {		
		ArrayList<Team> teamList = eService.ajaxSelectTeamList();
		return new Gson().toJson(teamList);				
	}
	
	// 부서 관리 - 팀 추가
	@RequestMapping("insertTeam.ad")
	public String insertTeam(Team t, HttpSession session, Model model) {		
		int result = eService.insertTeam(t);
		if(result > 0) {
			session.setAttribute("alertMsg", "추가완");
			return "redirect:department.ad";
		}else {
			model.addAttribute("errorMsg", "추가실패");
			return "common/errorPage";
		}
	}
	
	// 부서 관리 - 팀 삭제
	@ResponseBody
	@RequestMapping("deleteTeam.ad")
	public String ajaxDeleteTeam(int teamCode, HttpSession session, Model model) {	
		int result = eService.ajaxDeleteTeam(teamCode);	
		return result > 0 ? "success" : "fail";				
	}
	
	// 부서 관리 - 직급 조회(ajax)
	@ResponseBody
	@RequestMapping(value="selectJob.ad", produces="application/json; charset=UTF-8")
	public String ajaxSelectJob(HttpSession session) {		
		ArrayList<Job> jobList = eService.ajaxSelectJobList();
		return new Gson().toJson(jobList);				
	}
	
	// 부서 관리 - 직급 추가
	@RequestMapping("insertJob.ad")
	public String insertJob(Job j, HttpSession session, Model model) {		
		int result = eService.insertJob(j);
		if(result > 0) {
			session.setAttribute("alertMsg", "추가완");
			return "redirect:department.ad";
		}else {
			model.addAttribute("errorMsg", "추가실패");
			return "common/errorPage";
		}
	}
	
	// 부서 관리 - 직급 삭제
	@ResponseBody
	@RequestMapping("deleteJob.ad")
	public String ajaxDeleteJob(int jobCode, HttpSession session, Model model) {	
		int result = eService.ajaxDeleteJob(jobCode);	
		return result > 0 ? "success" : "fail";				
	}
		
	// 조직도 조회
	@ResponseBody
	@RequestMapping(value="employeeChart.emp", produces="application/json; charset=UTF-8")
	public String ajaxEmployeeChart() {	
		ArrayList<Department> deptList = eService.selectEmployeeChart();
		return new Gson().toJson(deptList);	
	}
	
	// 일정 등록
	@RequestMapping("insertSchedule.emp")
	public String insertSchedule(Schedule s, String attendance, HttpSession session, Model model) {
		
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		s.setLoginNo(loginNo);
		
		String[] attendanceArr = attendance.split(",");
		System.out.println(attendanceArr);
		System.out.println(Arrays.toString(attendanceArr));
		if(!Arrays.toString(attendanceArr).equals("[]")) {	// 참석자가 있는 경우
			int result1 = eService.insertSchedule(s);				// 일정 등록
			int result2 = eService.insertAttendee(attendanceArr);	// 참석자 추가
			
			if(result1>0 && result2>0) {
				session.setAttribute("alertMsg", "일정 등록 완료");
				return "redirect:schedule.emp";
			}else {
				model.addAttribute("errorMsg", "일정 등록 실패");
				return "common/errorPage";
			}
		}else {	// 참석자가 없는 경우
			int result = eService.insertSchedule(s);
			if(result>0) {
				session.setAttribute("alertMsg", "일정 등록 완료");
				return "redirect:schedule.emp";
			}else {
				model.addAttribute("errorMsg", "일정 등록 실패");
				return "common/errorPage";
			}
		}
	}
	
	// 일정 참석자 사원번호 입력시 사원조회 서비스 (ajax)
	@ResponseBody
	@RequestMapping(value="selectAttendee.emp", produces="application/json; charset=utf-8")
	public String ajaxSelectAttendee(int empNo) {
		Employee e = eService.selectEmployee(empNo);
		return new Gson().toJson(e);
	}
	
	// 주소록 - 조직도 조회
	@ResponseBody
	@RequestMapping(value="addressInChart.emp", produces="application/json; charset=UTF-8")
	public String ajaxAddressInChart(HttpSession session) {		
		ArrayList<Employee> clist = eService.ajaxAddressInChart();	
		//System.out.println(clist);
		return new Gson().toJson(clist);
	}
	
	// 홈 아이콘 클릭시
	@RequestMapping("home.jwork")
	public String fowardingHome(HttpSession session) {
		Employee e = (Employee)session.getAttribute("loginUser");
		Employee loginUser = eService.loginEmployee(e);
		session.setAttribute("loginUser", loginUser);
		return "common/mainPage";
	}

	// 결재자 추가
	@ResponseBody
	@RequestMapping(value="addSigner.app", produces="application/json; charset=utf-8")
	public String ajaxAddSigner(int empNo) {
		Employee list = eService.addSigner(empNo);
		
		return new Gson().toJson(list);
	}
	
	// 일정 조회
	@ResponseBody
	@RequestMapping(value="selectSchedule.emp", produces="application/json; charset=utf-8")
	public String ajaxSelectSchedule(Employee e, HttpSession session) {
		
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		e.setLoginNo(loginNo);
		
//		ArrayList<Schedule> mySchList = eService.ajaxSelectMySchedule(loginNo);
//		ArrayList<Schedule> attSchList = eService.ajaxSelectAttSchedule(loginNo); // 다른 사람이 나를 참석자로 등록
//		
//		Map<String, ArrayList> data = new HashMap<>();
//		data.put("mySchList", mySchList);
//		data.put("attSchList", attSchList);
//		
//		return new Gson().toJson(data);
		
		ArrayList<Schedule> sList = eService.ajaxSelectSchedule(loginNo);
		return new Gson().toJson(sList);

		
	}
	
	// 일정 상세 조회
	@ResponseBody
	@RequestMapping(value="selectScheduleDetail.emp", produces="application/json; charset=utf-8")
	public String ajaxSelectSchDetail(Employee e, int schNo, HttpSession session) {
		
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		e.setLoginNo(loginNo);	
		
		Schedule s = eService.ajaxSelectSchDetail(schNo);	// 일정 상세 조회
		ArrayList<Schedule> alist = eService.ajaxSelectAttDetail(schNo);	// 참석자 여부
		ArrayList<Employee> slist = eService.ajaxSelectSchGroup(loginNo);	// 로그인한 사원의 캘린더 그룹 조회
		//System.out.println(alist);
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("s", s);
		data.put("alist", alist);
		data.put("slist", slist);
		return new Gson().toJson(data);
	}
	
	// 일정 수정
	@RequestMapping("updateSchedule.emp")
	public String updateSchedule(Schedule s, String attendance, int schNo, int attendanceOld, HttpSession session, Model model) {
		
		String[] attendanceArr = attendance.split(",");
		//System.out.println(attendance);
		
		//eService.deleteAttendee(schNo);			// 먼저 참석자 모두 delete
		//eService.updateAttendee(attendanceArr);	// 참석자 insert
		//eService.updateSchedule(s);				// 일정 수정 update
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		if(!Arrays.toString(attendanceArr).equals("[]")) {	// 새로운 참석자가 들어있었을 경우
			
			if(attendanceOld > 0) { // 그 전 참석자가 있을 경우
				result1 = eService.deleteAttendee(schNo);	// 그 전 참석자를 지우고
				result2 = eService.updateAttendee(attendanceArr, schNo);	// 새로운 참석자를 넣고
				result3 = eService.updateSchedule(s);	// 일정도 수정
				if(result1 * result2 * result3 > 0) {
					session.setAttribute("alertMsg", "일정 수정 완료");
					return "redirect:schedule.emp"; 
				}else {
					model.addAttribute("errorMsg", "일정 수정 실패");
					return "common/errorPage";
				}
			}else {
				result2 = eService.updateAttendee(attendanceArr, schNo);	// 새로운 참석자를 넣고
				result3 = eService.updateSchedule(s);	// 일정도 수정
				if(result2 * result3 > 0) {
					session.setAttribute("alertMsg", "일정 수정 완료");
					return "redirect:schedule.emp"; 
				}else {
					model.addAttribute("errorMsg", "일정 수정 실패");
					return "common/errorPage";
				}
			}
		}else {	// 새로운 참석자가 들어있지 않을 경우
			if(attendanceOld > 0) {	// 그 전 참석자가 있을 경우
				result1 = eService.deleteAttendee(schNo);	// 그 전 참석자를 지우고	
				result3 = eService.updateSchedule(s);	// 일정을 수정
				if(result1 * result3 > 0) {
					session.setAttribute("alertMsg", "일정 수정 완료");
					return "redirect:schedule.emp"; 
				}else {
					model.addAttribute("errorMsg", "일정 수정 실패");
					return "common/errorPage";
				}
			}else {
				result3 = eService.updateSchedule(s);	// 일정을 수정
				if(result3 > 0) {
					session.setAttribute("alertMsg", "일정 수정 완료");
					return "redirect:schedule.emp"; 
				}else {
					model.addAttribute("errorMsg", "일정 수정 실패");
					return "common/errorPage";
				}
			}
		}	
	}
	
	// 일정 삭제
	@ResponseBody
	@RequestMapping("deleteSchedule.emp")
	public String ajaxDeleteSchedule(int schNo, Integer enrollEmpNo, HttpSession session, Model model) {
		int loginNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		Schedule s = new Schedule();
		s.setLoginNo(loginNo);
		s.setSchNo(schNo);
		
		int result = eService.ajaxDeleteSchedule(s);
		return result > 0 ? "success" : "fail";		

	}
	
	// 사원 관리 - 조회 페이지
	@RequestMapping("employeeList.ad")
	public String selectEmployeeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = eService.selectEmployeeListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		ArrayList<Employee> list = eService.selectEmployeeList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "employee/adminEmployeeList";
	}
	
	// 사원 관리 - 리스트 엑셀 변환
	@RequestMapping(value = "/employeeExcel.ad")

	public void excelDown(HttpServletResponse response) throws Exception {

	    // 게시판 목록조회
	    ArrayList<Employee> list = eService.selectEmployeeAllList();

	    // 워크북 생성
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("사원정보");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;

	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();
	    CellStyle bodyStyle = wb.createCellStyle();

	    // 가는 경계선
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    sheet.setDefaultColumnWidth(15); // 열 너비

	    // 초록 배경
	    headStyle.setFillForegroundColor(HSSFColorPredefined.LIGHT_GREEN.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    // 데이터 가운데 정렬
	    headStyle.setAlignment(HorizontalAlignment.CENTER);
	    bodyStyle.setAlignment(HorizontalAlignment.CENTER);

	    // 경계 스타일 테두리만 지정    
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    // 헤더 생성
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(0); cell.setCellStyle(headStyle); 
	    cell.setCellValue("사원번호");
	    cell = row.createCell(1); cell.setCellStyle(headStyle); 
	    cell.setCellValue("이름");
	    cell = row.createCell(2); cell.setCellStyle(headStyle); 
	    cell.setCellValue("부서"); 
	    cell = row.createCell(3); cell.setCellStyle(headStyle); 
	    cell.setCellValue("팀");
	    cell = row.createCell(4); cell.setCellStyle(headStyle); 
	    cell.setCellValue("직급"); 
	    cell = row.createCell(5); cell.setCellStyle(headStyle); 
	    cell.setCellValue("성별");
	    cell = row.createCell(6); cell.setCellStyle(headStyle); 
	    cell.setCellValue("이메일");
	    cell = row.createCell(7); cell.setCellStyle(headStyle); 
	    cell.setCellValue("전화번호");
	    cell = row.createCell(8); cell.setCellStyle(headStyle); 
	    cell.setCellValue("생년월일");
	    cell = row.createCell(9); cell.setCellStyle(headStyle); 
	    cell.setCellValue("사내번호");
	    cell = row.createCell(10); cell.setCellStyle(headStyle); 
	    cell.setCellValue("입사일");
	    cell = row.createCell(11); cell.setCellStyle(headStyle); 
	    cell.setCellValue("퇴사일");
	    cell = row.createCell(12); cell.setCellStyle(headStyle); 
	    cell.setCellValue("업무");

	    // 데이터 부분 생성
	    for(Employee e : list) {
	        row = sheet.createRow(rowNo++);
	        
	        cell = row.createCell(0); cell.setCellStyle(bodyStyle);
	        cell.setCellValue(e.getEmpNo());
	        cell = row.createCell(1); cell.setCellStyle(bodyStyle);
	        cell.setCellValue(e.getEmpName());
	        cell = row.createCell(2); cell.setCellStyle(bodyStyle);
	        cell.setCellValue(e.getDeptName());
	        cell = row.createCell(3); cell.setCellStyle(bodyStyle);
	        cell.setCellValue(e.getTeamName());
	        cell = row.createCell(4); cell.setCellStyle(bodyStyle);
	        cell.setCellValue(e.getJobName());
	        cell = row.createCell(5); cell.setCellStyle(bodyStyle);
	        cell.setCellValue(e.getGender());
	        cell = row.createCell(6); cell.setCellStyle(bodyStyle);
	        cell.setCellValue(e.getEmail());
	        cell = row.createCell(7); cell.setCellStyle(bodyStyle);
	        cell.setCellValue(e.getPhone());
	        cell = row.createCell(8); cell.setCellStyle(bodyStyle);
	        cell.setCellValue(e.getBirth());
	        cell = row.createCell(9); cell.setCellStyle(bodyStyle);
	        cell.setCellValue(e.getEmpPhone());
	        cell = row.createCell(10); cell.setCellStyle(bodyStyle);
	        cell.setCellValue(e.getEnrollDate());
	        cell = row.createCell(11); cell.setCellStyle(bodyStyle);
	        cell.setCellValue(e.getResignDate());
	        cell = row.createCell(12); cell.setCellStyle(bodyStyle);
	        cell.setCellValue(e.getTask());
	    }

	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=employee.xls");

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();
	}

	
	// 사원 관리 - 상세 조회(ajax)
	@ResponseBody
	@RequestMapping(value="selectEmployee.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectEmployee(int empNo, HttpSession session) {

		ArrayList<Department> deptList = eService.ajaxSelectDeptList();
		ArrayList<Team> teamList = eService.ajaxSelectTeamList();
		ArrayList<Job> jobList = eService.ajaxSelectJobList();
		
		Employee e = eService.ajaxSelectEmployee(empNo);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("deptList", deptList);
		map.put("teamList", teamList);
		map.put("jobList", jobList);
		map.put("e", e);
		
		return new Gson().toJson(map);
	}
	
	// 사원 관리 - 상세 수정
	@RequestMapping("updateEmployee.ad")
	public String updateEmployeeDetail(Employee e, HttpSession session, Model model) {
		int result = eService.updateEmployeeDetail(e);
		System.out.println(result);
		if(result>0) {
			session.setAttribute("alertMsg", "수정완");
			return "redirect:employeeList.ad";	
		}else {
			model.addAttribute("errorMsg", "수정실패");
			return "common/errorPage";
		}
	}	
	// 사원 관리 - 프로필 이미지 수정
	@ResponseBody	
	@RequestMapping("uploadProfile.ad")
	public void updateEmpProfileImg(MultipartFile uploadFile, Employee e, 
								 String originalFile, HttpSession session) { 
		
		if(uploadFile != null) {
			String saveFilePath = FileUpload.saveFile(uploadFile, session, "resources/profile_images/");
			e.setProfileUrl(saveFilePath);
			
			int result = eService.updateEmpProfileImg(e);
			
			if(result>0) {
				if(!originalFile.equals("")) {
					new File(session.getServletContext().getRealPath(originalFile)).delete();
				}
				//session.setAttribute("alertMsg", "수정완");
			}
		}	
	}
	
	// 사원 등록 페이지
	@RequestMapping("enrollEmpForm.ad")
	public String enrollEmpForm() {
		
		return "employee/adminEmployeeEnroll";
	}
	
	// 사원 등록
	@RequestMapping("insertEmployee.ad")
	public String insertEmployee(MultipartFile profileImg, Employee e, HttpSession session, Model model) {
		
		System.out.println(profileImg);
		String saveFilePath = FileUpload.saveFile(profileImg, session, "resources/profile_images/");
		e.setProfileUrl(saveFilePath);
		
		int result1 = eService.insertEmployee(e);
		System.out.println(result1);
		if(result1 > 0) {
			//eService.insertSchBasicGroup();
			session.setAttribute("alertMsg", "추가완");
			return "redirect:employeeList.ad";
		}else {
			model.addAttribute("errorMsg", "추가실패");
			return "common/errorPage";
		}
	}
	
	
	
	// 로그아웃
	@RequestMapping("logout.emp")
	public String logOut(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	
}
