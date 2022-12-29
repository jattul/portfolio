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
public class BoardController {
	
	@Autowired
	private BoardQuestionDAO boardQuestionDAO;   
	
	@Autowired
	private BoardFreeDAO boardFreeDAO;   
	
	@Autowired
	private BoardQnADAO boardQnADAO;   
	
	// /boardQuestion.do 로 접근하면 호출되는 메소드 
	@RequestMapping( value="/boardQuestion.do" )
	public ModelAndView boardQuestion(
			BoardSearchDTO boardSearchDTO
			,HttpServletRequest request
		){	
		String  email = request.getSession().getAttribute("email").toString();
		
		int boardTotCnt = this.boardQuestionDAO.questionBoardListTotCnt( boardSearchDTO );
		
		Map<String,Integer> pagingMap = Paging.getPagingMap(
				boardSearchDTO.getSelectPageNo( )
				, boardSearchDTO.getRowCntPerPage( )
				, boardTotCnt
		);
		boardSearchDTO.setSelectPageNo((int)pagingMap.get("selectPageNo"));
		boardSearchDTO.setBegin_rowNo((int)pagingMap.get("begin_rowNo"));
		boardSearchDTO.setEnd_rowNo((int)pagingMap.get("end_rowNo"));
		
		List<Map<String,String>> boardList =  this.boardQuestionDAO.getBoardQuestionList(boardSearchDTO);	
		
		ModelAndView mav = new ModelAndView();
		// ModelAndView 객체에 게시판 목록 검색 결과를 저장하기
		mav.addObject(  "boardList" , boardList );
		mav.addObject(  "boardSearchDTO" , boardSearchDTO );
		mav.addObject(  "boardTotCnt" , boardTotCnt );
		mav.addObject(  "pagingMap" , pagingMap );
		mav.addObject(  "email" , email );
		mav.addObject(  "selectPageNo" , (int)pagingMap.get("selectPageNo") );
		mav.setViewName("boardQuestion.jsp");
		
		return mav;
	//============================================================
	}	//	boardQuestion() 종료
	//============================================================
	
