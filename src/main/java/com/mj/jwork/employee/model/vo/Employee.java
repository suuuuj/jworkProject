package com.mj.jwork.employee.model.vo;

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
public class Employee {

	private int empNo;
	private String empPwd;
	private String empName;
	private String gender;
	private String phone;
	private String email;
	private String birth;
	private int deptCode;
	private int teamCode;
	private int jobCode;
	private String empPhone;
	private String enrollDate;
	private String resignDate;
	private String modifyDate;
	private String profileUrl;
	private String task;
	private String status;
	private String accountStatus;
	
	private String deptName;
	private String teamName;
	private String jobName;
	
	private String empFav;
	private String addoutFav;
	private String dateFav;
	
	private int addoutNo;
	private String name;
	private String bizName;
	private String dept;
	private String job;
	private String bizPhone;
	private String memo;
	private int groupNo;
	private String groupName;
	
	private int loginNo;
	private int checkStar;
	private int group;
	private String groupColor;
	
	
}
