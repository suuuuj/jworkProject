package com.mj.jwork.employee.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.employee.model.vo.Department;
import com.mj.jwork.employee.model.vo.Employee;
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


	
	// 메일 사원번호 입력시 사원조회 서비스 (ajax)
	Employee selectEmployee(int empNo);


}
