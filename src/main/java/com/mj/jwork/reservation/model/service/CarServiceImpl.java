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
	public int deleteCar(String carName) {
		return cDao.deleteCar(sqlSession,carName);
	}

	@Override
	public Car selectCar(String carName) {
		return cDao.selectCar(sqlSession,carName);
	}

	@Override
	public ArrayList<Car> selectNList() {
		return cDao.selectNList(sqlSession);
	}

	@Override
	public int updateCar(Car c) {
		return cDao.updateCar(sqlSession,c);
	}

}
