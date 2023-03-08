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

	
	 private String cfrName;
	 private int reservation;//예약자
	 private int status;
	 private String startTime;
	 private String endTime;
	 private String useDate;
}
