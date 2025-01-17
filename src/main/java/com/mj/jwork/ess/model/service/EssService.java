package com.mj.jwork.ess.model.service;

import java.util.ArrayList;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.employee.model.vo.Employee;
import com.mj.jwork.ess.model.vo.Annual;
import com.mj.jwork.ess.model.vo.Attendence;
import com.mj.jwork.ess.model.vo.Businesstrip;
import com.mj.jwork.ess.model.vo.Leave;
import com.mj.jwork.ess.model.vo.LeaveCategory;
import com.mj.jwork.ess.model.vo.Overtime;
import com.mj.jwork.ess.model.vo.Worktime;

public interface EssService {
	
	// ----------------휴가, 출장, 시간외근무 ------------------------------------
	// 휴가 메인페이지 잔여휴가
	Annual selectAnnualCount(int empNo);
	
	// 휴가 카테고리 조회 
	LeaveCategory selectLeaveCategory(int no); 
	
	// 휴가등록(insert)
	int insertLeave(Leave le);
	int updateAnuualCount(Leave le);
	
	// 전체휴가목록조회(select)
	int selectLeaveListCount(Employee e);
	ArrayList<Leave> selectLeaveList(Employee e,PageInfo pi);
	
	// 휴가상세조회(select)
	Leave selectLeaveDetail(Leave le);
	
	// 휴가신청삭제(update)
	int deleteLeave(int leaveNo);
	
	// 관리자 : 휴가전체조회(select)
	int adminSelectLeaveListCount();
	ArrayList<Leave> adminSelectLeaveList(PageInfo pi, Employee e);
	ArrayList<Leave> adminNoSelectLeaveList(PageInfo pi, Employee e);
	
	// 관리자 : 휴가상세조회
	Leave adminLeaveDetail(Leave le);
	
	// 관리자 : 휴가 1차,2차결재
	int adminFirstLeave(Leave le);
	int adminSecondLeave(Leave le);
	int updateAnnualCount(Leave le);
	
	// 관리자 : 휴가결재선 반려
	int adminReturnLeave(int leaveNo);
	
	// 관리자 : 연차등록
	int adminInsertAnnual(int empNo);
	int adminUpdateYear();
	int adminUpdateMonth();
	
	// 관리자 : 연차리셋
	int adminUpdateReset();
	
	// 관리자 : 연차전체조회
	int adminAnnualListCount();
	ArrayList<Annual> adminAnnualList(PageInfo pi);
	
	// 관리자 : 연차상세조회
	Annual adminAnnualDetail(int empNo);
	
	// 관리자 : 전체휴가캘린더조회
	ArrayList<Leave> adminSelectAllLeaveList(); 
	
	// 시간외근무/출장등록(insert)
	int insertOvertime(Overtime o);
	int insertOvertimeAll(Overtime o);
	int insertBusinesstrip(Businesstrip b);
	
	// 신청조회(select)
	int selectOvertimeListCount(int empNo);
	int selectBusinesstripListCount(int empNo);
	ArrayList<Overtime> selectOvertimeList(int empNo, PageInfo oPi);
	ArrayList<Businesstrip> selectBusinesstripList(int empNo, PageInfo bPi);
	
	// 신청상세조회(select)
	Businesstrip selectBusinesstrip(int btNo);
	Overtime selectOvertime(int otNo);
	
	// 시간외근근무/출장 삭제(delete)
	int deleteOvertime(int otNo);
	int deleteBusinesstrip(int btNo);
	
	// 관리자 : 시간외근무/출장 조회(select)
	int adminSelectOvertimeListCount();
	int adminSelectBusinesstripListCount();
	int adminSelectOvertimeNoListCount(Employee e);
	int adminSelectBusinesstripNoListCount(Employee e);
	ArrayList<Overtime> adminSelectOvertimeList(PageInfo pi, Employee e);
	ArrayList<Overtime> adminSelectOvertimeListNo(PageInfo pi, Employee e);
	ArrayList<Businesstrip> adminSelectBusinesstripList(PageInfo pi, Employee e);
	ArrayList<Businesstrip> adminSelectBusinesstripListNo(PageInfo pi, Employee e);
	
