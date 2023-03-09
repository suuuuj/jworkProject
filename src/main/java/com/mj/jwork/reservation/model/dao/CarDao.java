package com.mj.jwork.reservation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.reservation.model.vo.Car;

@Repository
public class CarDao {
	
	public int insertCar(SqlSessionTemplate sqlSession, Car c) {
		
		return sqlSession.insert("carMapper.insertCar",c);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("carMapper.selectListCount");
	}
	
	public ArrayList<Car> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1 )* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("carMapper.selectList", null, rowBounds);
	}
	
	public int deleteCar(SqlSessionTemplate sqlSession, Car c) {
		
		return sqlSession.delete("carMapper.deleteCar",c);
		
	}
	
	public Car selectCar(SqlSessionTemplate sqlSession,String carName) {
		
		return sqlSession.selectOne("carMapper.selectCar",carName);
	}

}
