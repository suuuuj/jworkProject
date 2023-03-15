package com.mj.jwork.employee.model.service;

import java.util.ArrayList;

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



}
