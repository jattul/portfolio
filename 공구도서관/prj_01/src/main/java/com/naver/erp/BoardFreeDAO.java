package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;

public interface BoardFreeDAO {
	
	// 자유게시판 목록 리턴 메소드
	List<Map<String,String>> getBoardFreeList(BoardSearchDTO boardSearchDTO);
	// 자유게시판  글 조회수 1 증가
	int freeUpReCount(int no);
	// 자유게시판  글 1개 리턴
	BoardFreeDTO getFreeBoard(int no);
	// 검색한 자유게시판 목록의 총개수 리턴
	int freeBoardListTotCnt(BoardSearchDTO boardSearchDTO);
	
	void boardFreeSave(BoardFreeDTO BoardFreeDTO);
	
	void boardFreeDelete(BoardFreeDTO BoardFreeDTO);
	
	void boardFreeUpdate(BoardFreeDTO BoardFreeDTO);
	
	void boardFreeReportSave(BoardFreeDTO BoardFreeDTO);
	
	void boardReportCount(BoardFreeDTO BoardFreeDTO);
	 // 신고테이블에 신고당한 글 신고횟수 저장
	//void boardReportRecount(BoardFreeDTO BoardFreeDTO);

	
	
	
	
	
}
