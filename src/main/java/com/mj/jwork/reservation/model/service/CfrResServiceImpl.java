package com.mj.jwork.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.reservation.model.dao.CfrResDao;
import com.mj.jwork.reservation.model.vo.CfRoom;
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


	@Override
	public ArrayList<CfRoom> selectNList() {
		return cRDao.selectNList(sqlSession);
	}


	@Override
	public int selectMyCfrListCount(CfrReservation cfrRes) {
		return cRDao.selectMyCfrListCount(sqlSession,cfrRes);
	}


	@Override
	public ArrayList<CfrReservation> selectMyCfrList(PageInfo pi,CfrReservation cfrRes) {
		return cRDao.selectMyCfrList(sqlSession,pi,cfrRes);
	}
	
	

}
