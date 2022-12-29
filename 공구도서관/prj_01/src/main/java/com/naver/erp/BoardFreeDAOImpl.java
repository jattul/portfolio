package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardFreeDAOImpl implements BoardFreeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
		// 자유게시판 목록 DB 한테 넘겨받을 메소드
				public List<Map<String,String>> getBoardFreeList(BoardSearchDTO boardSearchDTO ){		
					List<Map<String,String>> boardfreeList = this.sqlSession.selectList(			
							"com.naver.erp.Board.getboardfreeList"	
							,boardSearchDTO 
					);
					return boardfreeList;
				}
				// 자유게시판 글 조회수 1 올림
				public int freeUpReCount(int no) {
					int freeupdateReCount = this.sqlSession.update(				
							"com.naver.erp.Board.freeupdateReCount"					
							,no				
					);
					return freeupdateReCount;
				}
				// 자유게시판 1개의 게시판 글 정보
				public BoardFreeDTO getFreeBoard(int no){		
					BoardFreeDTO boardfreeselected = this.sqlSession.selectOne(			
							"com.naver.erp.Board.boardfreeselected"			
							,no		
					);
					return boardfreeselected;
				}
				// 검색한 자유게시판 목록의 총개수 
				public int freeBoardListTotCnt( BoardSearchDTO boardSearchDTO ) {
					int freeBoardListTotCnt = this.sqlSession.selectOne(
							"com.naver.erp.Board.freeBoardListTotCnt"
							,boardSearchDTO
						);
					return freeBoardListTotCnt;
				}
		/*
				public int boardFreeSave(BoardFreeDTO BoardFreeDTO) {
					int boardSaveCnt = this.sqlSession.insert(				
							"com.naver.erp.Board.boardFreeSave"					
							,BoardFreeDTO				
					);
					return boardSaveCnt;
				}
			*/	// 저장
				public void boardFreeSave(BoardFreeDTO BoardFreeDTO) {
					sqlSession.insert(				
							"com.naver.erp.Board.boardFreeSave"					
							,BoardFreeDTO				
					);
				}
				// 수정
				public void boardFreeUpdate(BoardFreeDTO BoardFreeDTO) {
					sqlSession.update(				
							"com.naver.erp.Board.boardFreeUpdate"					
							,BoardFreeDTO				
					);
				}
				// 삭제
				public void boardFreeDelete(BoardFreeDTO BoardFreeDTO) {
					sqlSession.update(				
							"com.naver.erp.Board.boardFreeDelete"					
							,BoardFreeDTO				
					);
				}
				// 자유게시판신고저장
				public void boardFreeReportSave(BoardFreeDTO BoardFreeDTO) {
					if("1".equals(BoardFreeDTO.getPartno())) {					
						sqlSession.insert(				
								"com.naver.erp.Board.boardFreeReportSave"					
								,BoardFreeDTO				
						);
					}else {
						sqlSession.insert(				
								"com.naver.erp.Board.boardQnaReportSave"				
								,BoardFreeDTO				
						);
					}		
				}				
				//신고 카운트 
				public void boardReportCount(BoardFreeDTO BoardFreeDTO) {
					if("1".equals(BoardFreeDTO.getPartno())) {
						sqlSession.update(				
								"com.naver.erp.Board.boardFreeReportCountUp"					
								,BoardFreeDTO				
						);
					}else {
						sqlSession.update(				
								"com.naver.erp.Board.boardAskReportCountUp"					
								,BoardFreeDTO				
						);
					}
				
				}
				// 신고테이블에 신고당한 글 신고횟수 저장
				/*public void boardReportRecount(BoardFreeDTO BoardFreeDTO) {
					if("1".equals(BoardFreeDTO.getPartno())) {
						sqlSession.update(				
								"com.naver.erp.Board.boardFreeReportReCountUp"					
								,BoardFreeDTO				
						);
					}else {
						sqlSession.update(				
								"com.naver.erp.Board.boardAskReportReCountUp"					
								,BoardFreeDTO				
						);
					}
				
				}
		
		*/
				
	
}
