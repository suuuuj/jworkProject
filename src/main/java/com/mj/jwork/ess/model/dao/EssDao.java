package com.mj.jwork.ess.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.ess.model.vo.Businesstrip;
import com.mj.jwork.ess.model.vo.Leave;
import com.mj.jwork.ess.model.vo.LeaveCategory;
import com.mj.jwork.ess.model.vo.Overtime;

@Repository
public class EssDao {

	public LeaveCategory selectLeaveCategory(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("essMapper.selectLeaveCategory", no);
	}
	
	public int insertLeave(SqlSession sqlSession, Leave le) {
		return sqlSession.insert("essMapper.insertLeave", le);
	}
	
	public int selectLeaveListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("essMapper.selectLeaveListCount");
	}
	
	public ArrayList<Leave> selectLeaveList(SqlSession sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("essMapper.selectLeaveList", null, rowBounds);
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
	
	public ArrayList<Overtime> adminSelectOvertimeList(SqlSession sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("essMapper.adminSelectOvertimeList", null, rowBounds);
	}
	
	public ArrayList<Businesstrip> adminSelectBusinesstripList(SqlSession sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("essMapper.adminSelectBusinesseList", null, rowBounds);
	}
	
	
	
	
}
