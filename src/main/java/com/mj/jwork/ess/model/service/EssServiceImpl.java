package com.mj.jwork.ess.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.employee.model.vo.Employee;
import com.mj.jwork.ess.model.dao.EssDao;
import com.mj.jwork.ess.model.vo.Annual;
import com.mj.jwork.ess.model.vo.Businesstrip;
import com.mj.jwork.ess.model.vo.Leave;
import com.mj.jwork.ess.model.vo.LeaveCategory;
import com.mj.jwork.ess.model.vo.Overtime;

@Service
public class EssServiceImpl implements EssService {
	
	@Autowired
	private EssDao eDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

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
	public ArrayList<Leave> adminSelectLeaveList(PageInfo pi) {
		return eDao.adminSelectLeaveList(sqlSession, pi);
	}
	
	@Override
	public Leave adminLeaveDetail(int leaveNo) {
		return eDao.adminLeaveDetail(sqlSession, leaveNo);
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
	public int insertOvertime(Overtime o) {
		return eDao.insertOvertime(sqlSession, o);
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
	public ArrayList<Overtime> adminSelectOvertimeList(PageInfo pi) {
		return eDao.adminSelectOvertimeList(sqlSession, pi);
	}

	@Override
	public ArrayList<Businesstrip> adminSelectBusinesstripList(PageInfo pi) {
		return eDao.adminSelectBusinesstripList(sqlSession, pi);
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
	public Businesstrip adminSelectBusinesstrip(int btNo) {
		return eDao.adminSelectBusinesstrip(sqlSession, btNo);
	}

	@Override
	public Overtime adminSelectOvertime(int otNo) {
		return eDao.adminSelectOvertime(sqlSession, otNo);
	}

	@Override
	public int adminUpdateFirstBusinesstrip(Businesstrip b) {
		return eDao.adminUpdateFirstBusinesstrip(sqlSession, b);
	}

	@Override
	public int adminUpdateSecondBusinesstrip(Businesstrip b) {
		return eDao.adminUpdateSecondBusinesstrip(sqlSession, b);
	}

	@Override
	public int adminUpdateFirstOvertime(Overtime o) {
		return eDao.adminUpdateFirstOvertime(sqlSession, o);
	}

	@Override
	public int adminUpdateSecondOvertime(Overtime o) {
		return eDao.adminUpdateSecondOvertime(sqlSession, o);
	}

	@Override
	public int adminReturnBusinesstrip(int btNo) {
		return eDao.adminReturnBusinesstrip(sqlSession, btNo);
	}

	@Override
	public int adminReturnOvertime(int otNo) {
		return eDao.adminReturnOvertime(sqlSession, otNo);
	}





	

	
	
	

	

}
