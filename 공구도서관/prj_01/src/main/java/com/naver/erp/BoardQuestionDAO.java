package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface BoardQuestionDAO {
	
	// 자주 묻는 질문 게시판 목록 리턴 메소드
	List<Map<String,String>> getBoardQuestionList(BoardSearchDTO boardSearchDTO);
	// 자주 묻는 질문 게시판 글 조회수 1 증가
	int questionUpReCount(int no);
	// 자주 묻는 질문 게시판 글 1개 리턴
	BoardQuestionDTO getQuestBoard(int no);
	// 검색한 자주 묻는 질문  게시판 목록의 총개수 리턴
	int questionBoardListTotCnt(BoardSearchDTO boardSearchDTO);
	
void questionSave(BoardQuestionDTO BoardQuestionDTO);
	
	void questionUpdate(BoardQuestionDTO BoardQuestionDTO);
	
	void questionDelete(BoardQuestionDTO BoardQuestionDTO);
	
	
	
	
	
}
