package com.mj.jwork.mail.model.service;

import java.util.ArrayList;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.mail.model.vo.Mail;

public interface MailService {
	
	// 받은 메일 리스트 조회
	int selectReceiveListCount(int empNo);
	int selectUnReadReceiveCount(int empNo);
	ArrayList<Mail> selectReceiveMailList(int empNo, PageInfo pi);
	
	// 메일 작성
	int insertMail(ArrayList<Mail> mList);
	
	// 메일 수정(임시저장 => 보내기)
	int updateMailSend(ArrayList<Mail> mList);
	
	// 메일 이동
	int updateMailBox(ArrayList<Mail> mList);
	
	// 메일 휴지통
	int updateMailTrash(ArrayList<Mail> mList);
	
	// 메일 영구삭제
	int deleteMail(ArrayList<Mail> mList);
	
	// 메일 상세조회
	Mail selectMail(int mailNo);
	
}