	// /boardQuestionDetail.do 로 접근하면 호출되는 메소드 
	@RequestMapping( value="/boardQuestionDetail.do" )
	public ModelAndView boardQuestionDetail(
			// "no" 라는 파라미터명의 파라미터값이 저장되는 매개변수 no 선언
			// 상세보기할 게시판 고유 번호가 들어오는 매개변수 선언
			@RequestParam(value="no") int no
			,HttpServletRequest request
	){
		int updateReCount = 0;
		String  email = request.getSession().getAttribute("email").toString();
		updateReCount = this.boardQuestionDAO.questionUpReCount(no);
		BoardQuestionDTO boardQuestionInfo = this.boardQuestionDAO.getQuestBoard(no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject(  "boardQuestionInfo" , boardQuestionInfo );
		mav.addObject(  "email" , email );
		mav.addObject(  "updateReCount" , updateReCount );
		mav.setViewName("boardQuestionDetail.jsp");
		
		return mav;
	//============================================================
	}	//	boardQuestionDetail() 종료
	//============================================================
	// /boardQuestionWrite.do 로 접근하면 호출되는 메소드
			@RequestMapping( value="/boardQuestionWrite.do" )
			public ModelAndView boardQuestionWrite() {
				
				ModelAndView mav = new ModelAndView();
				
				mav.setViewName("boardQuestionWrite.jsp");
				
				return mav;
			//============================================================
			}	//	noticeWrite() 종료
			//============================================================
			// /boardQuestionSave.do 로 접근하면 호출되는 메소드
			@RequestMapping( value="/boardQuestionSave.do" )
			public String boardQuestionSave(
					BoardQuestionDTO BoardQuestionDTO
					,HttpServletRequest request
					) {
				String  email = request.getSession().getAttribute("email").toString();
				
				BoardQuestionDTO.setEmail(email);
				
				if(BoardQuestionDTO.getNo() == 0) {
					boardQuestionDAO.questionSave(BoardQuestionDTO);
				}else {
					boardQuestionDAO.questionUpdate(BoardQuestionDTO);
				}
				
				return "redirect:/boardQuestion.do";
				
			//============================================================
			}	//	boardQuestionSave() 종료
			//============================================================
			// /boardQuestionDelete.do 로 접근하면 호출되는 메소드
			@RequestMapping( value="/boardQuestionDelete.do" )
			public String noticeDelete(
					BoardQuestionDTO BoardQuestionDTO
					) {
				
				boardQuestionDAO.questionDelete(BoardQuestionDTO);

				return "redirect:/boardQuestion.do";
				
			//============================================================
			} // boardQuestionDelete() 종료
			//============================================================	
			// /boardQuestionUpDel.do 로 접근하면 호출되는 메소드
			@RequestMapping( value="/boardQuestionUpDel.do" )
			public ModelAndView boardQuestionUpDel(
					@RequestParam(value="no") int no
					) {
				BoardQuestionDTO boardQuestionInfo = this.boardQuestionDAO.getQuestBoard(no);
				
				ModelAndView mav = new ModelAndView();
				// ModelAndView 객체에 게시판 목록 검색 결과를 저장하기
				mav.addObject(  "no" , no );
				mav.addObject(  "boardQuestionInfo" , boardQuestionInfo );
				mav.setViewName("boardQuestionUpDel.jsp");
				
				return mav;
			//============================================================
			}	//	boardQuestionUpDel() 종료
			//============================================================

			
	// /boardQnA.do 로 접근하면 호출되는 메소드 
	@RequestMapping( value="/boardQnA.do" )
	public ModelAndView boardQnA(
			BoardSearchDTO boardSearchDTO
		){
		int boardTotCnt = this.boardQnADAO.qnaBoardListTotCnt( boardSearchDTO );
		
		Map<String,Integer> pagingMap = Paging.getPagingMap(
				boardSearchDTO.getSelectPageNo( )
				, boardSearchDTO.getRowCntPerPage( )
				, boardTotCnt
		);
		boardSearchDTO.setSelectPageNo((int)pagingMap.get("selectPageNo"));
		boardSearchDTO.setBegin_rowNo((int)pagingMap.get("begin_rowNo"));
		boardSearchDTO.setEnd_rowNo((int)pagingMap.get("end_rowNo"));
		
		List<Map<String,String>> boardList =  this.boardQnADAO.getBoardQnaList(boardSearchDTO);	
		
		ModelAndView mav = new ModelAndView();
		// ModelAndView 객체에 게시판 목록 검색 결과를 저장하기
		mav.addObject(  "boardList" , boardList );
		mav.addObject(  "boardSearchDTO" , boardSearchDTO );
		mav.addObject(  "boardTotCnt" , boardTotCnt );
		mav.addObject(  "pagingMap" , pagingMap );
		mav.addObject(  "selectPageNo" , (int)pagingMap.get("selectPageNo") );
		mav.setViewName("boardQnA.jsp");
		
		return mav;
	//============================================================
	}	//	boardQnA() 종료
	//============================================================
	
	// /boardQnADetail.do 로 접근하면 호출되는 메소드 
	@RequestMapping( value="/boardQnADetail.do" )
	public ModelAndView boardQnADetail(
		// "no" 라는 파라미터명의 파라미터값이 저장되는 매개변수 no 선언
					// 상세보기할 게시판 고유 번호가 들어오는 매개변수 선언
					@RequestParam(value="no") int no		
					,HttpServletRequest request //이게 세션 읽어오기 위해서 선언하는거구
					){
				//세션 가져오는 부분(email 은 로그인시 저장한 세션 아이디 값이고)
				String  email = request.getSession().getAttribute("email").toString();
				
				int updateReCount = 0;
				updateReCount = this.boardQnADAO.qnaUpReCount(no);
				BoardQnADTO boardQnaInfo = this.boardQnADAO.getQnaBoard(no);
				
				ModelAndView mav = new ModelAndView();
				mav.addObject(  "boardQnaInfo" , boardQnaInfo );
				//세션값 자바로 보내기
				mav.addObject(  "email" , email );
				mav.addObject(  "updateReCount" , updateReCount );
				mav.setViewName("boardQnADetail.jsp");
				
				return mav;
	//============================================================
	}	//	boardQnADetail() 종료
	//============================================================
	
	// /boardQnAWrite.do 로 접근하면 호출되는 메소드
	@RequestMapping( value="/boardQnAWrite.do" )
	public ModelAndView boardQnAWrite() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("boardQnAWrite.jsp");
		
		return mav;
	//============================================================
	}	//	boardQnAWrite() 종료
	//============================================================

