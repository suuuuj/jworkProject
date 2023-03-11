package com.mj.jwork.ess.model.vo;

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
public class Annual {
	
	private int annualNo; // 연차번호
	private int empNo; // 사원번호
	private int annualCount; // 발생및사용 휴가일수
	private String annualDate; // 발생및사용 날짜
	private String annualCategory; // 1:발생 2:사용
 	

}
