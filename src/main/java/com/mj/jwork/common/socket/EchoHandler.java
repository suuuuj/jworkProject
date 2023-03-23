package com.mj.jwork.common.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler  extends TextWebSocketHandler{
	//로그인 한 전체
	// 웹소켓 세션객체들을 저장해두는 리스트
	private ArrayList<WebSocketSession> sessionList = new ArrayList<>();
	
	// 1대1
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String senderId = session.getId(); // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
		if(senderId!=null) {	// 로그인 값이 있는 경우만
			System.out.println(senderId + " 연결 됨");
			userSessionsMap.put(senderId, session);   // 로그인중 개별유저 저장
		}
		
	}
	
	
	
	
	
	
}