	// boardQnASave 저장
	@RequestMapping( value="/boardQnASave.do" )
	public String boardQnASave(
			BoardQnADTO BoardQnADTO
			,HttpServletRequest request
			) {
		String  email = request.getSession().getAttribute("email").toString();
		
		BoardQnADTO.setEmail(email);
		if(BoardQnADTO.getNo() == 0) {
			boardQnADAO.boardQnaSave(BoardQnADTO);
		}else {
			boardQnADAO.boardQnaUpdate(BoardQnADTO);
		}

		return "redirect:/boardQnA.do";
		
	//============================================================
	} // boardQnASave() 종료
	//============================================================	
			
	// /boardQnADelete.do 로 접근하면 호출되는 메소드
	@RequestMapping( value="/boardQnADelete.do" )
	public String boardQnADelete(
			BoardQnADTO BoardQnADTO

			) {
		
		boardQnADAO.boardQnaDelete(BoardQnADTO);

		return "redirect:/boardQnA.do";
		
	//============================================================
	} // boardQnADelete() 종료
	//============================================================	
			@RequestMapping( value="/boardQnAUpDel.do" )
			public ModelAndView boardQnAUpDel(
					@RequestParam(value="no") int no
					) {
				
				BoardQnADTO boardQnaInfo = this.boardQnADAO.getQnaBoard(no);
				
				ModelAndView mav = new ModelAndView();
				
				mav.addObject("no" , no);
				mav.addObject("boardQnaInfo" , boardQnaInfo);
				mav.setViewName("boardQnAUpDel.jsp");
				
				return mav;
			//============================================================
			}	//	boardQnAUpDel() 종료
			//============================================================

	// /boardFree.do 로 접근하면 호출되는 메소드 
	@RequestMapping( value="/boardFree.do" )
	public ModelAndView boardFree(
		BoardSearchDTO boardSearchDTO
		){	
		int boardTotCnt = this.boardFreeDAO.freeBoardListTotCnt( boardSearchDTO );
		
		Map<String,Integer> pagingMap = Paging.getPagingMap(
				boardSearchDTO.getSelectPageNo( )
				, boardSearchDTO.getRowCntPerPage( )
				, boardTotCnt
		);
		boardSearchDTO.setSelectPageNo((int)pagingMap.get("selectPageNo"));
		boardSearchDTO.setBegin_rowNo((int)pagingMap.get("begin_rowNo"));
		boardSearchDTO.setEnd_rowNo((int)pagingMap.get("end_rowNo"));
		
		List<Map<String,String>> boardList =  this.boardFreeDAO.getBoardFreeList(boardSearchDTO);	
		
		ModelAndView mav = new ModelAndView();
		// ModelAndView 객체에 게시판 목록 검색 결과를 저장하기
		mav.addObject(  "boardList" , boardList );
		mav.addObject(  "boardSearchDTO" , boardSearchDTO );
		mav.addObject(  "boardTotCnt" , boardTotCnt );
		mav.addObject(  "pagingMap" , pagingMap );
		mav.addObject(  "selectPageNo" , (int)pagingMap.get("selectPageNo") );
		mav.setViewName("boardFree.jsp");
		
		return mav;
	//============================================================
	}	//	boardFree() 종료
	//============================================================
	// /boardFreeDetail.do 로 접근하면 호출되는 메소드 
		@RequestMapping( value="/boardFreeDetail.do" )
		public ModelAndView boardFreeDetail(
				// "no" 라는 파라미터명의 파라미터값이 저장되는 매개변수 no 선언
				// 상세보기할 게시판 고유 번호가 들어오는 매개변수 선언
				@RequestParam(value="no") int no
				){
			int updateReCount = 0;
			updateReCount = this.boardFreeDAO.freeUpReCount(no);
			BoardFreeDTO boardFreeInfo = this.boardFreeDAO.getFreeBoard(no);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject(  "boardFreeInfo" , boardFreeInfo );
			mav.addObject(  "updateReCount" , updateReCount );
			mav.setViewName("boardFreeDetail.jsp");
			
			return mav;
		//============================================================
		}	//	boardFreeDetail() 종료
		//============================================================
	
