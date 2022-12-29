package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardQuestionDAOImpl implements BoardQuestionDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
		// 자주 묻는 질문 게시판 목록 DB 한테 넘겨받을 메소드
		public List<Map<String,String>> getBoardQuestionList(BoardSearchDTO boardSearchDTO ){		
			List<Map<String,String>> boardquestionList = this.sqlSession.selectList(			
					"com.naver.erp.Board.getBoardQuestionList"	
					,boardSearchDTO 
			);
			return boardquestionList;
		}
		// 자주 묻는 질문 게시판 글 조회수 1 올림
		public int questionUpReCount(int no) {
			int questionUpReCount = this.sqlSession.update(				
					"com.naver.erp.Board.questionUpReCount"					
					,no				
			);
			return questionUpReCount;
		}
		// 자주 묻는 질문 게시판 1개의 게시판 글 정보
		public BoardQuestionDTO getQuestBoard(int no){		
			BoardQuestionDTO questionboardselected = this.sqlSession.selectOne(			
					"com.naver.erp.Board.questionBoardSelected"			
					,no		
			);
			return questionboardselected;
		}
		// 검색한 자주 묻는 질문 게시판 목록의 총개수 
		public int questionBoardListTotCnt( BoardSearchDTO boardSearchDTO ) {
			int boardQuesitonListTotCnt = this.sqlSession.selectOne(
					"com.naver.erp.Board.boardQuesitonListTotCnt"
					,boardSearchDTO
				);
			return boardQuesitonListTotCnt;
		}
		public void questionSave(BoardQuestionDTO BoardQuestionDTO) {
			sqlSession.insert(				
					"com.naver.erp.Board.questionSave"					
					,BoardQuestionDTO				
			);
		}
		// 수정
		public void questionUpdate(BoardQuestionDTO BoardQuestionDTO) {
			sqlSession.insert(				
					"com.naver.erp.Board.questionUpdate"					
					,BoardQuestionDTO				
			);
		}
		// 삭제
		public void questionDelete(BoardQuestionDTO BoardQuestionDTO) {
			sqlSession.insert(				
					"com.naver.erp.Board.questionDelete"					
					,BoardQuestionDTO				
			);
		}
		
	
}
