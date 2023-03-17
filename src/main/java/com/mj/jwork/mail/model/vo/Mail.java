package com.mj.jwork.mail.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Mail {
	
	// 메일 메인 테이블
	private int mailNo;
	private int senderNo;
	private String sender;
	private String receiver;
	private String mailTitle;
	private String mailContent;
	private String registerDate;
	private String send;
	
	// 메일 상세 테이블
	private int mailBoxNo;
	private int empNo;
	private String empName;
	private String read;
	private String readDate;
	private String important;
	private String type;
	private String status;
	
	// 메일함 정보 테이블
	private String mailBoxName;
	
	// 메일 조회 카테고리
	private String mailCategory;
	
	// 전송시 받을 수신자 사원번호들(,로 연결)
	private String receiverNo;
	
	// 첨부파일 갯수(유무파악)
	private int attachment;
	
	// 보낸메일함의 경우 단체메일을 한번에 담기위해
	private ArrayList<Mail> mailList; // 1대 N 관계
	
}
