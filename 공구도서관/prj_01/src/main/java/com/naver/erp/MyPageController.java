package com.naver.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {
	
	
	@Autowired
	private MyPageDAO myPageDAO;   
	
	
	
	
	
	@RequestMapping( value="/myPageInfo.do")
	public ModelAndView myPageInfoForm(HttpSession session) {
		String sessionEmail = (String)session.getAttribute("email");
		List<Map<String,String>> memberInfo =  this.myPageDAO.getMemberInfo(sessionEmail);
		ModelAndView mav = new ModelAndView();
		
		// her  =  DB결과물 
		
		mav.addObject("memberInfo", memberInfo );
		mav.setViewName("myPageInfo.jsp");
		return mav;
	}
	

	
	
	
	@RequestMapping( value="/myPageInfoPwChange.do")
	public ModelAndView myPageInfoPwChangeForm(
			
			) {
		
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPageInfoPwChange.jsp");
		return mav;
	}
	
	@RequestMapping( value="/myPageInfoPwChangeProc.do"
	,method=RequestMethod.POST
	,produces="application/json;charset=UTF-8")

	@ResponseBody
	public int myPageInfoPwChangeFormProc(
			@RequestParam(value="pastPwd") String pastPwd 
			,@RequestParam(value="newPwd") String newPwd 
			,HttpSession session
			) {
		
		Map emailPwd = new HashMap();
		int resultCnt = 0;
		String email = (String)session.getAttribute("email");
		emailPwd.put("pastPwd",pastPwd);
		emailPwd.put("email", email);
		emailPwd.put("newPwd", newPwd);
		System.out.print(emailPwd);
		
		int correctCnt = this.myPageDAO.isCorrectPwd(emailPwd);
		if(correctCnt==1) {
			System.out.print("ddddddddddddddddddddd");
			resultCnt = this.myPageDAO.upPwd(emailPwd);		
			
		}
		
		System.out.print(correctCnt);
		return resultCnt;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping( value="/myPageInfoPhoneChange.do")
	public ModelAndView myPageInfoPhoneChangeForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPageInfoPhoneChange.jsp");
		return mav;
	}
	

	@RequestMapping( value="/myPageBookList.do")
	public ModelAndView getBookList(  HttpSession session ) {
		System.out.println("getBookList 메소드 진입");
		
		String member_email = (String)session.getAttribute("email"); 
		
		
		List<Map<String,String>> myBookList =  this.myPageDAO.getBookList( member_email );
		
		List<Map<String,String>> jijumList =  this.myPageDAO.getJijumList( );

		List<Map<String,String>> onBookingList =  this.myPageDAO.getOnBookingList( member_email );
		
		List<Map<String,String>> returnList =  this.myPageDAO.getReturnList( member_email );


		
		ModelAndView mav = new ModelAndView();
		mav.addObject("myBookList", myBookList );
		mav.addObject("jijumList", jijumList );
		mav.addObject("onBookingList", onBookingList );
		mav.addObject("returnList", returnList );
		
		
		mav.setViewName("myPageBookList.jsp");
		
		
		System.out.println("getBookList 메소드 진입");
		return mav;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping( value="/myPageMyWritingList.do")
	public ModelAndView myPageMyWritingListForm(   HttpSession session  ) {
		
		String member_email = (String)session.getAttribute("email");

		List<Map<String,String>> myWriterList =  this.myPageDAO.myWriterList( member_email );
		
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("myWriterList", myWriterList );

		mav.setViewName("myPageMyWritingList.jsp");
		return mav;
	}
	
	@RequestMapping( value="/bookCancleProc.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8")

	@ResponseBody
	public int delBookInfo(
			@RequestParam(value="cancleNo") int no
			,	@RequestParam(value="cancleToolNo") int no2
			) {
		
		;
		int resultNo1 = this.myPageDAO.delBookNo(no);
		int resultNo2 = this.myPageDAO.upToolStatus(no2);
		
		int resultNo = resultNo1 + resultNo2; 
		return resultNo;
	
	
	
	
	}
	
	
	
	
	
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


