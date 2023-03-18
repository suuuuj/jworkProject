package com.mj.jwork.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.jwork.approval.model.dao.ApprovalDao;
import com.mj.jwork.approval.model.vo.AppLine;
import com.mj.jwork.approval.model.vo.Approval;
import com.mj.jwork.common.model.vo.PageInfo;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ApprovalDao aDao;
	
	// 결재문서 카운트
	@Override
	public int selectListCount(Approval a) {
		return aDao.selectListCount(sqlSession, a);
	}
	
	//결재문서 리스트 버튼 클릭시
	@Override
	public ArrayList<Approval> ajaxSelectBtn(PageInfo pi,Approval a) {
		return aDao.ajaxSelectBtn(sqlSession,pi, a);
	}
	
	//결재문서 상세조회
	@Override
	public Approval selectApproval(int appNo) {
		return aDao.selectApproval(sqlSession, appNo);
	}
	
	//결재문서 결재선 조회
	@Override
	public ArrayList<AppLine> selectAppLine(int appNo) {
		return aDao.selectAppLine(sqlSession, appNo);
	}
	
	//미결재문서 카운팅
	@Override
	public int selectUnsignListCount(int empNo) {
		return aDao.selectUnsignListCount(sqlSession, empNo);
	}
	
	//미결재문서 리스트 조회
	@Override
	public ArrayList<Approval> selectUnsignList(PageInfo pi, int empNo) {
		return aDao.selectUnsignList(sqlSession,pi, empNo);
	}
	
	//결재문서 카운팅
	@Override
	public int selectSignListCount(int empNo) {
		return aDao.selectUnsignListCount(sqlSession, empNo);
	}
	
	
	// 결재문서 리스트 조회
	@Override
	public ArrayList<Approval> selectSignList(PageInfo pi, int empNo) {
		return aDao.selectSignList(sqlSession,pi, empNo);
	}

	//임시저장함 카운트
	@Override
	public int selectdraftListCount(int empNo) {
		return aDao.selectdraftListCount(sqlSession, empNo);
	}

	//임시저장함 리스트 조회
	@Override
	public ArrayList<Approval> selectdraftList(PageInfo pi, int empNo) {
		return aDao.selectdraftList(sqlSession,pi, empNo);
	}

	




}
