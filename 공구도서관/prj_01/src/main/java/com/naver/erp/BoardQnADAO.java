package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface BoardQnADAO {
	
	// 문의게시판 목록 리턴 메소드
	List<Map<String,String>> getBoardQnaList(BoardSearchDTO boardSearchDTO);
	// 문의게시판 글 조회수 1 증가
	int qnaUpReCount(int no);
	// 문의게시판 글 1개 리턴
	BoardQnADTO getQnaBoard(int no);
	// 검색한 문의게시판 목록의 총개수 리턴
	int qnaBoardListTotCnt(BoardSearchDTO boardSearchDTO);
	//저장
	void boardQnaSave(BoardQnADTO BoardQnADTO);
	//삭제
	void boardQnaDelete(BoardQnADTO BoardQnADTO);
	//수정
	void boardQnaUpdate(BoardQnADTO BoardQnADTO);
	
}
