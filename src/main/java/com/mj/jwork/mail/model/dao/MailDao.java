package com.mj.jwork.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.mail.model.vo.Mail;
import com.mj.jwork.mail.model.vo.MailAt;

@Repository
public class MailDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.selectOne("mailMapper.selectListCount", m);
		
	}
	
	public int selectUnReadListCount(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.selectOne("mailMapper.selectUnReadListCount", m);
		
	}
	
	public ArrayList<Mail> selectMailList(SqlSessionTemplate sqlSession, Mail m, PageInfo pi){
		
		int offset = pi.getBoardLimit() * (pi.getCurrentPage() - 1);
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectMailList", m, rowBounds);
		
	}
	
	public ArrayList<Mail> selectMailBoxList(SqlSessionTemplate sqlSession, int empNo){
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectMailBoxList", empNo);
		
	}
	
	public int updateMailBox(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.update("mailMapper.updateMailBox", m);
		
	}
	
	public int insertMailBox(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.insert("mailMapper.insertMailBox", m);
		
	}
	
	public Mail selectMailBox(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.selectOne("mailMapper.selectMailBox", m);
		
	}
	
	public int updateMailsWithMailBox(SqlSessionTemplate sqlSession, int mailBoxNo) {
		
		return sqlSession.update("mailMapper.updateMailsWithMailBox", mailBoxNo);
		
	}
	
	public int deleteMailBox(SqlSessionTemplate sqlSession, int mailBoxNo) {
		
		return sqlSession.delete("mailMapper.deleteMailBox", mailBoxNo);
		
	}
	
	public int moveMail(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.update("mailMapper.moveMail", m);
		
	}
	
	public int updateImportant(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.update("mailMapper.updateImportant", m);
		
	}
	
	public int sendMail(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.insert("mailMapper.sendMail", m);
		
	}
	
	public int insertMailDetail(SqlSessionTemplate sqlSession, Mail m) {
		
		if(sqlSession.insert("mailMapper.insertMailDetail", m) > 0) {
			return sqlSession.selectOne("mailMapper.selectThisMailNo");
		} else {
			return 0;
		}
		
	}
	
	public int insertMailAt(SqlSessionTemplate sqlSession, MailAt ma) {
		
		return sqlSession.insert("mailMapper.insertMailAt", ma);
		
	}
	
	public int updateMailRead(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.update("mailMapper.updateMailRead", m);
		
	}
	
	public Mail selectMail(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.selectOne("mailMapper.selectMail", m);
		
	}
	
	public int updateMail(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.update("mailMapper.updateMail", m);
		
	}
	
	public int deleteMailAt(SqlSessionTemplate sqlSession, int attachmentNo) {
		
		return sqlSession.delete("mailMapper.deleteMailAt", attachmentNo);
		
	}
	
	public int deleteMail(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.update("mailMapper.deleteMail", m);
		
	}
	
	public int cancelSend(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.update("mailMapper.cancelSend", m);
		
	}
	
	public int savedMailCount(SqlSessionTemplate sqlSession, int empNo) {
		
		return sqlSession.selectOne("mailMapper.savedMailCount", empNo);
		
	}
	
	public int countMailBoxMail(SqlSessionTemplate sqlSession, int mailBoxNo) {
		
		return sqlSession.selectOne("mailMapper.countMailBoxMail", mailBoxNo);
		
	}
	
	public Mail checkMailStatus(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.selectOne("mailMapper.checkMailStatus", m);
		
	}
	
	
}
