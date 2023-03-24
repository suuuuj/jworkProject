package com.mj.jwork.ess.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Attendence {
	
	private int attNo; // 근태번호
	private int empNo; // 사원번호
	private String startTime; // 출근시간
	private String endTime; // 퇴근시간
	private String attTime; // 총근무시간
	private String attStatus; // 근무상태 0:정상 1:지각 2:조퇴 3:결근 4:휴가 5:출장 ( default : 3(결근) )
	private String attDate; // 근무날짜
	private String afterTime; // 연장시간
	private String weekTime;
	private String monthTime;

}
