package com.mj.jwork.alarm.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.jwork.alarm.model.dao.AlarmDao;
import com.mj.jwork.alarm.model.vo.Alarm;

@Service
public class AlarmServiceImpl implements AlarmService{
	
	@Autowired
	private AlarmDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertAlarm(Alarm a) {
		return aDao.insertAlarm(sqlSession, a);
	}

	@Override
	public ArrayList<Alarm> selectAlarmList(int targetNo) {
		return aDao.selectAlarmList(sqlSession, targetNo);
	}

	@Override
	public int selectUnReadCount(int targetNo) {
		return aDao.selectUnReadCount(sqlSession, targetNo);
	}

}
