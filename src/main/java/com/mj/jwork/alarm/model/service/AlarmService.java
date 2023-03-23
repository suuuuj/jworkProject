package com.mj.jwork.alarm.model.service;

import java.util.ArrayList;

import com.mj.jwork.alarm.model.vo.Alarm;

public interface AlarmService {
	
	// 알람 테이블에 insert
	int insertAlarm(Alarm a);
	
	// 알람 리스트 조회
	ArrayList<Alarm> selectAlarmList(int targetNo);
	
	// 안읽은 알람 갯수
	int selectUnReadCount(int targetNo);
	
}
