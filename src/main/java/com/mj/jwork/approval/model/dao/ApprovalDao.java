package com.mj.jwork.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.approval.model.vo.AppLine;
import com.mj.jwork.approval.model.vo.Approval;
import com.mj.jwork.common.model.vo.PageInfo;

@Repository
public class ApprovalDao {

	//결재문서 리스트 카운트
	public int selectListCount(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.selectOne("approvalMapper.selectListCount", a);
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
	
	//결재문서 결재선 조회
	public ArrayList<AppLine> selectAppLine(SqlSessionTemplate sqlSession, int appNo) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectAppLine",appNo);
	}

	
	//미결재문서 리스트 카운팅
	public int selectUnsignListCount(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("approvalMapper.selectUnsignListCount", empNo);
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
	
	//결재문서 리스트 카운팅
	public int selectSignListCount(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("approvalMapper.selectSignListCount", empNo);
	}

	//결재문서 리스트 조회
	public ArrayList<Approval> selectSignList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo) {
		//건너뛸 게시물 개수
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		//조회할 게시글 개수
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSignList",empNo,rowBounds);
			}

	
	//임시저장함 리스트 조회
	public int selectdraftListCount(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("approvalMapper.selectdraftListCount", empNo);
	}

	public ArrayList<Approval> selectdraftList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo) {
		//건너뛸 게시물 개수
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		//조회할 게시글 개수
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectdraftList",empNo,rowBounds);
	}

	//상신취소 문서 삭제하기
	public int deleteApproval(SqlSessionTemplate sqlSession, int appNo) {
		return sqlSession.update("approvalMapper.deleteApproval",appNo);
	}
	
	//승인 버튼 눌렀을때
	public int signBtn(SqlSessionTemplate sqlSession, AppLine al) {
		return sqlSession.update("approvalMapper.signBtn",al);
	}
	//승인 올라가면 문서상태
	public int signStatus(SqlSessionTemplate sqlSession, int appNo) {
		return sqlSession.update("approvalMapper.signStatus",appNo);
	}

	//반려버튼 눌렀을때
	public int returnBtn(SqlSessionTemplate sqlSession, AppLine al) {
		return sqlSession.update("approvalMapper.returnBtn",al);
	}

	public int returnStatus(SqlSessionTemplate sqlSession, int appNo) {
		return sqlSession.update("approvalMapper.returnStatus",appNo);
	}

	//결재 insert - 임시저장
	public int saveApproval(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.insert("approvalMapper.saveApproval",a);
	}

	//새문서 insert
	//문서 내용
	public int insertNewApp(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.insert("approvalMapper.insertNewApp",a);
	}
	//결재선
	public int insertNewAppLine(SqlSessionTemplate sqlSession,Approval a) {
		return sqlSession.insert("approvalMapper.insertNewAppLine",a);
	}
	//참조인
	public int insertNewRefLine(SqlSessionTemplate sqlSession,Approval a) {
		return sqlSession.insert("approvalMapper.insertNewRefLine",a);
	}

	
	




}
