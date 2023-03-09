package com.mj.jwork.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.reservation.model.dao.CarDao;
import com.mj.jwork.reservation.model.vo.Car;

@Service
public class CarServiceImpl implements CarService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Autowired
	private CarDao cDao;
	
	@Override
	public int insertCar(Car c) {
		return cDao.insertCar(sqlSession,c);
	}

	@Override
	public int selectListCount() {
		return cDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Car> selectList(PageInfo pi) {
		return cDao.selectList(sqlSession,pi);
	}

	@Override
	public int deleteCar(Car c) {
		return cDao.deleteCar(sqlSession,c);
	}

	@Override
	public Car selectCar(Car c) {
		return cDao.selectCar(sqlSession, c);
	}

}
