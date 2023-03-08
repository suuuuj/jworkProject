package com.mj.jwork.project.model.vo;


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
public class ProjectEmp { //프로젝트 참여사원 테이블
	
	 private int projectNo;
	 private int projectEmp;
	 private int empLevel;//1,2,3
	 private String status;//승인상태

}
