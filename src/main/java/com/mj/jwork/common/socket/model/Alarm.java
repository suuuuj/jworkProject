package com.mj.jwork.common.socket.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Alarm {
	
	private int alarmNo;
	private int targetNo;
	private String alarmMsg;
	private String registerDate;
	private String read;
	private int refNo;
	private String refType;
	private String url;
	
}
