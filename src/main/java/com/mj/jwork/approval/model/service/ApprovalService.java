package com.mj.jwork.approval.model.service;

import java.util.ArrayList;

import com.mj.jwork.approval.model.vo.Approval;
import com.mj.jwork.common.model.vo.PageInfo;

public interface ApprovalService{
	
	//내결재목록 리스트 조회 서비스 (페이징)
	int selectListCount();
	ArrayList<Approval> selectMyApprovalList(PageInfo pi);
	
	//결재 문서 작성 서비스
	
	//결재문서 상세 조회 서비스
	
	//상신취소 서비스 (수정 후 재 결재)
	
	//상신취소 서비스 (삭제)
	
	
	
	

}