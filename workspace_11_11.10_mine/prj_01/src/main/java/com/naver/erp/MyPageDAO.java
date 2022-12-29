package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface MyPageDAO {
	
		// 회원고유 번호를 이용하여 email, 이름, 폰번호, 주소를 가져오는 메소드
		List<Map<String, String>> getMemberInfo(String email);
		
		
		//public List<Map> getBookList0(int memNo );
		//public List<Map> getBookList1(int memNo );
		//public List<Map> getBookList2(int memNo );
		
List<Map<String, String>> getBookList( String member_email );
		
		
		List<Map<String, String>> getJijumList( );
		
		
		List<Map<String, String>> getOnBookingList( String member_email );
		
		
		List<Map<String, String>> getReturnList( String member_email );
			
		
		List<Map<String, String>> myWriterList( String member_email );
		
		
		int isCorrectPwd(Map emailPwd ); 
		
		int upPwd(Map emailPwd);
		
int delBookNo(int no);
		
		int upToolStatus(int no);
}
