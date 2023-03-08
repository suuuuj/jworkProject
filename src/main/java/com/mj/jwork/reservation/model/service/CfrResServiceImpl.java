package com.mj.jwork.reservation.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.jwork.reservation.model.dao.CfrResDao;
import com.mj.jwork.reservation.model.vo.CfrReservation;

@Service
public class CfrResServiceImpl implements CfrResService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Autowired
	private CfrResDao cRDao;


	@Override
	public int reserveCfr(CfrReservation cfrRes) {
		return cRDao.reserveCfr(sqlSession, cfrRes);
	}
	
	

}
