package com.mj.jwork.ess.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.jwork.ess.model.dao.EssDao;
import com.mj.jwork.ess.model.vo.LeaveCategory;

@Service
public class EssServiceImpl implements EssService {
	
	@Autowired
	private EssDao eDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public LeaveCategory selectLeaveCategory(int no) {
		return eDao.selectLeaveCategory(sqlSession, no);
	}

}