		// /boardFreeWrite.do 로 접근하면 호출되는 메소드
		@RequestMapping( value="/boardFreeWrite.do" )
		public ModelAndView boardFreeWrite() {
			
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("boardFreeWrite.jsp");
			
			return mav;
		//============================================================
		}	//	boardFreeWrite() 종료
		//============================================================
		
		// 자유게시판 저장
		@RequestMapping( value="/boardFreeSave.do" )
		public String boardFreeSave(
				BoardFreeDTO BoardFreeDTO
				,HttpServletRequest request

				) {
			String  email = request.getSession().getAttribute("email").toString();
			BoardFreeDTO.setEmail(email);
			
			if(BoardFreeDTO.getNo() == 0) {
				boardFreeDAO.boardFreeSave(BoardFreeDTO);
			}else {
				boardFreeDAO.boardFreeUpdate(BoardFreeDTO);
			}
			

			return "redirect:/boardFree.do";
			
		//============================================================
		} // boardFreeSave() 종료
		//============================================================	
		// /boardFreeDelete.do 로 접근하면 호출되는 메소드
		@RequestMapping( value="/boardFreeDelete.do" )
		public String boardFreeDelete(
				BoardFreeDTO BoardFreeDTO

				) {
			
			boardFreeDAO.boardFreeDelete(BoardFreeDTO);

			return "redirect:/boardFree.do";
			
		//============================================================
		} // boardFreeDelete() 종료
		//============================================================	
		@RequestMapping( value="/boardFreeUpDel.do" )
		public ModelAndView boardFreeUpDel(
				@RequestParam(value="no") int no
				) {
			
			BoardFreeDTO boardFreeInfo = this.boardFreeDAO.getFreeBoard(no);
			
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("no" , no);
			mav.addObject("boardFreeInfo" , boardFreeInfo);
			mav.setViewName("boardFreeUpDel.jsp");
			
			return mav;
		//============================================================
		}	//	boardFreeUpDel() 종료
		//============================================================
		
		// /boardFreeReport.do 로 접근하면 호출되는 메소드 
		@RequestMapping( value="/boardReport.do" )
		public ModelAndView boardReport(
			@RequestParam(value="no") int no,
			@RequestParam(value="partno") String partno,
			@RequestParam(value="writerEmail") String writerEmail
			){
				
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("no" , no);
		mav.addObject("partno" , partno);
		mav.addObject("writerEmail" , writerEmail);
		mav.setViewName("boardReport.jsp");
		
		return mav;
		//============================================================
		}	//	boardFreeReport() 종료
		//============================================================
		// report 는 페이지를 하나로 사용해도 무관함.
		@RequestMapping( value="/boardReportSave.do" )
		public String boardReportSave(
			BoardFreeDTO BoardFree
			,HttpServletRequest request
			){
			System.out.println(   BoardFree.getWriterEmail()    );
			
			String  email = request.getSession().getAttribute("email").toString();
			
			BoardFree.setEmail(email);
			boardFreeDAO.boardFreeReportSave(BoardFree);
			
			// 신고당한 글 신고횟수 1 증가 
			boardFreeDAO.boardReportCount(BoardFree);
			 // 신고테이블에 신고당한 글 신고횟수 저장
			// boardFreeDAO.boardReportRecount(BoardFree);
			 
       String url;
       // 페이지를 불러온다.
       if("1".equals(BoardFree.getPartno())) {
    	   url = "redirect:/boardFreeDetail.do?no="+ BoardFree.getNo();
       }else {
    	   url = "redirect:/boardQnADetail.do?no="+ BoardFree.getNo();
       }
			
		return url;
		//============================================================
		}	
		//============================================================
		
	

		
}
