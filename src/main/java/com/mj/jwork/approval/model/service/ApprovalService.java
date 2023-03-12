package com.mj.jwork.approval.model.service;

import java.util.ArrayList;

import com.mj.jwork.approval.model.vo.Approval;
import com.mj.jwork.common.model.vo.PageInfo;

public interface ApprovalService{
	
	//내결재목록 리스트 조회 서비스 (페이징)
	int selectListCount(int empNo);
	ArrayList<Approval> selectMyApprovalList(PageInfo pi,int empNo);
	
	//내결재목록 진행 버튼 클릭 (ajax)
	ArrayList<Approval> ajaxSelectIngBtn(PageInfo pi,int empNo);
	
	//결재 문서 작성 서비스
	int insertApproval(Approval a);
	
	//결재문서 상세 조회 서비스
	Approval selectApproval(int appNo);
	
	//상신취소 서비스 (수정 후 재 결재)
	int updateApproval(Approval a);
	
	//상신취소 서비스 (삭제)
	int deleteApproval(int appNo);
	
	
	
	

}
