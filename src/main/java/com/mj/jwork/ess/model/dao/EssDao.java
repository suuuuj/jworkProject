package com.mj.jwork.ess.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.employee.model.vo.Employee;
import com.mj.jwork.ess.model.vo.Annual;
import com.mj.jwork.ess.model.vo.Attendence;
import com.mj.jwork.ess.model.vo.Businesstrip;
import com.mj.jwork.ess.model.vo.Leave;
import com.mj.jwork.ess.model.vo.LeaveCategory;
import com.mj.jwork.ess.model.vo.Overtime;
import com.mj.jwork.ess.model.vo.Worktime;

@Repository
public class EssDao {

	public LeaveCategory selectLeaveCategory(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("essMapper.selectLeaveCategory", no);
	}
	
	public int insertLeave(SqlSession sqlSession, Leave le) {
		return sqlSession.insert("essMapper.insertLeave", le);
	}
	
	public int selectLeaveListCount(SqlSession sqlSession, Employee e) {
		return sqlSession.selectOne("essMapper.selectLeaveListCount", e);
	}
	
	public ArrayList<Leave> selectLeaveList(SqlSession sqlSession, Employee e, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("essMapper.selectLeaveList", e, rowBounds);
	}
	
	public Leave selectLeaveDetail(SqlSession sqlSession, Leave le) {
		return sqlSession.selectOne("essMapper.selectLeaveDetail", le);
	}
	
	public int deleteLeave(SqlSession sqlSession, int leaveNo) {
		return sqlSession.update("essMapper.deleteLeave",leaveNo);
	}
	
