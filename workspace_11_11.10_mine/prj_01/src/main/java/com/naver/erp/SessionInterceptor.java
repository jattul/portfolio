package com.naver.erp;

import java.io.PrintWriter;
import javax.swing.JOptionPane;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

public class SessionInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(
			HttpServletRequest request 
			, HttpServletResponse response 
			, Object handler
	) throws Exception {

			HttpSession session = request.getSession();  

			String mid = (String)session.getAttribute("email");	
			
			if(mid==null) {	
				/*
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script language='javascript'>");
				out.println("alert('로그인이 필요합니다!')");
				out.println("</script>");
				out.flush();
				out.close();
				*/
				
				
				
				response.sendRedirect( "/loginPageForm.do" );
				
			
				
				return false;
			}
			else{ 
				return true;
			}
	}
}
