package com.mj.jwork.ess.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.employee.model.vo.Employee;
import com.mj.jwork.ess.model.dao.EssDao;
import com.mj.jwork.ess.model.vo.Annual;
import com.mj.jwork.ess.model.vo.Attendence;
import com.mj.jwork.ess.model.vo.Businesstrip;
import com.mj.jwork.ess.model.vo.Leave;
import com.mj.jwork.ess.model.vo.LeaveCategory;
import com.mj.jwork.ess.model.vo.Overtime;
import com.mj.jwork.ess.model.vo.Worktime;

@Service
public class EssServiceImpl implements EssService {
	
	@Autowired
	private EssDao eDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// -------------------- 메안패아자 -------------------
	@Override
	public Attendence selectAttendenceMain(int empNo) {
		return eDao.selectAttendenceMain(sqlSession, empNo);
	}

	// ------------- 휴가, 출장, 시간외근무 ---------------------
	@Override
	public Annual selectAnnualCount(int empNo) {
		return eDao.selectAnnualCount(sqlSession, empNo);
	}

	@Override
	public LeaveCategory selectLeaveCategory(int no) {
		return eDao.selectLeaveCategory(sqlSession, no);
	}

	@Override
	public int insertLeave(Leave le) {
		return eDao.insertLeave(sqlSession, le);
	}

	@Override
	public int updateAnuualCount(Leave le) {
		return eDao.updateAnuualCount(sqlSession, le);
	}
	
	@Override
	public int selectLeaveListCount(Employee e) {
		return eDao.selectLeaveListCount(sqlSession, e);
	}

	@Override
	public ArrayList<Leave> selectLeaveList(Employee e, PageInfo pi) {
		return eDao.selectLeaveList(sqlSession, e, pi);
	}
	
	@Override
	public Leave selectLeaveDetail(Leave le) {
		return eDao.selectLeaveDetail(sqlSession, le);
	}
	
	@Override
	public int deleteLeave(int leaveNo) {
		return eDao.deleteLeave(sqlSession, leaveNo);
	}

	@Override
	public int adminSelectLeaveListCount() {
		return eDao.adminSelectLeaveListCount(sqlSession);
	}

	@Override
	public ArrayList<Leave> adminSelectLeaveList(PageInfo pi, Employee e) {
		return eDao.adminSelectLeaveList(sqlSession, pi, e);
	}
	
	@Override
	public ArrayList<Leave> adminNoSelectLeaveList(PageInfo pi, Employee e) {
		return eDao.adminNoSelectLeaveList(sqlSession, pi, e);
	}
	
	@Override
	public Leave adminLeaveDetail(Leave le) {
		return eDao.adminLeaveDetail(sqlSession, le);
	}
	
	@Override
	public int adminFirstLeave(Leave le) {
		return eDao.adminFirstLeave(sqlSession, le);
	}

	@Override
	public int adminSecondLeave(Leave le) {
		return eDao.adminSecondLeave(sqlSession, le);
	}
	
	@Override
	public int updateAnnualCount(Leave le) {
		return eDao.updateAnuualCount(sqlSession,le);
	}
	
	@Override
	public int adminReturnLeave(int leaveNo) {
		return eDao.adminReturnLeave(sqlSession, leaveNo);
	}
	
