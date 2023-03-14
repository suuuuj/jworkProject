package com.mj.jwork.employee.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.employee.model.vo.Department;
import com.mj.jwork.employee.model.vo.Employee;
import com.mj.jwork.employee.model.vo.Team;

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

	//결재선 선택시 사원조회리스트(ajax)
	public ArrayList<Employee> ajaxSelectEmpList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxSelectEmpList");
	}
	public ArrayList<Department> ajaxSelectDeptList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxSelectDeptList");
	}
	public ArrayList<Team> ajaxSelectTeamList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxSelectTeamList");
	}

	


}
