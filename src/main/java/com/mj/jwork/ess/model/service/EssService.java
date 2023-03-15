package com.mj.jwork.ess.model.service;

import java.util.ArrayList;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.ess.model.vo.Businesstrip;
import com.mj.jwork.ess.model.vo.Leave;
import com.mj.jwork.ess.model.vo.LeaveCategory;
import com.mj.jwork.ess.model.vo.Overtime;

public interface EssService {
	
	// 휴가 카테고리 조회 
	LeaveCategory selectLeaveCategory(int no); 
	
	// 휴가등록(insert)
	int insertLeave(Leave le);
	
	// 전체휴가목록조회(select)
	int selectLeaveListCount();
	ArrayList<Leave> selectLeaveList(PageInfo pi);
	
	// 시간외근무/출장등록(insert)
	int insertOvertime(Overtime o);
	int insertBusinesstrip(Businesstrip b);
	
	// 신청조회(select)
	int selectOvertimeListCount(int empNo);
	int selectBusinesstripListCount(int empNo);
	ArrayList<Overtime> selectOvertimeList(int empNo, PageInfo oPi);
	ArrayList<Businesstrip> selectBusinesstripList(int empNo, PageInfo bPi);
	
	// 시간외근근무/출장 삭제(delete)
	int deleteOvertime(int otNo);
	int deleteBusinesstrip(int btNo);
	
	// 관리자 : 시간외근무/출장 조회(select)
	int adminSelectOvertimeListCount();
	int adminSelectBusinesstripListCount();
	ArrayList<Overtime> adminSelectOvertimeList(PageInfo pi);
	ArrayList<Businesstrip> adminSelectBusinessList(PageInfo pi);
	
	
}
