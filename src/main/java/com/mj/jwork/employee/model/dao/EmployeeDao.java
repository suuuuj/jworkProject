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
	
	// 사원 정보 수정
	public int updateEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updateEmployee", e);
	}
	
	// 사원 프로필 이미지 수정
	public int updateProfileImg(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updateProfileImg", e);
	}

}
