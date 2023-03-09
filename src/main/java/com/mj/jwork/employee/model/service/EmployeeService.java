package com.mj.jwork.employee.model.service;

import com.mj.jwork.employee.model.vo.Employee;

public interface EmployeeService {
	
	// 로그인
	Employee loginEmployee(Employee e);
	
	// 사원 정보 수정
	int updateEmployee(Employee e);
	
	// 사원 프로필 이미지 수정
	int updateProfileImg(Employee e);

}
