package com.mj.jwork.ess.model.vo;

import java.sql.Date;

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
public class Businesstrip {
	
	private int btNo; // 출장번호
	private int empNo; // 사원번호
	private String btStart; // 출장시작일
	private String btEnd; // 출장종료일
	private String btContent; // 출장내용
	private String btStatus; // 문서상태
	private String btCheck; // 결재현황
	private Date enrollDate; // 출장등록일
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

}
