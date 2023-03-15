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
}