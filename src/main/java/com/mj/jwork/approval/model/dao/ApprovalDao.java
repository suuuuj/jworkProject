package com.mj.jwork.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.approval.model.vo.Approval;
import com.mj.jwork.common.model.vo.PageInfo;

@Repository
public class ApprovalDao {

	//결재문서 리스트 카운트
	public int selectListCount(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("approvalMapper.selectListCount", empNo);
	}

	//결재문서 리스트 조회(페이징)
	public ArrayList<Approval> selectMyApprovalList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo) {
		//건너뛸 게시물 개수
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		//조회할 게시글 개수
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectMyApprovalList",empNo,rowBounds);
	}

	//결재문서 리스트 버튼 클릭시
	public ArrayList<Approval> ajaxSelectBtn(SqlSessionTemplate sqlSession, PageInfo pi, Approval a) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("approvalMapper.ajaxSelectBtn",a,rowBounds);
	}

	//결재문서 상세조회
	public Approval selectApproval(SqlSessionTemplate sqlSession, int appNo) {
		return sqlSession.selectOne("approvalMapper.selectApproval",appNo);
	}
	
	//미결재문서 리스트 조회
	public ArrayList<Approval> selectUnsignList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo) {
		//건너뛸 게시물 개수
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		//조회할 게시글 개수
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectUnsignList",empNo,rowBounds);
	}




}
