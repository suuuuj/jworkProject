package com.mj.jwork.reservation.model.service;

import java.util.ArrayList;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.reservation.model.vo.CarReservation;

public interface CarResService {
	
	
	//차량예약등록
	int insertReservation(CarReservation cRes);
	
	
	//나의 차량예약목록 조회
	int selectMyResCount(int resevation);
	ArrayList<CarReservation> selectMyRes(PageInfo pi,int resevation);
	
	//전체 예약 목록 조회
	int ajaxselectResCount(String option);
	ArrayList<CarReservation> ajaxselectResList(PageInfo pi,String option);
	ArrayList<CarReservation> selectResList();
	
	ArrayList<CarReservation> selectResList(CarReservation c);
	//차량예약상세조회
	
	CarReservation selectCarRes(int resNo);
	CarReservation ajaxselectCarRes(int resNo);
	//승인상태 변경
	int updateApStatus(CarReservation c);
}
