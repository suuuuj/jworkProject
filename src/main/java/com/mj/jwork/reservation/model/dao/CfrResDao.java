package com.mj.jwork.reservation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.reservation.model.vo.CfrReservation;

@Repository
public class CfrResDao {
	
	public int reserveCfr(SqlSessionTemplate sqlSession, CfrReservation cfrRes) {
		
		return sqlSession.insert("cfrMapper.reserveCfr",cfrRes);
	}

}
