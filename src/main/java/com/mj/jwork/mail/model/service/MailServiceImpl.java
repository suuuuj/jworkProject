package com.mj.jwork.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.mail.model.dao.MailDao;
import com.mj.jwork.mail.model.vo.Mail;

@Service
public class MailServiceImpl implements MailService{
	
	@Autowired
	private MailDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectReceiveListCount(int empNo) {
		return mDao.selectReceiveListCount(sqlSession, empNo);
	}
	
	@Override
	public int selectUnReadReceiveCount(int empNo) {
		return mDao.selectUnReadReceiveCount(sqlSession, empNo);
	}


	@Override
	public ArrayList<Mail> selectReceiveMailList(int empNo, PageInfo pi) {
		return mDao.selectReceiveMailList(sqlSession, empNo, pi);
	}

	@Override
	public int insertMail(ArrayList<Mail> mList) {
		return 0;
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
