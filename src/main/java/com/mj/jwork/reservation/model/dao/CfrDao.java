package com.mj.jwork.reservation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.reservation.model.vo.CfRoom;

@Repository
public class CfrDao {
	
	public int updateFirstImg(SqlSessionTemplate sqlSession, CfRoom cfr) {
		
		return sqlSession.update("cfrMapper.updateFirstImg",cfr);
	}
	
	public int enrollCfr(SqlSessionTemplate sqlSession,CfRoom cfr) {
		return sqlSession.insert("cfrMapper.enrollCfr",cfr);
	}
	
	public ArrayList<CfRoom> selectList(SqlSessionTemplate sqlSession,PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1 )* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("cfrMapper.selectList",null,rowBounds);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("cfrMapper.selectListCount");
	}
	
	public int deleteCfr(SqlSessionTemplate sqlSession,CfRoom cfr) {
		
		return sqlSession.delete("cfrMapper.deleteCfr",cfr);
	}
}
