package com.mj.jwork.employee.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.jwork.common.model.vo.PageInfo;
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
	
	
	// 사내 주소록 리스트 조회
	@Override
	public int selectAddressInListCount() {
		return eDao.selectAddressInListCount(sqlSession);
	}
	@Override
	public ArrayList<Employee> selectAddressInList(int empNo, PageInfo pi) {
		return eDao.selectAddressInList(sqlSession, empNo, pi);
	}
	
	// 개인 주소록 리스트 조회
	@Override
	public int selectAddressOutListCount() {
		return eDao.selectAddressOutListCount(sqlSession);
	}
	@Override
	public ArrayList<Employee> selectAddressOutList(int empNo, PageInfo pi) {
		return eDao.selectAddressOutList(sqlSession, empNo, pi);
	}

	// 사내 주소록 상세 조회 페이지(ajax)
	@Override
	public Employee ajaxSelectAddressEmployee(Employee e) {
		return eDao.ajaxSelectAddressEmployee(sqlSession, e);
	}

	
	// 사내 주소록 검색
	@Override
	public int selectAddressInSearchCount(HashMap<String, Object> map) {
		return eDao.selectAddressInSearchCount(sqlSession, map);
	}
	@Override
	public ArrayList<Employee> selectAddressInSearchList(HashMap<String, Object> map, PageInfo pi) {
		return eDao.selectAddressInSearchList(sqlSession, map, pi);
	}

	// 사내 주소록 즐겨찾기
	@Override
	public int ajaxInsertAddressFav(Employee e) {
		return eDao.ajaxInsertAddressFav(sqlSession, e);
	}
	
	// 사내 주소록 즐겨찾기 해제
	@Override
	public int ajaxDeleteAddressFav(Employee e) {
		return eDao.ajaxDeleteAddressFav(sqlSession, e);
	}
	
	// 개인 주소록 상세 조회 페이지(ajax)
	@Override
	public Employee ajaxSelectAddressOut(Employee e) {
		return eDao.ajaxSelectAddressOut(sqlSession, e);
	}
	
	// 개인 주소록 상세 수정
	@Override
	public int updateAddressOut(Employee e) {
		return eDao.updateAddressOut(sqlSession, e);
	}


	
}
