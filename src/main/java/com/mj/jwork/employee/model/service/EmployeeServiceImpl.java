package com.mj.jwork.employee.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.employee.model.dao.EmployeeDao;
import com.mj.jwork.employee.model.vo.Department;
import com.mj.jwork.employee.model.vo.Employee;
import com.mj.jwork.employee.model.vo.Job;
import com.mj.jwork.employee.model.vo.Schedule;
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
	
	// 메일 사원번호 입력시 사원조회 서비스 (ajax)
	@Override
	public Employee selectEmployee(int empNo) {
		return eDao.selectEmployee(sqlSession, empNo);
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
	
	// 개인 주소록 검색
	@Override
	public int selectAddressOutSearchCount(HashMap<String, Object> map) {
		return eDao.selectAddressOutSearchCount(sqlSession, map);
	}
	@Override
	public ArrayList<Employee> selectAddressOutSearchList(HashMap<String, Object> map, PageInfo pi) {
		return eDao.selectAddressOutSearchList(sqlSession, map, pi);
	}
	
	// 개인 주소록 즐겨찾기
	@Override
	public int ajaxInsertAddressOutFav(Employee e) {
		return eDao.ajaxInsertAddressOutFav(sqlSession, e);
	}
	
	// 개인 주소록 즐겨찾기 해제
	@Override
	public int ajaxDeleteAddressOutFav(Employee e) {
		return eDao.ajaxDeleteAddressOutFav(sqlSession, e);
	}
	
	// 주소록 그룹 조회(ajax)
	@Override
	public ArrayList<Employee> ajaxSelectAddressGroup(int empNo) {
		return eDao.ajaxSelectAddressGroup(sqlSession, empNo);
	}
	
	// 주소록 그룹 수정 - 조회(ajax)
	@Override
	public Employee ajaxSelectAddGroupName(int groupNo) {
		return eDao.ajaxSelectAddGroupName(sqlSession, groupNo);
	}
	// 주소록 그룹 수정
	@Override
	public int updateAddGroupName(Employee e) {
		return eDao.updateAddGroupName(sqlSession, e);
	}
	
	// 주소록 그룹 삭제
	@Override
	public int ajaxDeleteAddGroup(int groupNo) {
		return eDao.ajaxDeleteAddGroup(sqlSession, groupNo);
	}
	@Override
	public int ajaxUpdateAddoutGrNo(int groupNo) {
		return eDao.ajaxUpdateAddoutGrNo(sqlSession, groupNo);
	}
	
	// 주소록 그룹 추가
	@Override
	public int insertAddressGroup(Employee e) {
		return eDao.insertAddressGroup(sqlSession, e);
	}
	
	// 주소록 연락처 추가
	@Override
	public int insertAddressOut(Employee e) {
		return eDao.insertAddressOut(sqlSession, e);
	}
	@Override
	public int insertAddressOutFav(Employee e) {
		return eDao.insertAddressOutFav(sqlSession, e);
	}
	
	// 즐겨찾기된 사내 주소록 리스트 조회
	@Override
	public int favAddressInListCount(int loginNo) {
		return eDao.favAddressInListCount(sqlSession, loginNo);
	}
	@Override
	public ArrayList<Employee> ajaxFavAddressInList(int loginNo, PageInfo iPi) {
		return eDao.ajaxFavAddressInList(sqlSession, loginNo, iPi);
	}
	
	// 주소록 연락처 삭제
	@Override
	public int deleteAddressOut(int addoutNo) {
		return eDao.deleteAddressOut(sqlSession, addoutNo);
	}
	
	// 즐겨찾기된 개인 주소록 리스트 조회
	@Override
	public int favAddressOutListCount(int loginNo) {
		return eDao.favAddressOutListCount(sqlSession, loginNo);
	}
	@Override
	public ArrayList<Employee> ajaxFavAddressOutList(int loginNo, PageInfo oPi) {
		return eDao.ajaxFavAddressOutList(sqlSession, loginNo, oPi);
	}
	
	// 캘린더 그룹 조회
	@Override
	public ArrayList<Employee> ajaxSelectSchGroup(int loginNo) {
		return eDao.ajaxSelectSchGroup(sqlSession, loginNo);
	}
	
	// 캘린더 그룹 수정 - 조회(ajax)
	@Override
	public Employee ajaxSelectSchGroupName(int groupNo) {
		return eDao.ajaxSelectSchGroupName(sqlSession, groupNo);
	}
	// 캘린더 그룹 수정
	@Override
	public int updateSchGroupName(Employee e) {
		return eDao.updateSchGroupName(sqlSession, e);
	}
	
	// 캘린더 그룹 삭제
	@Override
	public int ajaxDeleteSchGroup(int groupNo) {
		return eDao.ajaxDeleteSchGroup(sqlSession, groupNo);
	}
	@Override
	public int ajaxUpdateSchGrNo(int groupNo) {
		return eDao.ajaxUpdateSchGrNo(sqlSession, groupNo);
	}
	
	// 캘린더 그룹 추가
	@Override
	public int insertSchGroup(Employee e) {
		return eDao.insertSchGroup(sqlSession, e);
	}

	// 부서 관리 - 부서 추가
	@Override
	public int insertDept(Department d) {
		return eDao.insertDept(sqlSession, d);
	}
	
	// 부서 관리 - 부서 삭제
	@Override
	public int ajaxDeleteDept(int deptCode) {
		return eDao.ajaxDeleteDept(sqlSession, deptCode);
	}
	
	// 부서관리 - 팀 추가
	@Override
	public int insertTeam(Team t) {
		return eDao.insertTeam(sqlSession, t);
	}
	
	// 부서 관리 - 팀 삭제
	@Override
	public int ajaxDeleteTeam(int teamCode) {
		return eDao.ajaxDeleteTeam(sqlSession, teamCode);
	}
	
	// 부서 관리 - 직급 조회
	@Override
	public ArrayList<Job> ajaxSelectJobList() {
		return eDao.ajaxSelectJobList(sqlSession);
	}
	
	// 부서 관리 - 직급 추가
	@Override
	public int insertJob(Job j) {
		return eDao.insertJob(sqlSession, j);
	}
	
	// 부서 관리 - 직급 삭제
	@Override
	public int ajaxDeleteJob(int jobCode) {
		return eDao.ajaxDeleteJob(sqlSession, jobCode);
	}
	
	// 조직도 조회
	@Override
	public ArrayList<Department> selectEmployeeChart() {
		return eDao.selectEmployeeChart(sqlSession);
	}
	
	// 일정 등록
	@Override
	public int insertSchedule(Schedule s) {
		return eDao.insertSchedule(sqlSession, s);
	}
	// 일정 등록 - 참석자 추가
	@Override
	public int insertAttendee(String[] attendance) {
		return eDao.insertAttendee(sqlSession, attendance);
	}
	
	// 주소록 - 조직도 조회
	@Override
	public ArrayList<Employee> ajaxAddressInChart() {
		return eDao.ajaxAddressInChart(sqlSession);
	}

	//결재자 추가
	@Override
	public Employee addSigner(int empNo) {
		return eDao.addSigner(sqlSession, empNo);
	}
	
	// 일정 조회
//	@Override
//	public ArrayList<Schedule> ajaxSelectMySchedule(int loginNo) {
//		return eDao.ajaxSelectMySchedule(sqlSession, loginNo);
//	}
//	@Override
//	public ArrayList<Schedule> ajaxSelectAttSchedule(int loginNo) {
//		return eDao.ajaxSelectAttSchedule(sqlSession, loginNo);
//	}
	@Override
	public ArrayList<Schedule> ajaxSelectSchedule(int loginNo) {
		return eDao.ajaxSelectSchedule(sqlSession, loginNo);
	}
	
	// 일정 상세 조회
	@Override
	public Schedule ajaxSelectSchDetail(int schNo) {
		return eDao.ajaxSelectSchDetail(sqlSession, schNo);
	}
	@Override
	public ArrayList<Schedule> ajaxSelectAttDetail(int schNo) {
		return eDao.ajaxSelectAttDetail(sqlSession, schNo);
	}

	// 일정 수정
	@Override
	public int deleteAttendee(int schNo) {
		return eDao.deleteAttendee(sqlSession, schNo);
	}
	@Override
	public int updateAttendee(String[] attendance, int schNo) {
		return eDao.updateAttendee(sqlSession, attendance, schNo);
	}
	@Override
	public int updateSchedule(Schedule s) {
		return eDao.updateSchedule(sqlSession, s);
	}

	@Override
	public int ajaxDeleteSchedule(Schedule s) {
		return eDao.ajaxDeleteSchedule(sqlSession, s);
	}

	// 사원 관리 - 조회 페이지
	@Override
	public int selectEmployeeListCount() {
		return eDao.selectEmployeeListCount(sqlSession);
	}
	@Override
	public ArrayList<Employee> selectEmployeeList(PageInfo pi) {
		return eDao.selectEmployeeList(sqlSession, pi);
	}
	
	// 사원 관리 - 리스트 엑셀 변환
	@Override
	public ArrayList<Employee> selectEmployeeAllList() {
		return eDao.selectEmployeeAllList(sqlSession);
	}
	
	// 사원 관리 - 상세 조회(ajax)
	@Override
	public Employee ajaxSelectEmployee(int empNo) {
		return eDao.ajaxSelectEmployee(sqlSession, empNo);
	}

	// 사원 관리 - 상세 수정
	@Override
	public int updateEmployeeDetail(Employee e) {
		return eDao.updateEmployeeDetail(sqlSession, e);
	}
	@Override
	public int updateEmpProfileImg(Employee e) {
		return eDao.updateEmpProfileImg(sqlSession, e);
	}

	// 사원 등록
	@Override
	public int insertEmployee(Employee e) {
		return eDao.insertEmployee(sqlSession, e);
	}
	@Override
	public int insertSchBasicGroup() {
		return eDao.insertSchBasicGroup(sqlSession);
	}

	// 신입사원근태등록
	@Override
	public int adminInsertNewAttendence(int empNo) {
		return eDao.adminInsertNewAttendence(sqlSession, empNo);
	}

	



}