	// 관리자 : 시간외근무/출장 상세조회(select)
	Businesstrip adminSelectBusinesstrip(Businesstrip b);
	Overtime adminSelectOvertime(Overtime o);
	
	// 관리자 : 시간외근무/출장 결재선(update)
	int adminFirstBusinesstrip(Businesstrip b);
	int adminSecondBusinesstrip(Businesstrip b);
	int adminFirstOvertime(Overtime o);
	int adminSecondOvertime(Overtime o);
	
	// 관리자 : 시간외근무/출장 결재선 반려(update)
	int adminReturnBusinesstrip(int btNo);
	int adminReturnOvertime(int otNo);
	
	// ------------------- 근태 ------------------------------------
	// 근태 스케줄링
	int adminInsertAttendence();
	
	// 메인페이지 근태버튼
	Attendence selectAttendenceMain(int empNo);
	
	// 출퇴근시간 insert
	int insertStartAttendence(int attNo);
	int insertEndAttendence(int attNo);
	int insertAllAttendenceTime(int attNo);
	
	// 출퇴근 전체조회
	int selectAttendenceListCount(Attendence a);
	ArrayList<Attendence> selectAttendenceList(PageInfo pi, Attendence a);
	int selectAttendenceDateListCount(Attendence a);
	ArrayList<Attendence> selectAttendenceDateList(PageInfo api, Attendence a);
	
	// 출퇴근 상세조회
	Attendence selectAttendence(Attendence a);
	
	// 출퇴근시간수정
	int insertModifyStartTime(Worktime w);
	int insertModifyEndTime(Worktime w);
	int updateStartTime(Worktime w);
	int updateEndTime(Worktime w);
	int insertModifyWorktime(Worktime w);
	int updateWorktime(Worktime w);
	
	// 출퇴근시간수정리스트
	int selectModifyWorktimeListCount(Worktime w);
	ArrayList<Worktime> selectModifyWorktimeList(PageInfo pi, Worktime w);
	
	// 근태수정상세조회
	Worktime selectModifyDetailWorktime(int wtNo);
	
	// 근태현황 캘린더조회
	ArrayList<Attendence> workCalendarAttendence(int empNo);
	ArrayList<Businesstrip> workCalendarBusinesstrip(int empNo);
	ArrayList<Overtime> workCalendarOvertime(int empNo);
	Attendence selectWeekWorktime(int empNo);
	Attendence selectMonthWorktime(int empNo);
	Attendence selectWeekRemainWorktime(int empNo);
	Overtime selectWeekOvertime(int empNo);
	
	// 관리자 : 근태수정리스트조회
	int adminSelectModifyWorktimeListCount();
	ArrayList<Worktime> adminSelectModifyWorktimeList(PageInfo pi, Employee e);
	
	// 관리자 : 근태수정리스트상세조회
	Worktime adminSelectAttendence(int wtNo);
	
	// 관리자 : 근태수정 승인/반려
	int adminModifyWorktimeSubmit(Worktime w);
	int adminModifyWorktimeReturn(int wtNo);
	
	// 관리자 : 전사원 근태조회
	int ajaxAllAttendenceListCount(Attendence a);
	ArrayList<Attendence> ajaxAllAttendenceList(PageInfo pi, Attendence a);
	int ajaxAllAttendenceDateListCount(Attendence a);
	ArrayList<Attendence> ajaxAllAttendenceDateList(PageInfo pi, Attendence a);
	
	// 관리자 : 출퇴근시간변경리스트 삭제 
	int ajaxDeleteWorktime(Worktime w);
	
	// ------------------------------ 알람 -----------------------------------
	// 휴가 최종 승인 후 휴가정보 	불러오기
	Leave selectSignedLeave(int leaveNo);
	
	// 출장 최종 승인 후 출장 정보 불러오기
	Businesstrip selectSignedBusinesstrip(int btNo);
	
	// 시간외근무 최종 승인 후 시간외근무 정보 불러오기
	Overtime selectSignedOvertime(int otNo);
	
	// 출퇴근 시간 변경 승인 후 근태정보 불러오기
	Worktime selectSignedWorktime(int wtNo);
	
	
	
	
	
}
