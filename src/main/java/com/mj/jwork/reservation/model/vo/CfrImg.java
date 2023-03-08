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
public class CfrImg {//회의실 상세이미지 테이블

	 private int fileNo;
	 private String cfrName;
	 private String fileUrl;
	 private String status;
}
