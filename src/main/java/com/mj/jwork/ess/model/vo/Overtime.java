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
public class Overtime {
	
	private int otNo; // 시간외근무번호
	private int empNo; // 사원번호
	private String enrollDate; // 시간외근무등록일
	private String otCategory; // 0:시간외근무 1:야간 2:주말
	private String otStart;
	private String otEnd;
	private String otContent;
	private String otStatus; // Y / N
	private String otCheck; // 0:결제대기(1차) 1:결재대기(2차) 2:승인 3:반려
	private String firstDate; // 1차결재일
	private String secondDate; // 2차결재일
	private String failDate; // 반려일
	private int firstApproval; // 1차결재자사번
	private int secondApproval; // 2차결재자사번
	
	private String empName;
	private String deptName;
	private String jobName;
	private int jobCode;
	private int deptCode;
	private int teamCode;
	private String teamName;
	
	private String weektime;
	
}
