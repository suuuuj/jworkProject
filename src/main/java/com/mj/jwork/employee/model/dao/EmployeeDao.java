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
		
	// 메일 사원번호 입력시 사원조회 서비스 (ajax)
	public Employee selectEmployee(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("employeeMapper.selectEmployee", empNo);
	}
	
	// 개인 주소록 검색
	public int selectAddressOutSearchCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("employeeMapper.selectAddressOutSearchCount", map);
	}
	public ArrayList<Employee> selectAddressOutSearchList(SqlSessionTemplate sqlSession, HashMap<String, Object> map,
			PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("employeeMapper.selectAddressOutSearchList", map , rowBounds);
	}
	
	// 개인 주소록 즐겨찾기
	public int ajaxInsertAddressOutFav(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.insert("employeeMapper.ajaxInsertAddressOutFav", e);
	}
	
	// 개인 주소록 즐겨찾기 해제
	public int ajaxDeleteAddressOutFav(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.insert("employeeMapper.ajaxDeleteAddressOutFav", e);
	}
	
	// 주소록 그룹 조회(ajax)
	public ArrayList<Employee> ajaxSelectAddressGroup(SqlSessionTemplate sqlSession, int empNo) {	
		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxSelectAddressGroup", empNo);		
	}
	
	// 주소록 그룹 수정 - 조회(ajax)
	public Employee ajaxSelectAddGroupName(SqlSessionTemplate sqlSession, int groupNo) {
		return sqlSession.selectOne("employeeMapper.ajaxSelectAddGroupName", groupNo);
	}
	// 주소록 그룹 수정
	public int updateAddGroupName(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updateAddGroupName", e);
	}
	
	// 주소록 그룹 삭제
	public int ajaxDeleteAddGroup(SqlSessionTemplate sqlSession, int groupNo) {
		return sqlSession.delete("employeeMapper.ajaxDeleteAddGroup", groupNo);
	}
	public int ajaxUpdateAddoutGrNo(SqlSessionTemplate sqlSession, int groupNo) {
		return sqlSession.update("employeeMapper.ajaxUpdateAddoutGrNo", groupNo);
	}
	
	// 주소록 그룹 추가
	public int insertAddressGroup(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.insert("employeeMapper.insertAddressGroup", e);
	}
	
	// 주소록 연락처 추가
	public int insertAddressOut(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.insert("employeeMapper.insertAddressOut", e);
	}

	public int insertAddressOutFav(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.insert("employeeMapper.insertAddressOutFav", e);
	}
	
	// 주소록 연락처 삭제
	public int deleteAddressOut(SqlSessionTemplate sqlSession, int addoutNo) {
		return sqlSession.update("employeeMapper.deleteAddressOut", addoutNo);
	}
	
	// 즐겨찾기된 사내 주소록 리스트 조회
	public int favAddressInListCount(SqlSessionTemplate sqlSession, int loginNo) {
		return sqlSession.selectOne("employeeMapper.favAddressInListCount", loginNo);
	}
	public ArrayList<Employee> ajaxFavAddressInList(SqlSessionTemplate sqlSession, int loginNo, PageInfo iPi) {
		int offset = (iPi.getCurrentPage() - 1) * iPi.getBoardLimit();
		int limit = iPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxFavAddressInList", loginNo, rowBounds);
	}
	
	// 즐겨찾기된 개인 주소록 리스트 조회
	public int favAddressOutListCount(SqlSessionTemplate sqlSession, int loginNo) {
		return sqlSession.selectOne("employeeMapper.favAddressOutListCount", loginNo);
	}
	public ArrayList<Employee> ajaxFavAddressOutList(SqlSessionTemplate sqlSession, int loginNo, PageInfo oPi) {
		int offset = (oPi.getCurrentPage() - 1) * oPi.getBoardLimit();
		int limit = oPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxFavAddressOutList", loginNo, rowBounds);
	}
	
	// 캘린더 그룹 조회
	public ArrayList<Employee> ajaxSelectSchGroup(SqlSessionTemplate sqlSession, int loginNo) {
		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxSelectSchGroup", loginNo);
	}
	
	// 캘린더 그룹 수정 - 조회(ajax)
	public Employee ajaxSelectSchGroupName(SqlSessionTemplate sqlSession, int groupNo) {
		return sqlSession.selectOne("employeeMapper.ajaxSelectSchGroupName", groupNo);
	}
	// 캘린더 그룹 수정
	public int updateSchGroupName(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updateSchGroupName", e);
	}
	
	// 캘린더 그룹 삭제
	public int ajaxDeleteSchGroup(SqlSessionTemplate sqlSession, int groupNo) {
		return sqlSession.delete("employeeMapper.ajaxDeleteSchGroup", groupNo);
	}
	public int ajaxUpdateSchGrNo(SqlSessionTemplate sqlSession, int groupNo) {
		return sqlSession.update("employeeMapper.ajaxUpdateSchGrNo", groupNo);
	}
	
	// 캘린더 그룹 추가
	public int insertSchGroup(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.insert("employeeMapper.insertSchGroup", e);
	}
	
	

	


}
