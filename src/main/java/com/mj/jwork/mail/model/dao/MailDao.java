package com.mj.jwork.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.mail.model.vo.Mail;

@Repository
public class MailDao {
	
	public int selectReceiveListCount(SqlSessionTemplate sqlSession, int empNo) {
		
		return sqlSession.selectOne("mailMapper.selectReceiveListCount", empNo);
		
	}
	
	public int selectUnReadReceiveCount(SqlSessionTemplate sqlSession, int empNo) {
		
		return sqlSession.selectOne("mailMapper.selectUnReadReceiveCount", empNo);
		
	}
	
	public ArrayList<Mail> selectReceiveMailList(SqlSessionTemplate sqlSession, int empNo, PageInfo pi){
		
		int offset = pi.getBoardLimit() * (pi.getCurrentPage() - 1);
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectReceiveMailList", empNo, rowBounds);
		
	}
	
	
}