	public int adminSelectLeaveListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("essMapper.adminSelectLeaveListCount");
	}
	
	public ArrayList<Leave> adminSelectLeaveList(SqlSession sqlSession, PageInfo pi, Employee e){

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("essMapper.adminSelectLeaveList", e, rowBounds);
	}
	
	public Leave adminLeaveDetail(SqlSession sqlSession, Leave le) {
		return sqlSession.selectOne("essMapper.adminLeaveDetail", le);
	}
	
	public int insertOvertime(SqlSession sqlSession, Overtime o) {
		return sqlSession.insert("essMapper.insertOvertime", o);
	}
	
	public int insertBusinesstrip(SqlSession sqlSession, Businesstrip b) {
		return sqlSession.insert("essMapper.insertBusinesstrip", b);
	}
	
	public int selectOvertimeListCount(SqlSession sqlSession, int empNo) {
		return sqlSession.selectOne("essMapper.selectOvertimeListCount", empNo);
	}
	
	public int selectBusinesstripListCount(SqlSession sqlSession, int empNo) {
		return sqlSession.selectOne("essMapper.selectBusinesstripListCount", empNo);
	}
	
	public ArrayList<Overtime> selectOvertimeList(SqlSession sqlSession, int empNo, PageInfo oPi){
		
		int offset = (oPi.getCurrentPage() - 1) * oPi.getBoardLimit();
		int limit = oPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("essMapper.selectOvertimeList", empNo, rowBounds);
	}
	
	public ArrayList<Businesstrip> selectBusinesstripList(SqlSession sqlSession, int empNo, PageInfo bPi){
		
		int offset = (bPi.getCurrentPage() - 1) * bPi.getBoardLimit();
		int limit = bPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("essMapper.selectBusinesstripList", empNo, rowBounds);
	}
	
	public int deleteOvertime(SqlSession sqlSession, int otNo) {
		return sqlSession.update("essMapper.deleteOvertime", otNo);
	}
	
	public int deleteBusinesstrip(SqlSession sqlSession, int btNo) {
		return sqlSession.update("essMapper.deleteBusinesstrip", btNo);
	}
	
	public int adminSelectOvertimeListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("essMapper.adminSelectOvertimeListCount");
	}
	
	public int adminSelectBusinesstripListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("essMapper.adminSelectBusinesstripListCount");
	}
	
	public ArrayList<Overtime> adminSelectOvertimeList(SqlSession sqlSession, PageInfo pi, Employee e){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("essMapper.adminSelectOvertimeList", e, rowBounds);
	}
	
	public ArrayList<Businesstrip> adminSelectBusinesstripList(SqlSession sqlSession, PageInfo pi, Employee e){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("essMapper.adminSelectBusinessetripList", e, rowBounds);
	}
	
	public Businesstrip selectBusinesstrip(SqlSession sqlSession, int btNo) {
		return sqlSession.selectOne("essMapper.selectBusinesstrip", btNo);
	}
	
	public Overtime selectOvertime(SqlSession sqlSession, int otNo) {
		return sqlSession.selectOne("essMapper.selectOvertime", otNo);
	}
	
	public Businesstrip adminSelectBusinesstrip(SqlSession sqlSession, Businesstrip b) {
		return sqlSession.selectOne("essMapper.adminSelectBusinesstrip", b);
	}
	
	public Overtime adminSelectOvertime(SqlSession sqlSession, Overtime o) {
		return sqlSession.selectOne("essMapper.adminSelectOvertime", o);
	}
	
	public int adminFirstBusinesstrip(SqlSession sqlSession, Businesstrip b) {
		return sqlSession.update("essMapper.adminFirstBusinesstrip", b);
	}
	
	public int adminSecondBusinesstrip(SqlSession sqlSession, Businesstrip b) {
		return sqlSession.update("essMapper.adminSecondBusinesstrip", b);
	}
	
	public int adminFirstOvertime(SqlSession sqlSession, Overtime o) {
		return sqlSession.update("essMapper.adminFirstOvertime", o);
	}
	
	public int adminSecondOvertime(SqlSession sqlSession, Overtime o) {
		return sqlSession.update("essMapper.adminSecondOvertime", o);
	}
	
	public int adminReturnBusinesstrip(SqlSession sqlSession, int btNo) {
		return sqlSession.update("essMapper.adminReturnBusinesstrip", btNo);
	}
	
	public int adminReturnOvertime(SqlSession sqlSession, int otNo) {
		return sqlSession.update("essMapper.adminReturnOvertime", otNo);
	}
	
	public int adminReturnLeave(SqlSession sqlSession, int leaveNo) {
		return sqlSession.update("essMapper.adminReturnLeave", leaveNo);
	}
	
	public int adminAnnualListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("essMapper.adminAnnualListCount");
	}
	
	public ArrayList<Annual> adminAnnualList(SqlSession sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("essMapper.adminAnnualList", null, rowBounds);
	}
	
	public Annual adminAnnualDetail(SqlSession sqlSession, int empNo) {
		return sqlSession.selectOne("essMapper.adminAnnualDeatil", empNo);
	}
	
	public int adminUpdateYear(SqlSession sqlSession) {
		return sqlSession.insert("essMapper.adminUpdateYear");
	}
	
	public int adminInsertAnnual(SqlSession sqlSession, int empNo) {
		return sqlSession.insert("essMapper.adminInsertAnnual", empNo);
	}
	
	public int adminUpdateMonth(SqlSession sqlSession) {
		return sqlSession.insert("essMapper.adminUpdateMonth");
	}
	
	public Annual selectAnnualCount(SqlSession sqlSession, int empNo) {
		return sqlSession.selectOne("essMapper.selectAnnualCount", empNo);
	}
	
	public int updateAnuualCount(SqlSession sqlSession, Leave le) {
		return sqlSession.insert("essMapper.updateAnuualCount", le);
	}
	
	public ArrayList<Leave> adminSelectAllLeaveList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("essMapper.adminSelectAllLeaveList");
	}
	
	public int adminFirstLeave(SqlSession sqlSession ,Leave le) {
		return sqlSession.update("essMapper.adminFirstLeave", le);
	}
	
	public int adminSecondLeave(SqlSession sqlSession, Leave le) {
		return sqlSession.update("essMapper.adminSecondLeave", le);
	}
	
	public int adminInsertAttendence(SqlSession sqlSession) {
		return sqlSession.insert("essMapper.adminInsertAttendence");
	}
	
	public Attendence selectAttendenceMain(SqlSession sqlSession, int empNo) {
		return sqlSession.selectOne("essMapper.selectAttendenceMain", empNo);
	}
	
	public int insertStartAttendence(SqlSession sqlSession, Attendence a) {
		return sqlSession.update("essMapper.insertStartAttendence", a);
	}
	
	public int insertEndAttendence(SqlSession sqlSession, Attendence a) {
		return sqlSession.update("essMapper.insertEndAttendence", a);
	}
	
	public Attendence selectAttendence(SqlSession sqlSession, Attendence a) {
		return sqlSession.selectOne("essMapper.selectAttendence", a);
	}
	
	public int selectAttendenceListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("essMapper.selectAttendenceListCount");
	}
	
	public ArrayList<Attendence> selectAttendenceList(SqlSession sqlSession, PageInfo pi, int empNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("essMapper.selectAttendenceList", empNo, rowBounds);
	}
	
	public int insertAllAttendenceTime(SqlSession sqlSession, int attNo) {
		return sqlSession.update("essMapper.insertAllAttendenceTime", attNo);
	}
	
	public int insertModifyStartTime(SqlSession sqlSession, Worktime w) {
		return sqlSession.insert("essMapper.insertModifyStartTime", w);
	}
	
	public int insertModifyEndTime(SqlSession sqlSession, Worktime w) {
		return sqlSession.insert("essMapper.insertModifyEndTime", w);
	}
	
	public int updateStartTime(SqlSession sqlSession, Worktime w) {
		return sqlSession.update("essMapper.updateStartTime", w);
	}
	
	public int updateEndTime(SqlSession sqlSession, Worktime w) {
		return sqlSession.update("essMapper.updateEndTime", w);
	}
	
	public int insertModigfyWorktime(SqlSession sqlSession, Worktime w) {
		return sqlSession.insert("essMapper.insertModigfyWorktime", w);
	}
	
	public int updateWorktime(SqlSession sqlSession, Worktime w) {
		return sqlSession.update("essMapper.updateWorktime", w);
	}
	
	public int insertOvertimeAll(SqlSession sqlSession, Overtime o) {
		return sqlSession.update("essMapper.insertOvertimeAll", o);
	}
	
	public ArrayList<Attendence> workCalendarAttendence(SqlSession sqlSession, int empNo){
		return (ArrayList)sqlSession.selectList("essMapper.workCalendarAttendence" , empNo);
	}
	
	public ArrayList<Businesstrip> workCalendarBusinesstrip(SqlSession sqlSession, int empNo){
		return (ArrayList)sqlSession.selectList("essMapper.workCalendarBusinesstrip" , empNo);
	}
	
	public ArrayList<Overtime> workCalendarOvertime(SqlSession sqlSession, int empNo){
		return (ArrayList)sqlSession.selectList("essMapper.workCalendarOvertime" , empNo);
	}
	
	public Attendence selectWeekWorktime(SqlSession sqlSession, int empNo) {
		return sqlSession.selectOne("essMapper.selectWeekWorktime", empNo);
	}
	
	public Attendence selectMonthWorktime(SqlSession sqlSession, int empNo) {
		return sqlSession.selectOne("essMapper.selectMonthWorktime", empNo);
	}
	
	public Overtime selectWeekOvertime(SqlSession sqlSession, int empNo) {
		return sqlSession.selectOne("essMapper.selectWeekOvertime", empNo);
	}
	
	public ArrayList<Leave> adminNoSelectLeaveList(SqlSession sqlSession, PageInfo pi, Employee e){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("essMapper.adminNoSelectLeaveList", e, rowBounds);
	}
	
	public ArrayList<Worktime> selectModifyWorktimeList(SqlSession sqlSession, PageInfo pi, int empNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("essMapper.selectModifyWorktimeList", empNo, rowBounds);
	}
	
	public int selectModifyWorktimeListCount(SqlSession sqlSession, int empNo) {
		return sqlSession.selectOne("essMapper.selectModifyWorktimeList", empNo);
	}
	
	public Leave selectSignedLeave(SqlSession sqlSession, int leaveNo) {
		
		return sqlSession.selectOne("essMapper.selectSignedLeave", leaveNo);
		
	}
	
	public Businesstrip selectSignedBusinesstrip(SqlSession sqlSession, int btNo) {
		
		return sqlSession.selectOne("essMapper.selectSignedBusinesstrip", btNo);
		
	}
	
	public Overtime selectSignedOvertime(SqlSession sqlSession, int otNo) {
		
		return sqlSession.selectOne("essMapper.selectSignedOvertime", otNo);
		
	}
	
}
