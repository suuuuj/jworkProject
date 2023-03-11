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
	

	@Override
	public int selectListCount() {
		return aDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Approval> selectMyApprovalList(PageInfo pi) {
		return aDao.selectMyApprovalList(sqlSession,pi);
	}
	
	@Override
	public ArrayList<Approval> ajaxSelectAllBtn(PageInfo pi) {
		return aDao.ajaxSelectAllBtn(sqlSession,pi);
	}

	@Override
	public ArrayList<Approval> ajaxSelectIngBtn(PageInfo pi) {
		return aDao.ajaxSelectIngBtn(sqlSession,pi);
	}
	

	@Override
	public int insertApproval(Approval a) {
		return 0;
	}

	@Override
	public Approval selectApproval(int appNo) {
		return null;
	}

	@Override
	public int updateApproval(Approval a) {
		return 0;
	}

	@Override
	public int deleteApproval(int appNo) {
		return 0;
	}




}
