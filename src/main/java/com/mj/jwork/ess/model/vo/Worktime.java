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
public class Worktime {
	
	private int wtNo;
	private int attNo;
	private String reStartTime;
	private String reEndTime;
	private String reContent;
	
	// ATTEMDENCE 테이블이랑 JOIN할 애들
	private String startTime;
	private String endTime;
	private String attDate;

}
