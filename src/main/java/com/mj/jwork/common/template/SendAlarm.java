package com.mj.jwork.common.template;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.mj.jwork.alarm.model.vo.Alarm;
import com.mj.jwork.employee.model.vo.Employee;

public class SendAlarm {
	
	public static void sendAlarm(Alarm a, ArrayList<WebSocketSession> sessionList) {
		
		String msg = a.getRefType() + "," + a.getAlarmMsg() + "," + a.getUrl();
		
		for( WebSocketSession wss: sessionList) { // ArrayList<WebSocketSession> sessionList == 웹소켓과 연결되어있는 클라이언트들
			if(((Employee) wss.getAttributes().get("loginUser")).getEmpNo() == a.getTargetNo()) {
				try {
					wss.sendMessage(new TextMessage(msg));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		
		}
	}
	
}
