package com.mj.jwork.reservation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.reservation.model.vo.CarReservation;

@Repository
public class CarResDao {
	
	public int insertReservation(SqlSessionTemplate sqlSession,CarReservation cRes) {
		
		
		return sqlSession.insert("carMapper.insertReservation",cRes);
	}
	
	public int selectMyResCount(SqlSessionTemplate sqlSession,int reservation) {
		
		return sqlSession.selectOne("carMapper.selectMyResCount");
	}
	
	public ArrayList<CarReservation> selectMyRes(SqlSessionTemplate sqlSession, PageInfo pi,int reservation){
		
		int offset= (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit= pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("carMapper.selectMyRes", reservation, rowBounds);
	}
}
