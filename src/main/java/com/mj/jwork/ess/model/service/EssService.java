package com.mj.jwork.ess.model.service;

import com.mj.jwork.ess.model.vo.LeaveCategory;

public interface EssService {
	
	// 휴가 카테고리 조회 
	LeaveCategory selectLeaveCategory(int no); 
	

}
