package com.mj.jwork.reservation.model.service;

import java.util.ArrayList;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.reservation.model.vo.CfRoom;
import com.mj.jwork.reservation.model.vo.CfrReservation;

public interface CfrResService {
	
	//예약 등록 메소드
	int reserveCfr(CfrReservation cfrRes);
	
	//회의실 목록 조회 (회의실 예약 뿌리기용)
	ArrayList<CfRoom> selectNList();
	
	//내 예약 목록 조회 페이징
	int selectMyCfrListCount(int reservation);
	ArrayList<CfrReservation> selectMyCfrList(PageInfo pi,int reservation);

	// 일정 상세 조회
	CfrReservation selectMyCfr(int resNo);
	
	//전체 예약 목록
	ArrayList<CfrReservation> selectResList();
	
	//예약 취소 
	int deleteCfrRes(int resNo);
}
