package com.mj.jwork.employee.model.vo;

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
public class Schedule {

	private int schNo;
	private int empNo;
	private String schTitle;
	private String schContent;
	private String schBegin;
	private String schEnd;
	private String timeBegin;
	private String timeEnd;
	private int groupNo;
	private String schPlace;
	private String createDate;
	private String modifyDate;
	private String status;
	
	private String groupName;
	private String groupColor;
	
	private int loginNo;	
	private int attendeeNo;
	
	private String[] attendance;

	
	
	
}
