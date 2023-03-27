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
	private String wtDate;
	private String reStartTime;
	private String reEndTime;
	private String reContent;
	private int approvalNo;
	private String approvalDate;
	private String approvalCheck;
	
	
	private int empNo;
	private String empName;
	private int deptCode;
	private String deptName;
	private int jobCode;
	private String jobName;
	private int teamCode;
	private String teamName;
	private String attDate;
	private String startTime;
	private String endTime;

}
