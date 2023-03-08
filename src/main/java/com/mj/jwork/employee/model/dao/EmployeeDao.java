package com.mj.jwork.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.employee.model.vo.Employee;

@Repository
public class EmployeeDao {

	// 로그인
	public Employee loginEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("employeeMapper.loginEmployee", e);
	}

}
