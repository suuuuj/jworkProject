package com.mj.jwork.mail.model.vo;

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
public class MailAt {
	
	private int attachmentNo;
	private String originName;
	private String changeName;
	private int mailNo;
	
	
}
