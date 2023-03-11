package com.mj.jwork.ess.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.ess.model.vo.LeaveCategory;

@Repository
public class EssDao {

	public LeaveCategory selectLeaveCategory(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("essMapper.selectLeaveCategory", no);
	}
	
	
}
