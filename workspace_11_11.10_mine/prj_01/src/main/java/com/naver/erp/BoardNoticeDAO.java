package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface BoardNoticeDAO {
	
	// 자주 묻는 질문 게시판 목록 리턴 메소드
	List<Map<String,String>> getBoardNoticeList(BoardSearchDTO boardSearchDTO);
	// 조회수 1 증가
	int noticeUpReCount(int no);
	// 게시판 글 1개 리턴
	BoardNoticeDTO getNoticeBoard(int no);
	// 검색한 게시판 목록의 총개수 리턴
	int noticeBoardListTotCnt(BoardSearchDTO boardSearchDTO);
	

	void noticeSave(BoardNoticeDTO BoardNoticeDTO);
	
	void noticeUpdate(BoardNoticeDTO BoardNoticeDTO);
	
	void noticeDelete(BoardNoticeDTO BoardNoticeDTO);
	
	
	
	
	
	
}
