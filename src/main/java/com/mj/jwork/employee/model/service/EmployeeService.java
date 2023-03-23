package com.mj.jwork.employee.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.employee.model.vo.Department;
import com.mj.jwork.employee.model.vo.Employee;
import com.mj.jwork.employee.model.vo.Job;
import com.mj.jwork.employee.model.vo.Schedule;
import com.mj.jwork.employee.model.vo.Team;

public interface EmployeeService {
	
	// 로그인
	Employee loginEmployee(Employee e);
	
	// 사원 정보 수정
	int updateEmployee(Employee e);
	
	// 사원 프로필 이미지 수정
	int updateProfileImg(Employee e);

	//결재선 선택시 사원조회리스트(ajax)
	ArrayList<Employee> ajaxSelectEmpList();
	ArrayList<Department> ajaxSelectDeptList();
	ArrayList<Team> ajaxSelectTeamList();
	
	// 사내 주소록 리스트 조회 
	int selectAddressInListCount();
	ArrayList<Employee> selectAddressInList(int empNo, PageInfo pi);

	// 개인 주소록 리스트 조회
	int selectAddressOutListCount();
	ArrayList<Employee> selectAddressOutList(int empNo, PageInfo pi);
	
	// 사내 주소록 상세 조회 페이지(ajax)
	Employee ajaxSelectAddressEmployee(Employee e);

	// 사내 주소록 검색
	int selectAddressInSearchCount(HashMap<String, Object> map);
	ArrayList<Employee> selectAddressInSearchList(HashMap<String, Object> map, PageInfo pi);
	
	// 사내 주소록 즐겨찾기
	int ajaxInsertAddressFav(Employee e);
	
	// 사내 주소록 즐겨찾기 해제
	int ajaxDeleteAddressFav(Employee e);
	
	// 개인 주소록 상세 조회 페이지(ajax)
	Employee ajaxSelectAddressOut(Employee e);
	
	// 개인 주소록 상세 수정
	int updateAddressOut(Employee e);
	
	// 개인 주소록 검색
	int selectAddressOutSearchCount(HashMap<String, Object> map);
	ArrayList<Employee> selectAddressOutSearchList(HashMap<String, Object> map, PageInfo pi);
	
	// 메일 사원번호 입력시 사원조회 서비스 (ajax)
	Employee selectEmployee(int empNo);
	
	// 개인 주소록 즐겨찾기(ajax)
	int ajaxInsertAddressOutFav(Employee e);
	
	// 개인 주소록 즐겨찾기 해제(ajax)
	int ajaxDeleteAddressOutFav(Employee e);
	
	// 주소록 그룹 조회(ajax)
	ArrayList<Employee> ajaxSelectAddressGroup(int empNo);
	
	// 주소록 그룹 수정 - 조회(ajax)
	Employee ajaxSelectAddGroupName(int groupNo);
	// 주소록 그룹 수정
	int updateAddGroupName(Employee e);
	
	// 주소록 그룹 삭제
	int ajaxDeleteAddGroup(int groupNo);
	int ajaxUpdateAddoutGrNo(int groupNo);
	
	// 주소록 그룹 추가
	int insertAddressGroup(Employee e);
	
	// 주소록 연락처 추가
	int insertAddressOut(Employee e);
	int insertAddressOutFav(Employee e);
	
	// 주소록 연락처 삭제
	int deleteAddressOut(int addoutNo);
	
	// 즐겨찾기된 사내 주소록 리스트 조회
	int favAddressInListCount(int loginNo);
	ArrayList<Employee> ajaxFavAddressInList(int loginNo, PageInfo iPi);

	// 즐겨찾기된 개인 주소록 리스트 조회
	int favAddressOutListCount(int loginNo);
	ArrayList<Employee> ajaxFavAddressOutList(int loginNo, PageInfo oPi);
	
	// 캘린더 그룹 조회
	ArrayList<Employee> ajaxSelectSchGroup(int loginNo);
	
	// 캘린더 그룹 수정 - 조회(ajax)
	Employee ajaxSelectSchGroupName(int groupNo);
	// 캘린더 그룹 수정
	int updateSchGroupName(Employee e);

	// 캘린더 그룹 삭제
	int ajaxDeleteSchGroup(int groupNo);
	int ajaxUpdateSchGrNo(int groupNo);
	
	// 캘린더 그룹 추가
	int insertSchGroup(Employee e);
	
	// 부서 관리 - 부서 추가
	int insertDept(Department d);
	
	// 부서 관리 - 부서 삭제
	int ajaxDeleteDept(int deptCode);
	
	// 부서 관리 - 팀 추가
	int insertTeam(Team t);
	
	// 부서 관리 - 팀 삭제
	int ajaxDeleteTeam(int teamCode);
	
	// 부서 관리 - 직급 조회
	ArrayList<Job> ajaxSelectJobList();
	
	// 부서 관리 - 직급 추가
	int insertJob(Job j);
	
	// 부서 관리 - 직급 삭제
	int ajaxDeleteJob(int jobCode);

	// 조직도 조회
	ArrayList<Department> selectEmployeeChart();
	
	// 일정 등록
	int insertSchedule(Schedule s);
	// 일정 등록 - 참석자 추가
	int insertAttendee(String[] attendeeNo);
	
	// 주소록 - 조직도 조회
	ArrayList<Employee> ajaxAddressInChart();

	//결재자 추가
	Employee addSigner(int empNo);


	



}
