package com.naver.erp;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@Autowired
	private LoginDAO loginDAO; 
	
	@RequestMapping( value="/loginForm.do")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("loginForm.jsp");
		
		return mav;
	//-----------------------------------
	}	// login 함수 종료
	//-----------------------------------
	
	
	
	
	@RequestMapping( value="/loginProc.do")
	@ResponseBody
	public int loginProc(
			@RequestParam( value="id" ) String id
			,@RequestParam( value="pwd" ) String pwd
			,HttpSession session
	) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		int loginIdCnt = loginDAO.getCntLogin( map );
		
		if( loginIdCnt==1 ) {
			session.setAttribute( "id", id );
		}
		
		return loginIdCnt;
	//-----------------------------------
	}	// loginProc 함수 종료
	//-----------------------------------
	
}
