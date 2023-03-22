package com.mj.jwork.employee.model.vo;

import java.util.ArrayList;

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
public class Team {
	
	private int teamCode;
	private String teamName;
	private String status;
	private int deptCode;
	
	private ArrayList<Employee> empList;

}