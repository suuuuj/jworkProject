package com.mj.jwork.employee.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.jwork.employee.model.dao.EmployeeDao;
import com.mj.jwork.employee.model.vo.Department;
import com.mj.jwork.employee.model.vo.Employee;
import com.mj.jwork.employee.model.vo.Team;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EmployeeDao eDao;
	
	
	// 로그인
	@Override
	public Employee loginEmployee(Employee e) {
		Employee loginUser = eDao.loginEmployee(sqlSession, e);
		return loginUser;
	}

	// 사원 정보 수정
	@Override
	public int updateEmployee(Employee e) {
		return eDao.updateEmployee(sqlSession, e);
	}

	// 사원 프로필 이미지 수정
	@Override
	public int updateProfileImg(Employee e) {
		return eDao.updateProfileImg(sqlSession, e);
	}

	
	//결재선 선택시 사원조회리스트(ajax)
	@Override
	public ArrayList<Employee> ajaxSelectEmpList() {
		return eDao.ajaxSelectEmpList(sqlSession);
	}

	@Override
	public ArrayList<Department> ajaxSelectDeptList() {
		return eDao.ajaxSelectDeptList(sqlSession);
	}

	@Override
	public ArrayList<Team> ajaxSelectTeamList() {
		return eDao.ajaxSelectTeamList(sqlSession);
	}


	
}
