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
public class Department {
	
	private int deptCode;
	private String deptName;
	private String status;
	
	private ArrayList<Team> teamList;

}
