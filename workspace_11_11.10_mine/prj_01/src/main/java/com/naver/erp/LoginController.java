package com.naver.erp;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller 
public class LoginController {

	@Autowired
	private LoginDAO loginDAO;
	
	@RequestMapping( value="/mainForm.do")
	public ModelAndView mainForm() {
		ModelAndView  mav = new ModelAndView();
		mav.setViewName("mainForm.jsp");
		return mav;
	};
	
	@RequestMapping( value="/loginPageForm.do")
	public ModelAndView loginPageForm(
			HttpSession session
	) {
		ModelAndView  mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("loginPageForm.jsp");
		return mav;
	};
	
	
//////////////////////////////////////////////////////////////////////
	
	@RequestMapping( value="/loginJoinForm.do")
	public ModelAndView loginJoinForm(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "loginJoinForm.jsp" );
		return  mav;
	};
	
	@RequestMapping( value="/loginFindPwdForm.do")
	public ModelAndView loginFindPwdForm(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "loginFindPwdForm.jsp" );
		return  mav;
	};
	
	@RequestMapping( value="/loginResetPwd.do")
	public ModelAndView loginResetPwdForm(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "loginResetPwd.jsp" );
		return  mav;
	};
	
	
	@RequestMapping( value="/loginFindEmailForm.do")
	public ModelAndView loginFindEmailForm(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "loginFindEmailForm.jsp" );
		return  mav;
	};

	
	@RequestMapping( value="/PhoneNumCheck.do")
	public ModelAndView PhoneNumCheckForm(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "PhoneNumCheckForm.jsp" );
		return  mav;
	};
	
	@RequestMapping( value="/loginFindEmailSuccessForm.do")
	public ModelAndView loginFindEmailSuccessForm(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "loginFindEmailSuccessForm.jsp" );
		return  mav;
	};

	
	//===============================================================
	@RequestMapping( 
			value="/loginProc.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int loginProc(
			@RequestParam( value="email" ) String email
			,@RequestParam( value="pwd" ) String pwd
			,HttpSession session
			,HttpServletResponse response
	) {
		System.out.println("loginProc 함수 시작");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("email", email);
		map.put("pwd", pwd);
		
		int loginIdCnt = loginDAO.getCntLogin(map);
		
		if( loginIdCnt == 1){
			session.setAttribute("email", email);
		}
		
		System.out.println("loginProc 함수 종료");
		return loginIdCnt;
	};
	
	
	
	//===============================================================
	@RequestMapping( 
			value="/joinProc.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int joinProc(
			@RequestParam( value="u_name" ) String name
			,@RequestParam( value="email" ) String email
			,@RequestParam( value="pwd" ) String pwd
			,@RequestParam( value="phone" ) String phone
			,@RequestParam( value="addr" ) String addr
			,HttpSession session
			,HttpServletResponse response
	) {
		System.out.println("joinProc 함수 시작");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("name", name);
		map.put("email", email);
		map.put("pwd", pwd);
		map.put("phone", phone);
		map.put("addr", addr);
		
		int joinCnt = loginDAO.joinMember(map);
		
		System.out.println("joinProc 함수 종료");
		return joinCnt;
	};
}
