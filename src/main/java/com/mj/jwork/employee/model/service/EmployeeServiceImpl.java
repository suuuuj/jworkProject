package com.mj.jwork.employee.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.jwork.employee.model.dao.EmployeeDao;
import com.mj.jwork.employee.model.vo.Employee;

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

}
