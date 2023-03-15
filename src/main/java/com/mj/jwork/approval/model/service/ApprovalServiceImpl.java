package com.mj.jwork.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.jwork.approval.model.dao.ApprovalDao;
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
	public int selectListCount(int empNo) {
		return aDao.selectListCount(sqlSession, empNo);
	}
	
	//결재문서 리스트
	@Override
	public ArrayList<Approval> selectMyApprovalList(PageInfo pi,int empNo) {
		return aDao.selectMyApprovalList(sqlSession,pi, empNo);
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
	
	//미결재문서 리스트 조회
	@Override
	public ArrayList<Approval> selectUnsignList(PageInfo pi, int empNo) {
		return aDao.selectUnsignList(sqlSession,pi, empNo);
	}

	




}
