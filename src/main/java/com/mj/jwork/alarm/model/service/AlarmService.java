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
	
	// 안읽은 메일 읽음 업데이트
	int updateRead(int alarmNo);
	
	// 알람들 삭제
	int deleteAlarms(int targetNo);
	
	// 발송취소한 메일 알람 삭제
	int deleteAlarm(Alarm a);
	
}
