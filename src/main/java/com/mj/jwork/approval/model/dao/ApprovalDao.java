package com.mj.jwork.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mj.jwork.approval.model.vo.AppLine;
import com.mj.jwork.approval.model.vo.Approval;
import com.mj.jwork.approval.model.vo.Reference;
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
	public int selectUnsignListCount(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.selectOne("approvalMapper.selectUnsignListCount", a);
	}
	
	//미결재문서 리스트 조회
	public ArrayList<Approval> selectUnsignList(SqlSessionTemplate sqlSession, PageInfo pi, Approval a) {
		//건너뛸 게시물 개수
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		//조회할 게시글 개수
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectUnsignList",a,rowBounds);
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

	//임시저장
	public int saveApproval(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.insert("approvalMapper.saveApproval",a);
	}

	//새문서 insert
	//문서 내용
	public int insertNewApp(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.insert("approvalMapper.insertNewApp",a);
	}
	
	//결재선
	public int insertNewAppLine(SqlSessionTemplate sqlSession, Approval a) {
		
		int count = 0;
		
		ArrayList<AppLine> alist = new ArrayList<>();
		alist = a.getAlist();
		//System.out.println("alist: " + alist);
		
		for(AppLine al : alist) {
			
			count += sqlSession.insert("approvalMapper.insertNewAppLine",al);
		}
		
		return count;
	}
	
	//참조인
	public int insertNewRefLine(SqlSessionTemplate sqlSession,Approval a) {
		int count = 0;
		
		ArrayList<Reference> rlist = new ArrayList<>();
		rlist = a.getRlist();
		//System.out.println("rlist: " + rlist);
		
		for(Reference rl : rlist) {
			
			count += sqlSession.insert("approvalMapper.insertNewRefLine",rl);
			
		}
		
		return count;
	}
	
	//상신취소, 임시저장form에서의 임시저장
	public int resaveApproval(SqlSessionTemplate sqlSession, Approval a) {
		//System.out.println(a);
		return sqlSession.update("approvalMapper.resaveApproval",a);
	}
	
	//기존 결재선 삭제
	public int deleteAppLine(SqlSessionTemplate sqlSession, Approval a) {
		int count = 1;
		System.out.println("결재선삭제: "+sqlSession.delete("approvalMapper.deleteAppLine",a));
		
		count += sqlSession.delete("approvalMapper.deleteAppLine",a);
		
		return count;
		
	}
	// 기존 참조인 삭제
	public int deleteRefLine(SqlSessionTemplate sqlSession, Approval a) {
		int count = 1;
		System.out.println("참조인삭제: "+sqlSession.delete("approvalMapper.deleteRefLine",a));
		count += sqlSession.delete("approvalMapper.deleteRefLine",a);
		return count;
		
	}

	
	// 임시저장문서 결재
	public int insertDrafbox(SqlSessionTemplate sqlSession, Approval a) {
		
		return sqlSession.update("approvalMapper.insertDrafbox",a);
	}

	// 재결재시 재결재선 insert
	public int reinsertAppLine(SqlSessionTemplate sqlSession, Approval a) {
		int count = 0;
		
		ArrayList<AppLine> alist = new ArrayList<>();
		alist = a.getAlist();
		//System.out.println("alist: " + alist);
		
		for(AppLine al : alist) {
			
			count += sqlSession.insert("approvalMapper.reinsertAppLine",al);
		}
		
		return count;
	}
	
	//재 참조인 insert
	public int reinsertRefLine(SqlSessionTemplate sqlSession, Approval a) {
		int count = 0;
		
		ArrayList<Reference> rlist = new ArrayList<>();
		rlist = a.getRlist();
		//System.out.println("rlist: " + rlist);
		
		for(Reference rl : rlist) {
			
			count += sqlSession.insert("approvalMapper.reinsertRefLine",rl);
			
		}
		
		return count;
	}
	
	// 상신취소 재결재
	public int insertCancleApp(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.update("approvalMapper.insertCancleApp",a);
	}

	//참조문서 카운팅
	public int selectRefListCount(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("approvalMapper.selectRefListCount", empNo);
	}
	//참조문서 리스트 조회
	public ArrayList<Approval> selectRefList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo) {
		//건너뛸 게시물 개수
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		//조회할 게시글 개수
		int limit = pi.getBoardLimit();
			
		RowBounds rowBounds = new RowBounds(offset, limit);
			
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRefList",empNo,rowBounds);
	}
	

	
	// 새로 생성된 문서 번호 가져오기
	public int selectCurrentAppNo(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("approvalMapper.selectCurrentAppNo");
		
	}
	
	// 알람 보낼 문서 정보 가져오기
	public Approval selectAppInfo(SqlSessionTemplate sqlSession, int newAppNo) {
		
		return sqlSession.selectOne("approvalMapper.selectAppInfo", newAppNo);
		
	}


	
	


	
}
