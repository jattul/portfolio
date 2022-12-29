package com.naver.erp;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class NoticeController {
	
	@Autowired
	private BoardNoticeDAO boardNoticeDAO; 
	
	@RequestMapping( value="/notice.do" )
	public ModelAndView notice(
			BoardSearchDTO boardSearchDTO
			,HttpServletRequest request
			){	
		String  email = request.getSession().getAttribute("email").toString();
		
			int boardTotCnt = this.boardNoticeDAO.noticeBoardListTotCnt( boardSearchDTO );
			
			Map<String,Integer> pagingMap = Paging.getPagingMap(
					boardSearchDTO.getSelectPageNo( )
					, boardSearchDTO.getRowCntPerPage( )
					, boardTotCnt
					
			);
			boardSearchDTO.setSelectPageNo((int)pagingMap.get("selectPageNo"));
			boardSearchDTO.setBegin_rowNo((int)pagingMap.get("begin_rowNo"));
			boardSearchDTO.setEnd_rowNo((int)pagingMap.get("end_rowNo"));
			
			List<Map<String,String>> boardList =  this.boardNoticeDAO.getBoardNoticeList(boardSearchDTO);	
			
			ModelAndView mav = new ModelAndView();
			// ModelAndView 객체에 게시판 목록 검색 결과를 저장하기
			mav.addObject(  "boardList" , boardList );
			mav.addObject(  "boardSearchDTO" , boardSearchDTO );
			mav.addObject(  "boardTotCnt" , boardTotCnt );
			mav.addObject(  "pagingMap" , pagingMap );
			mav.addObject(  "email" , email );
			mav.addObject(  "selectPageNo" , (int)pagingMap.get("selectPageNo") );
			mav.setViewName("notice.jsp");
			
			return mav;
		//============================================================
		}		//	boardQuestion() 종료
		//============================================================
	@RequestMapping( value="/noticeDetail.do" )
	public ModelAndView noticeDetail(
			// "no" 라는 파라미터명의 파라미터값이 저장되는 매개변수 no 선언
			// 상세보기할 게시판 고유 번호가 들어오는 매개변수 선언
			@RequestParam(value="no") int no
			,HttpServletRequest request
			){
		int updateReCount = 0;
		String  email = request.getSession().getAttribute("email").toString();
		updateReCount = this.boardNoticeDAO.noticeUpReCount(no);
		BoardNoticeDTO boardNoticeInfo = this.boardNoticeDAO.getNoticeBoard(no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject(  "boardNoticeInfo" , boardNoticeInfo );
		mav.addObject(  "email" , email );
		mav.addObject(  "updateReCount" , updateReCount );
		mav.setViewName("noticeDetail.jsp");
		
		return mav;
	//============================================================
	}//	boardQuestion() 종료
	//============================================================
	
	
	@RequestMapping( value="/noticeWrite.do" )
	public ModelAndView noticeWrite() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("noticeWrite.jsp");
		
		return mav;
	//============================================================
	}	
	@RequestMapping( value="/noticeSave.do" )
	public String noticeSave(
			BoardNoticeDTO BoardNoticeDTO
			,HttpServletRequest request
			) {
		String  email = request.getSession().getAttribute("email").toString();
		
		BoardNoticeDTO.setEmail(email);
		
		if(BoardNoticeDTO.getNo() == 0) {
			boardNoticeDAO.noticeSave(BoardNoticeDTO);
		}else {
			boardNoticeDAO.noticeUpdate(BoardNoticeDTO);
		}
		
		return "redirect:/notice.do";
		
	//============================================================
	}	
	
	
	@RequestMapping( value="/noticeDelete.do" )
	public String noticeDelete(
			BoardNoticeDTO BoardNoticeDTO
			) {
		
		boardNoticeDAO.noticeDelete(BoardNoticeDTO);

		return "redirect:/notice.do";
		
	//============================================================
	} // boardQnADelete() 종료
	//============================================================	
	// /noticeUpDel.do 로 접근하면 호출되는 메소드
	@RequestMapping( value="/noticeUpDel.do" )
	public ModelAndView noticeUpDel(
			@RequestParam(value="no") int no
			) {
		BoardNoticeDTO boardNoticeInfo = this.boardNoticeDAO.getNoticeBoard(no);
		
		ModelAndView mav = new ModelAndView();
		// ModelAndView 객체에 게시판 목록 검색 결과를 저장하기
		mav.addObject(  "no" , no );
		mav.addObject(  "boardNoticeInfo" , boardNoticeInfo );
		mav.setViewName("noticeUpDel.jsp");
		
		return mav;
	//============================================================
	}	//	noticeUpDel() 종료
	//============================================================

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}


