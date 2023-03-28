package com.mj.jwork.reservation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.reservation.model.vo.CfRoom;
import com.mj.jwork.reservation.model.vo.CfrReservation;

@Repository
public class CfrResDao {
	
	public int reserveCfr(SqlSessionTemplate sqlSession, CfrReservation cfrRes) {
		
		return sqlSession.insert("cfrMapper.reserveCfr",cfrRes);
	}
	
	public ArrayList<CfRoom> selectNList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("cfrMapper.selectNList");
	}
	
	public int selectMyCfrListCount(SqlSessionTemplate sqlSession,int reservation) {
		
		return sqlSession.selectOne("cfrMapper.selectMyCfrListCount",reservation);
	}
	
	public ArrayList<CfrReservation>selectMyCfrList(SqlSessionTemplate sqlSession,PageInfo pi,int reservation){
		
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("cfrMapper.selectMyCfrList",reservation,rowBounds);
	}
	public CfrReservation selectMyCfr(SqlSessionTemplate sqlSession, int resNo) {
		
		return sqlSession.selectOne("cfrMapper.selectMyCfr",resNo);
	}
	
	public ArrayList<CfrReservation> selectResList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("cfrMapper.selectResList");
	}
	
	public int deleteCfrRes(SqlSessionTemplate sqlSession,int resNo) {
		
		return sqlSession.update("cfrMapper.deleteCfrRes",resNo);
	}
	
	public int updateCfrRes(SqlSessionTemplate sqlSession, CfrReservation c) {
		return sqlSession.update("cfrMapper.updateCfrRes",c);
	}
	
	public int updateStatus(SqlSessionTemplate sqlSession,String resNoArr) {
		
		return sqlSession.update("cfrMapper.updateStatus",resNoArr);
	}
	
	public ArrayList<CfrReservation> ajaxSelectTime(SqlSessionTemplate sqlSession, CfrReservation c){
		return (ArrayList)sqlSession.selectList("cfrMapper.ajaxSelectTime",c);
	}
	

	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("cfrMapper.selectResListCount");
	}
	
	public ArrayList<CfrReservation>selectPagingResList(SqlSessionTemplate sqlSession,PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("cfrMapper.selectResList2",null,rowBounds);
	}
	
	public ArrayList<CfrReservation> selectDetailRes(SqlSessionTemplate sqlSession,PageInfo pi, String cfrName){
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("cfrMapper.cfrDetailRes",cfrName,rowBounds);
	}
	
	public int cfrResListCount(SqlSessionTemplate sqlSession,String cfrName) {
		
		return sqlSession.selectOne("cfrMapper.cfrResListCount",cfrName);
	}
}