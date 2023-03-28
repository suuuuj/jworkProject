package com.mj.jwork.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;



public class LoginInterceptor implements HandlerInterceptor {
	
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		// 현재 이 요청을 보낸 사람이 로그인이 되어있을 경우 => 정상적으로 Controller 실행
		if(session.getAttribute("loginUser") != null) {
			return true;
		} else {
			// 로그인 되어있지 않을 경우 => Controller가 실행 안되게
			session.setAttribute("errorMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
		
	}
	
}
