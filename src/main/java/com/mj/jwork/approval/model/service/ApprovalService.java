package com.mj.jwork.approval.model.service;

import java.util.ArrayList;

import com.mj.jwork.approval.model.vo.AppLine;
import com.mj.jwork.approval.model.vo.Approval;
import com.mj.jwork.common.model.vo.PageInfo;

public interface ApprovalService{
	
	//내결재목록 버튼 클릭 (ajax)
	int selectListCount(Approval a);
	ArrayList<Approval> ajaxSelectBtn(PageInfo pi,Approval a);
	
	//결재문서 상세 조회 서비스
	Approval selectApproval(int appNo);
	ArrayList<AppLine> selectAppLine(int appNo);
	
	//미결재문서 리스트 조회
	int selectUnsignListCount(int empNo);
	ArrayList<Approval> selectUnsignList(PageInfo pi, int empNo);
	
	//결재문서 리스트 조회
	int selectSignListCount(int empNo);
	ArrayList<Approval> selectSignList(PageInfo pi, int empNo);
	
	//임시저장함 리스트 조회
	int selectdraftListCount(int empNo);
	ArrayList<Approval> selectdraftList(PageInfo pi, int empNo);
	
	//상신취소 문서 삭제하기
	int deleteApproval(int appNo);
	
	//승인 버튼 눌렀을때
	int signBtn(AppLine al);
	//승인 올라가면 문서상태
	int signStatus(int appNo);
	
	//반려버튼 눌렀을때
	int returnBtn(AppLine al);
	int returnStatus(int appNo);
	
	//문서 insert 임시저장
	int saveApproval(Approval a);
	
	//새문서 insert
	int insertNewApp(Approval a);
	
	//상신취소, 임시저장form에서의 임시저장
	int resaveApproval(Approval a);
	
	
	
	
	
	
	//상신취소 서비스 (수정 후 재 결재)
	//int updateApproval(Approval a);
	
	
	
	
	
	

}
