package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardQnADAOImpl implements  BoardQnADAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
		// 문의게시판 목록 DB 한테 넘겨받을 메소드
		public List<Map<String,String>> getBoardQnaList(BoardSearchDTO boardSearchDTO ){		
			List<Map<String,String>> boardqnaList = this.sqlSession.selectList(			
					"com.naver.erp.Board.getBoardQnaList"	
					,boardSearchDTO 
			);
			return boardqnaList;
		}
		// 문의게시판 글 조회수 1 올림
		public int qnaUpReCount(int no) {
			int qnaUpReCount = this.sqlSession.update(				
					"com.naver.erp.Board.qnaUpReCount"					
					,no				
			);
			return qnaUpReCount;
		}
		// 문의게시판 1개의 게시판 글 정보
		public BoardQnADTO getQnaBoard(int no){		
			BoardQnADTO qnaboardselected = this.sqlSession.selectOne(			
					"com.naver.erp.Board.qnaBoardSelected"			
					,no		
			);
			return qnaboardselected;
		}
		// 검색한 문의게시판 목록의 총개수 
		public int qnaBoardListTotCnt( BoardSearchDTO boardSearchDTO ) {
			int boardQnaListTotCnt = this.sqlSession.selectOne(
					"com.naver.erp.Board.boardQnaListTotCnt"
					,boardSearchDTO
				);
			return boardQnaListTotCnt;
		}
		// 저장
		public void boardQnaSave(BoardQnADTO BoardQnADTO) {
			sqlSession.insert(				
					"com.naver.erp.Board.boardQnaSave"					
					,BoardQnADTO				
			);
		}
		// 수정
		public void boardQnaUpdate(BoardQnADTO BoardQnADTO) {
			sqlSession.update(				
					"com.naver.erp.Board.boardQnaUpdate"					
					,BoardQnADTO				
			);
		}
		//삭제
		public void boardQnaDelete(BoardQnADTO BoardQnADTO) {
			sqlSession.update(				
					"com.naver.erp.Board.boardQnaDelete"					
					,BoardQnADTO				
			);
		}
		
	
}
