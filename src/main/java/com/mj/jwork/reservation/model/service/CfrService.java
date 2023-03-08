package com.mj.jwork.reservation.model.service;

import java.util.ArrayList;

import com.mj.jwork.common.model.vo.PageInfo;
import com.mj.jwork.reservation.model.vo.CfRoom;

public interface CfrService {

	
	//회의실 리스트 페이지 (페이징)
	int selectListCount ();
	ArrayList<CfRoom> selectList(PageInfo pi);
	
	//회의실 등록 서비스
	int enrollCfr(CfRoom cfr);
	
}
