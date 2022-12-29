package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardNoticeDAOImpl implements BoardNoticeDAO {
	   
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 자주 묻는 질문 게시판 목록 DB 한테 넘겨받을 메소드
	public List<Map<String,String>> getBoardNoticeList(BoardSearchDTO boardSearchDTO ){		
		List<Map<String,String>> boardNoticeList = this.sqlSession.selectList(			
				"com.naver.erp.Board.getBoardNoticeList"	
				,boardSearchDTO 
		);
		return boardNoticeList;
	}
	// 조회수 1 올림
	public int noticeUpReCount(int no) {
		int noticeUpReCount = this.sqlSession.update(				
				"com.naver.erp.Board.noticeUpReCount"					
				,no				
		);
		return noticeUpReCount;
	}
	// 1개의 게시판 글 정보
	public BoardNoticeDTO getNoticeBoard(int no){		
		BoardNoticeDTO noticeBoard = this.sqlSession.selectOne(			
				"com.naver.erp.Board.noticeBoard"			
				,no		
		);
		return noticeBoard;
	}
	// 검색한 게시판 목록의 총개수 
	public int noticeBoardListTotCnt( BoardSearchDTO boardSearchDTO ) {
		int boardListTotCnt = this.sqlSession.selectOne(
				"com.naver.erp.Board.noticeBoardListTotCnt"
				,boardSearchDTO
			);
		return boardListTotCnt;
	}
	
	
	
	public void noticeSave(BoardNoticeDTO BoardNoticeDTO) {
		sqlSession.insert(				
				"com.naver.erp.Board.noticeSave"					
				,BoardNoticeDTO				
		);
	}
	// 수정
		public void noticeUpdate(BoardNoticeDTO BoardNoticeDTO) {
			sqlSession.insert(				
					"com.naver.erp.Board.noticeUpdate"					
					,BoardNoticeDTO				
			);
		}
		// 삭제
		public void noticeDelete(BoardNoticeDTO BoardNoticeDTO) {
			sqlSession.insert(				
					"com.naver.erp.Board.noticeDelete"					
					,BoardNoticeDTO				
			);
		}
	
	
	
	
	
	
	
		
		
	
}
