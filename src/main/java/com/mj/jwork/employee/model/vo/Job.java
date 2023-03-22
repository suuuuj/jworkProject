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
public class Job {
	
	private int jobCode;
	private String jobName;
	private String status;

}
