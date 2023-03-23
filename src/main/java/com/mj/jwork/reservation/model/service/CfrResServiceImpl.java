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
	public int selectMyCfrListCount(int reservation) {
		return cRDao.selectMyCfrListCount(sqlSession,reservation);
	}


	@Override
	public ArrayList<CfrReservation> selectMyCfrList(PageInfo pi,int reservation) {
		return cRDao.selectMyCfrList(sqlSession,pi,reservation);
	}


	@Override
	public CfrReservation selectMyCfr(int resNo) {
		return cRDao.selectMyCfr(sqlSession,resNo);
	}


	@Override
	public ArrayList<CfrReservation> selectResList() {
		return cRDao.selectResList(sqlSession);
	}


	@Override
	public int deleteCfrRes(int resNo) {
		return cRDao.deleteCfrRes(sqlSession,resNo);
	}


	@Override
	public int updateCfrRes(CfrReservation c) {
		return cRDao.updateCfrRes(sqlSession, c);
	}


	@Override
	public int updateStatus(String resNoArr) {
		return cRDao.updateStatus(sqlSession, resNoArr);
	}
	
	

}
