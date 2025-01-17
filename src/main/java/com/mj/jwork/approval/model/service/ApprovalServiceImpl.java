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
	public int selectUnsignListCount(Approval a) {
		return aDao.selectUnsignListCount(sqlSession, a);
	}
	
	//미결재문서 리스트 조회
	@Override
	public ArrayList<Approval> selectUnsignList(PageInfo pi, Approval a) {
		return aDao.selectUnsignList(sqlSession,pi, a);
	}
	
	//결재문서 카운팅
	@Override
	public int selectSignListCount(int empNo) {
		return aDao.selectSignListCount(sqlSession, empNo);
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

	//상신취소 문서 삭제하기
	@Override
	public int deleteApproval(int appNo) {
		return aDao.deleteApproval(sqlSession, appNo);
	}
	
	//승인 버튼 눌렀을때
	@Override
	public int signBtn(AppLine al) {
		return aDao.signBtn(sqlSession,al);
	}
	//승인 올라가면 문서상태
	@Override
	public int signStatus(int appNo) {
		return aDao.signStatus(sqlSession,appNo);
	}

	//반려버튼 눌렀을때
	@Override
	public int returnBtn(AppLine al) {
		return aDao.returnBtn(sqlSession,al);
	}
	@Override
	public int returnStatus(int appNo) {
		return aDao.returnStatus(sqlSession,appNo);
	}

	//임시저장
	@Override
	public int saveApproval(Approval a) {
		return aDao.saveApproval(sqlSession,a);
	}

	//새문서 insert
	@Override
	public int insertNewApp(Approval a) {
		
		//System.out.println(a.getAlist());
		//return aDao.insertNewApp(sqlSession,a);
		
		
		int result1 = aDao.insertNewApp(sqlSession,a);
		
		//System.out.println("result1 : " + result1);
		
		int result2 = aDao.insertNewAppLine(sqlSession,a);
		//System.out.println("result2 : " + result2);
		int result3 = 1;
		 
		if (a.getRlist() != null && a.getRlist().size()>0) {
	        result3 = aDao.insertNewRefLine(sqlSession,a);
	   }
		
		return result1*result2*result3; 
	}
	
	//상신취소, 임시저장form에서의 임시저장
	@Override
	public int resaveApproval(Approval a) {
		return aDao.resaveApproval(sqlSession,a);
	}
	
	//기존 결재선, 참조선 삭제
	@Override
	public int deleteLine(Approval a) {
		
		int result1 = aDao.deleteAppLine(sqlSession,a);
		int result2 = aDao.deleteRefLine(sqlSession,a);
		
		return result1*result2;
	}
	
	// 임시저장문서 결재
	@Override
	public int insertDrafbox(Approval a) {
		
		int result1 = aDao.insertDrafbox(sqlSession,a);
		
		//System.out.println("result1 : " + result1);
		
		int result2 = aDao.reinsertAppLine(sqlSession,a);
		//System.out.println("result2 : " + result2);
		int result3 = 1;
		 
		if (a.getRlist() != null && a.getRlist().size()>0) {
	        result3 = aDao.reinsertRefLine(sqlSession,a);
	   }
		
		return result1*result2*result3; 
	}

	//상신취소 재결재
	@Override
	public int reinsertApp(Approval a) {
		
		int result1 = aDao.insertCancleApp(sqlSession,a);
		
		int result2 = aDao.reinsertAppLine(sqlSession,a);
		
		int result3 = 1;
		 
		if (a.getRlist() != null && a.getRlist().size()>0) {
	        result3 = aDao.reinsertRefLine(sqlSession,a);
	   }
		
		
		return result1*result2*result3;
	}
	
	// 새로 생성된 문서 번호 가져오기
	@Override
	public int selectCurrentAppNo() {
		return aDao.selectCurrentAppNo(sqlSession);
	}
	
	// 알람보낼 정보 가져오기
	@Override
	public Approval selectAppInfo(int newAppNo) {
		return aDao.selectAppInfo(sqlSession, newAppNo);
	}

	//참조문서 카운트
	@Override
	public int selectRefListCount(int empNo) {
		return aDao.selectRefListCount(sqlSession, empNo);
	}
	 //참조문서 리스트 조회
	@Override
	public ArrayList<Approval> selectRefList(PageInfo pi, int empNo) {
		return aDao.selectRefList(sqlSession,pi, empNo);
	}
	

	

	



}
