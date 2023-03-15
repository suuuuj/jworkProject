package com.mj.jwork.reservation.model.vo;

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
public class CfrReservation {//회의실 예약 테이블

	 private int resNo;
	 private String cfrName;
	 private int reservation;//예약자
	 private int status;//1/2/3/4 | 예약완료/미예약/ 취소완료 / 이용완료
	 private String startTime;
	 private String endTime;
	 private String useDate;
	 private int capacity;
	 private String cfTitle;
}
