package com.mj.jwork.reservation.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class CarReservation {//차량예약테이블
	
	 private int resNo;
	 private String carName;
	 private String reservation;//예약자
	 private Date requestDate;//신청을 보낸 날짜
	 private String apDate;//승인일
	 private int apStatus;//승인상태
	 private int approver;//승인자
	 private String resDate;//예약날짜
	 private String startTime;
	 private String endTime;
	 private String cause;//사유
}
