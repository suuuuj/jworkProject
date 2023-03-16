package com.mj.jwork.employee.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.common.model.vo.PageInfo;
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

	// 사내 주소록 리스트 조회
	public int selectAddressInListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("employeeMapper.selectAddressInListCount");
	}
	public ArrayList<Employee> selectAddressInList(SqlSessionTemplate sqlSession, int empNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("employeeMapper.selectAddressInList", empNo , rowBounds);
	}
	
	// 개인 주소록 리스트 조회
	public int selectAddressOutListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("employeeMapper.selectAddressOutListCount");
	}

	public ArrayList<Employee> selectAddressOutList(SqlSessionTemplate sqlSession, int empNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("employeeMapper.selectAddressOutList", empNo , rowBounds);
	}

	// 사내 주소록 상세 조회 페이지(ajax)
	public Employee ajaxSelectAddressEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("employeeMapper.ajaxSelectAddressEmployee", e);
	}
	
	// 사내 주소록 검색
	public int selectAddressInSearchCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("employeeMapper.selectAddressInSearchCount", map);
	}
	public ArrayList<Employee> selectAddressInSearchList(SqlSessionTemplate sqlSession, HashMap<String, Object> map,
			PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("employeeMapper.selectAddressInSearchList", map , rowBounds);
	}
	
	// 사내 주소록 즐겨찾기
	public int ajaxInsertAddressFav(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.insert("employeeMapper.ajaxInsertAddressFav", e);
	}
	
	// 사내 주소록 즐겨찾기 해제
	public int ajaxDeleteAddressFav(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.insert("employeeMapper.ajaxDeleteAddressFav", e);
	}
	
	// 개인 주소록 상세 조회 페이지(ajax)
	public Employee ajaxSelectAddressOut(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("employeeMapper.ajaxSelectAddressOut", e);
	}
	
	// 개인 주소록 상세 수정
	public int updateAddressOut(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updateAddressOut", e);
	}
	
	

	

	


}
