package com.mj.jwork.alarm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.mj.jwork.employee.model.vo.Employee;


public class EchoHandler  extends TextWebSocketHandler{
	//로그인 한 전체
	// 웹소켓 세션객체들을 저장해두는 리스트
	private ArrayList<WebSocketSession> sessionList = new ArrayList<>();
	
	// 1대1
	Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	
	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String empId = session.getId(); // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
		if(empId != null) {	// 로그인 값이 있는 경우만
			//System.out.println(empId + " 연결 됨");
			sessionList.add(session);   // 접속한 클라이언트를 list 에 추가
			
			
		}
		
	}
	
	// 메세지 보낼때
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {

		
		
	}
	
	

	// 해당 웹소켓에 클라이언트와의 연결이 끊겼을 때 실행할 내용
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		//System.out.println("handleTextMessage: " + session + " : " + status);
		sessionList.remove(session);
		
	}
	
	public ArrayList<WebSocketSession> getSessionList(){
		
		return sessionList;
		
	}
	
	
	
	
}
