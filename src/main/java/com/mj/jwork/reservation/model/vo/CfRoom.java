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
public class CfRoom {//회의실 테이블

	 private String cfrName;
	 private String cfrImg;
	 private int capacity;
	 private String equipment;
}
