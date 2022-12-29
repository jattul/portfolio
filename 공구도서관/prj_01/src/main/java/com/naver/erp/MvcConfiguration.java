package com.naver.erp;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer {
	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		// 예외처리할 페이지
		registry.addInterceptor(new SessionInterceptor()).excludePathPatterns(
				"/js/**"
				
				// 로그인
				,"/mainForm.do"
				,"/loginPageForm.do"
				,"/loginJoinForm.do"
				,"/loginFindPwdForm.do"
				,"/loginResetPwd.do"
				,"/loginFindEmailForm.do"
				,"/PhoneNumCheck.do"
				,"/loginFindEmailSuccessForm.do"
				,"/loginProc.do"
				,"/joinProc.do"
				
				// 공지사항
				,"/notice.do"
				,"/noticeDetail.do"
				
				// 예약 조회
				
				// 게시판
				,"/boardFree.do"
				,"/boardFreeDetail.do"
				,"/boardQnA.do"
				,"/boardQnADetail.do"
				,"/boardQuestion.do"
				,"/boardQuestionDetail.do"
				,"/resources/img/*"
				
				// 대여
				,"/toolRentMainForm.do"
				
				
		);
		
	}
}
