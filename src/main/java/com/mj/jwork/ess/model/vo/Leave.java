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
public class Leave {
	
	private int leaveNo; // 휴가번호
	private int empNo; // 사워번호
	private String empName; // 사원이름
	private String deptName; // 부서이름
	private int leaveCategory; // 휴가구분번호 0:연차 1:조의(3) 2:산전후(90) 3:결혼(1) 4:결혼(3) 5:리프레쉬휴가 6:조의 7:산전후(120) 8:공가
	private String lcName; // 휴가이름
	private String leaveStart; // 휴가시작일
	private String leaveEnd; // 휴가종료일
	private String leaveContent; // 휴가내용
	private String leaveStatus; // 문서상태
	private String leaveCheck; // 결재현황
	private String enrollDate; // 휴가신청일
	private String firstDate; // 1차결재일
	private String secondDate; // 2차결재일
	private String failDate; // 반려일
	private int firstApproval; // 1차결재자사번
	private int secondApproval; // 2차결재자사번

}
