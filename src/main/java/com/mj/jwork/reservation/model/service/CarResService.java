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
}
