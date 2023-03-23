package com.mj.jwork.alarm.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.alarm.model.vo.Alarm;

@Repository
public class AlarmDao {
	
	public int insertAlarm(SqlSessionTemplate sqlSession, Alarm a) {
		
		return sqlSession.insert("alarmMapper.insertAlarm", a);
		
	}
	
	public ArrayList<Alarm> selectAlarmList(SqlSessionTemplate sqlSession, int targetNo){
		
		return (ArrayList)sqlSession.selectList("alarmMapper.selectAlarmList", targetNo);
		
	}
	
	public int selectUnReadCount(SqlSessionTemplate sqlSession, int targetNo) {
		
		return sqlSession.selectOne("alarmMapper.selectUnReadCount", targetNo);
		
	}
	
}
