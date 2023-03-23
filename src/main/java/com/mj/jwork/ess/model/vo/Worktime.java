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
public class Worktime {
	
	private int wtNo;
	private int attNo;
	private String reStartTime;
	private String reEndTime;
	private String reContent;

}
