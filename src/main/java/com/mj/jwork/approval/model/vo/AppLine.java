package com.mj.jwork.approval.model.vo;

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
public class AppLine {
	
	 private int lineNo;
	 private int appNo;
	 private int empNo;
	 private int appLevel;
	 private String confirmStatus;
	 private String appDate;
	 private String reReason;
	 
	 private String empName;
	 private String jobName;

}
