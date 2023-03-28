package com.mj.jwork.employee.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.employee.model.vo.Department;
import com.mj.jwork.employee.model.vo.Employee;
import com.mj.jwork.employee.model.vo.Job;
import com.mj.jwork.employee.model.vo.Schedule;
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
	
	// 비밀번호 변경
	public int updatePwd(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updatePwd", e);
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
	
	// 부서 관리 - 부서 추가
	public int insertDept(SqlSessionTemplate sqlSession, Department d) {
		return sqlSession.insert("employeeMapper.insertDept", d);
	}
	
	// 부서 관리 - 부서 삭제
	public int ajaxDeleteDept(SqlSessionTemplate sqlSession, int deptCode) {
		return sqlSession.update("employeeMapper.ajaxDeleteDept", deptCode);
	}
	
	// 부서 관리 - 팀 추가
	public int insertTeam(SqlSessionTemplate sqlSession, Team t) {
		return sqlSession.insert("employeeMapper.insertTeam", t);
	}
	
	// 부서 관리 - 팀 삭제
	public int ajaxDeleteTeam(SqlSessionTemplate sqlSession, int teamCode) {
		return sqlSession.update("employeeMapper.ajaxDeleteTeam", teamCode);
	}
	
	// 부서 관리 - 직급 조회
	public ArrayList<Job> ajaxSelectJobList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxSelectJobList");
	}
	
	// 부서 관리 - 직급 추가
	public int insertJob(SqlSessionTemplate sqlSession, Job j) {
		return sqlSession.insert("employeeMapper.insertJob", j);
	}
	
	// 부서 관리 - 직급 삭제
	public int ajaxDeleteJob(SqlSessionTemplate sqlSession, int jobCode) {
		return sqlSession.update("employeeMapper.ajaxDeleteJob", jobCode);
	}
	
	// 조직도 조회
	public ArrayList<Department> selectEmployeeChart(SqlSessionTemplate sqlSession){	
		return (ArrayList)sqlSession.selectList("employeeMapper.selectEmployeeChart");
	}
	
	//결재자 추가
	public Employee addSigner(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("employeeMapper.addSigner", empNo);
	}

	// 일정 등록
	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.insert("employeeMapper.insertSchedule", s);
	}
	// 일정 등록 - 참석자 추가
	public int insertAttendee(SqlSessionTemplate sqlSession, String[] attendance) { // String[] attendance
		
		int count = 0;
		for(String empNo : attendance) {
			//System.out.println(empNo);
			count += sqlSession.insert("employeeMapper.insertAttendee", empNo);
		}
		return count;	
	}
	
	// 주소록 - 조직도 조회
	public ArrayList<Employee> ajaxAddressInChart(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxAddressInChart");
	}
	
	// 일정 조회
//	public ArrayList<Schedule> ajaxSelectMySchedule(SqlSessionTemplate sqlSession, int loginNo) {
//		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxSelectMySchedule", loginNo);
//	}
//	public ArrayList<Schedule> ajaxSelectAttSchedule(SqlSessionTemplate sqlSession, int loginNo) {
//		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxSelectAttSchedule", loginNo);
//	}
	public ArrayList<Schedule> ajaxSelectSchedule(SqlSessionTemplate sqlSession, int loginNo) {
		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxSelectSchedule", loginNo);
	}
	
	// 일정 상세 조회
	public Schedule ajaxSelectSchDetail(SqlSessionTemplate sqlSession, int schNo) {
		return sqlSession.selectOne("employeeMapper.ajaxSelectSchDetail", schNo);
	}
	public ArrayList<Schedule> ajaxSelectAttDetail(SqlSessionTemplate sqlSession, int schNo) {
		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxSelectAttDetail", schNo);
	}
	
	// 일정 수정
	public int deleteAttendee(SqlSessionTemplate sqlSession, int schNo) {
		return sqlSession.delete("employeeMapper.deleteAttendee", schNo);
	}
	public int updateAttendee(SqlSessionTemplate sqlSession, String[] attendance, int schNo) {
		int count = 0;
		for(String empNo : attendance) {
			Schedule s = new Schedule();
			s.setSchNo(schNo);
			s.setEmpNo(Integer.parseInt(empNo));
			count += sqlSession.insert("employeeMapper.updateAttendee", s);
		}
		return count;
	}
	public int updateSchedule(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.update("employeeMapper.updateSchedule", s);
	}
	
	// 일정 삭제
	public int ajaxDeleteSchedule(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.update("employeeMapper.ajaxDeleteSchedule", s);
	}
	
	// 사원 관리 - 조회 페이지
	public int selectEmployeeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("employeeMapper.selectEmployeeListCount");
	}
	public ArrayList<Employee> selectEmployeeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("employeeMapper.selectEmployeeList", null, rowBounds);
	}
	
	// 사원 관리 - 리스트 엑셀 변환
	public ArrayList<Employee> selectEmployeeAllList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("employeeMapper.selectEmployeeAllList");
	}
	
	// 사원 관리 - 상세 조회(ajax)
	public Employee ajaxSelectEmployee(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("employeeMapper.ajaxSelectEmployee", empNo);
	}

	// 사원 관리 - 상세 수정
	public int updateEmployeeDetail(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updateEmployeeDetail", e);
	}
	public int updateEmpProfileImg(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updateEmpProfileImg", e);
	}

	// 사원 등록
	public int insertEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.insert("employeeMapper.insertEmployee", e);
	}
	public int insertSchBasicGroup(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("employeeMapper.insertSchBasicGroup");
	}
	

	// 신입사원 근태등록
	public int adminInsertNewAttendence(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.insert("essMapper.adminInsertNewAttendence", empNo);
	}

	public int selectNewEmpNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("employeeMapper.selectNewEmpNo");
	}
	
	

	


	


}
