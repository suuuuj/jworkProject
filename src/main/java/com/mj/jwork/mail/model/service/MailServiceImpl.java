package com.mj.jwork.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.mail.model.dao.MailDao;
import com.mj.jwork.mail.model.vo.Mail;
import com.mj.jwork.mail.model.vo.MailAt;

@Service
public class MailServiceImpl implements MailService{
	
	@Autowired
	private MailDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount(Mail m) {
		return mDao.selectListCount(sqlSession, m);
	}
	
	@Override
	public int selectUnReadListCount(Mail m) {
		return mDao.selectUnReadListCount(sqlSession, m);
	}


	@Override
	public ArrayList<Mail> selectMailList(Mail m, PageInfo pi) {
		return mDao.selectMailList(sqlSession, m, pi);
	}
	
	@Override
	public ArrayList<Mail> selectMailBoxList(int empNo) {
		return mDao.selectMailBoxList(sqlSession, empNo);
	}
	
	@Override
	public int updateMailBox(Mail m) {
		return mDao.updateMailBox(sqlSession, m);
	}
	
	@Override
	public int insertMailBox(Mail m) {
		return mDao.insertMailBox(sqlSession, m);
	}

	@Override
	public Mail selectMailBox(Mail m) {
		return mDao.selectMailBox(sqlSession, m);
	}

	@Override
	public int updateMailsWithMailBox(int mailBoxNo) {
		return mDao.updateMailsWithMailBox(sqlSession, mailBoxNo);
	}

	@Override
	public int deleteMailBox(int mailBoxNo) {
		return mDao.deleteMailBox(sqlSession, mailBoxNo);
	}
	
	@Override
	public int moveMail(Mail m) {
		return mDao.moveMail(sqlSession, m);
	}
	
	@Override
	public int updateImportant(Mail m) {
		return mDao.updateImportant(sqlSession, m);
	}
	
	@Override
	public int sendMail(Mail m) {
		return mDao.sendMail(sqlSession, m);
	}

	@Override
	public int insertMailDetail(Mail m) {
		return mDao.insertMailDetail(sqlSession, m);
	}
	
	@Override
	public int insertMailAt(MailAt ma) {
		return mDao.insertMailAt(sqlSession, ma);
	}
	
	@Override
	public int updateMailSend(ArrayList<Mail> mList) {
		return 0;
	}

	@Override
	public int updateMailBox(ArrayList<Mail> mList) {
		return 0;
	}

	@Override
	public int updateMailTrash(ArrayList<Mail> mList) {
		return 0;
	}

	@Override
	public int deleteMail(ArrayList<Mail> mList) {
		return 0;
	}

	@Override
	public Mail selectMail(int mailNo) {
		return null;
	}

	

	

	

	


	

	


	
}
