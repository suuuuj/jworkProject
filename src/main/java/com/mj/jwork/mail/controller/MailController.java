package com.mj.jwork.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {
	
	// 삭제할 것!
	@RequestMapping("list.ma")
	public String mailListForward() {
		
		return "mail/mailListView";
		
	}
	
}