	@Override
	public int adminAnnualListCount() {
		return eDao.adminAnnualListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Annual> adminAnnualList(PageInfo pi) {
		return eDao.adminAnnualList(sqlSession, pi);
	}

	@Override
	public Annual adminAnnualDetail(int empNo) {
		return eDao.adminAnnualDetail(sqlSession, empNo);
	}

	@Override
	public int adminUpdateYear() {
		return eDao.adminUpdateYear(sqlSession);
	}

	@Override
	public int adminUpdateMonth() {
		return eDao.adminUpdateMonth(sqlSession);
	}

	@Override
	public int adminInsertAnnual(int empNo) {
		return eDao.adminInsertAnnual(sqlSession, empNo);
	}
	
	@Override
	public ArrayList<Leave> adminSelectAllLeaveList() {
		return eDao.adminSelectAllLeaveList(sqlSession);
	}

	@Override
	public int insertOvertime(Overtime o) {
		return eDao.insertOvertime(sqlSession, o);
	}
	
	@Override
	public int insertOvertimeAll(Overtime o) {
		return eDao.insertOvertimeAll(sqlSession, o);
	}

	@Override
	public int insertBusinesstrip(Businesstrip b) {
		return eDao.insertBusinesstrip(sqlSession, b);
	}

	@Override
	public int selectOvertimeListCount(int empNo) {
		return eDao.selectOvertimeListCount(sqlSession, empNo);
	}

	@Override
	public int selectBusinesstripListCount(int empNo) {
		return eDao.selectBusinesstripListCount(sqlSession, empNo);
	}

	@Override
	public ArrayList<Overtime> selectOvertimeList(int empNo, PageInfo oPi) {
		return eDao.selectOvertimeList(sqlSession, empNo, oPi);
	}

	@Override
	public ArrayList<Businesstrip> selectBusinesstripList(int empNo, PageInfo bPi) {
		return eDao.selectBusinesstripList(sqlSession, empNo, bPi);
	}

	@Override
	public int deleteOvertime(int otNo) {
		return eDao.deleteOvertime(sqlSession, otNo);
	}

	@Override
	public int deleteBusinesstrip(int btNo) {
		return eDao.deleteBusinesstrip(sqlSession, btNo);
	}

	@Override
	public int adminSelectOvertimeListCount() {
		return eDao.adminSelectOvertimeListCount(sqlSession);
	}

	@Override
	public int adminSelectBusinesstripListCount() {
		return eDao.adminSelectBusinesstripListCount(sqlSession);
	}

	@Override
	public ArrayList<Overtime> adminSelectOvertimeList(PageInfo pi, Employee e) {
		return eDao.adminSelectOvertimeList(sqlSession, pi, e);
	}

	@Override
	public ArrayList<Businesstrip> adminSelectBusinesstripList(PageInfo pi, Employee e) {
		return eDao.adminSelectBusinesstripList(sqlSession, pi, e);
	}

	@Override
	public Businesstrip selectBusinesstrip(int btNo) {
		return eDao.selectBusinesstrip(sqlSession, btNo);
	}

	@Override
	public Overtime selectOvertime(int otNo) {
		return eDao.selectOvertime(sqlSession, otNo);
	}

	@Override
	public Businesstrip adminSelectBusinesstrip(Businesstrip b) {
		return eDao.adminSelectBusinesstrip(sqlSession, b);
	}

	@Override
	public Overtime adminSelectOvertime(Overtime o) {
		return eDao.adminSelectOvertime(sqlSession, o);
	}

	@Override
	public int adminFirstBusinesstrip(Businesstrip b) {
		return eDao.adminFirstBusinesstrip(sqlSession, b);
	}

	@Override
	public int adminSecondBusinesstrip(Businesstrip b) {
		return eDao.adminSecondBusinesstrip(sqlSession, b);
	}

	@Override
	public int adminFirstOvertime(Overtime o) {
		return eDao.adminFirstOvertime(sqlSession, o);
	}

	@Override
	public int adminSecondOvertime(Overtime o) {
		return eDao.adminSecondOvertime(sqlSession, o);
	}

	@Override
	public int adminReturnBusinesstrip(int btNo) {
		return eDao.adminReturnBusinesstrip(sqlSession, btNo);
	}

	@Override
	public int adminReturnOvertime(int otNo) {
		return eDao.adminReturnOvertime(sqlSession, otNo);
	}
	
	@Override
	public ArrayList<Overtime> adminSelectOvertimeListNo(PageInfo pi, Employee e) {
		return eDao.adminSelectOvertimeListNo(sqlSession, pi, e);
	}

	@Override
	public ArrayList<Businesstrip> adminSelectBusinesstripListNo(PageInfo pi, Employee e) {
		return eDao.adminSelectBusinesstripListNo(sqlSession, pi, e);
	}
	
	@Override
	public int adminUpdateReset() {
		return eDao.adminUpdateReset(sqlSession);
	}
	
	@Override
	public int adminSelectOvertimeNoListCount(Employee e) {
		return eDao.adminSelectOvertimeNoListCount(sqlSession, e);
	}

	@Override
	public int adminSelectBusinesstripNoListCount(Employee e) {
		return eDao.adminSelectBusinesstripNoListCount(sqlSession, e);
	}
	
	// ---------------- 근태 ---------------------------

	@Override
	public int adminInsertAttendence() {
		return eDao.adminInsertAttendence(sqlSession);
	}

	@Override
	public int insertStartAttendence(int attNo) {
		return eDao.insertStartAttendence(sqlSession, attNo);
	}
	
	@Override
	public int insertEndAttendence(int attNo) {
		return eDao.insertEndAttendence(sqlSession, attNo);
	}

	@Override
	public Attendence selectAttendence(Attendence a) {
		return eDao.selectAttendence(sqlSession, a);
	}

	@Override
	public int selectAttendenceListCount(Attendence a) {
		return eDao.selectAttendenceListCount(sqlSession, a);
	}

	@Override
	public ArrayList<Attendence> selectAttendenceList(PageInfo pi, Attendence a) {
		return eDao.selectAttendenceList(sqlSession, pi, a);
	}

	@Override
	public int insertAllAttendenceTime(int attNo) {
		return eDao.insertAllAttendenceTime(sqlSession, attNo);
	}

	@Override
	public int insertModifyStartTime(Worktime w) {
		return eDao.insertModifyStartTime(sqlSession, w);
	}

	@Override
	public int insertModifyEndTime(Worktime w) {
		return eDao.insertModifyEndTime(sqlSession, w);
	}

	@Override
	public int updateStartTime(Worktime w) {
		return eDao.updateStartTime(sqlSession, w);
	}

	@Override
	public int updateEndTime(Worktime w) {
		return eDao.updateEndTime(sqlSession, w);
	}

	@Override
	public int insertModifyWorktime(Worktime w) {
		return eDao.insertModifyWorktime(sqlSession, w);
	}

	@Override
	public int updateWorktime(Worktime w) {
		return eDao.updateWorktime(sqlSession, w);
	}

	@Override
	public ArrayList<Attendence> workCalendarAttendence(int empNo) {
		return eDao.workCalendarAttendence(sqlSession, empNo);
	}

	@Override
	public ArrayList<Businesstrip> workCalendarBusinesstrip(int empNo) {
		return eDao.workCalendarBusinesstrip(sqlSession, empNo);
	}

	@Override
	public ArrayList<Overtime> workCalendarOvertime(int empNo) {
		return eDao.workCalendarOvertime(sqlSession, empNo);
	}

	@Override
	public Attendence selectWeekWorktime(int empNo) {
		return eDao.selectWeekWorktime(sqlSession, empNo);
	}

	@Override
	public Attendence selectMonthWorktime(int empNo) {
		return eDao.selectMonthWorktime(sqlSession, empNo);
	}

	@Override
	public Overtime selectWeekOvertime(int empNo) {
		return eDao.selectWeekOvertime(sqlSession, empNo);
	}

	@Override
	public ArrayList<Worktime> selectModifyWorktimeList(PageInfo pi, Worktime w) {
		return eDao.selectModifyWorktimeList(sqlSession, pi, w);
	}

	@Override
	public int selectModifyWorktimeListCount(Worktime w) {
		return eDao.selectModifyWorktimeListCount(sqlSession, w);
	}

	@Override
	public Worktime selectModifyDetailWorktime(int wtNo) {
		return eDao.selectModifyDetailWorktime(sqlSession, wtNo);
	}

	@Override
	public int adminSelectModifyWorktimeListCount() {
		return eDao.adminSelectModifyWorktimeListCount(sqlSession);
	}

	@Override
	public ArrayList<Worktime> adminSelectModifyWorktimeList(PageInfo pi, Employee e) {
		return eDao.adminSelectModifyWorktimeList(sqlSession, pi, e);
	}

	@Override
	public int adminModifyWorktimeReturn(int wtNo) {
		return eDao.adminModifyWorktimeReturn(sqlSession, wtNo);
	}

	@Override
	public int adminModifyWorktimeSubmit(Worktime w) {
		return eDao.adminModifyWorktimeSubmit(sqlSession, w);
	}

	@Override
	public Worktime adminSelectAttendence(int wtNo) {
		return eDao.adminSelectAttendence(sqlSession, wtNo);
	}

	@Override
	public int ajaxAllAttendenceListCount(Attendence a) {
		return eDao.ajaxAllAttendenceListCount(sqlSession,a);
	}

	@Override
	public ArrayList<Attendence> ajaxAllAttendenceList(PageInfo pi, Attendence a) {
		return eDao.ajaxAllAttendenceList(sqlSession, pi,a);
	}
	
	@Override
	public Leave selectSignedLeave(int leaveNo) {
		return eDao.selectSignedLeave(sqlSession, leaveNo);
	}

	@Override
	public Businesstrip selectSignedBusinesstrip(int btNo) {
		return eDao.selectSignedBusinesstrip(sqlSession, btNo);
	}

	@Override
	public Overtime selectSignedOvertime(int otNo) {
		return eDao.selectSignedOvertime(sqlSession, otNo);
	}

	@Override
	public Attendence selectWeekRemainWorktime(int empNo) {
		return eDao.selectWeekRemainWorktime(sqlSession, empNo);
	}

	public Worktime selectSignedWorktime(int wtNo) {
		return eDao.selectSignedWorktime(sqlSession, wtNo);
	}

	@Override
	public int selectAttendenceDateListCount(Attendence a) {
		return eDao.selectAttendenceDateListCount(sqlSession, a);
	}

	@Override
	public ArrayList<Attendence> selectAttendenceDateList(PageInfo api, Attendence a) {
		return eDao.selectAttendenceDateList(sqlSession, api, a);
	}

	@Override
	public int ajaxAllAttendenceDateListCount(Attendence a) {
		return eDao.ajaxAllAttendenceDateListCount(sqlSession, a);
	}

	@Override
	public ArrayList<Attendence> ajaxAllAttendenceDateList(PageInfo pi, Attendence a) {
		return eDao.ajaxAllAttendenceDateList(sqlSession, pi, a);
	}

	@Override
	public int ajaxDeleteWorktime(Worktime w) {
		return eDao.ajaxDeleteWorktime(sqlSession, w);
	}


	

	






	

	
	
	

	

}
