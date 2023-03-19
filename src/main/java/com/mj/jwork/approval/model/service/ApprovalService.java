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
	
	
	
	
	//결재 문서 작성 서비스
	//int insertApproval(Approval a);
	
	//상신취소 서비스 (수정 후 재 결재)
	//int updateApproval(Approval a);
	
	//상신취소 서비스 (삭제)
	//int deleteApproval(int appNo);
	
	
	
	
	

}
