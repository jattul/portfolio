package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAOImpl implements MyPageDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<Map<String, String>> myWriterList(String sessionEmail){
		List<Map<String,String>> myWriterList = this.sqlSession.selectList(
				"com.naver.erp.MyPageDAO.myWriterList"
			   ,sessionEmail
		
		);

		return myWriterList;
		
		}
	
	
	
	// 현재 로그인된 회원의 email, 이름, 주소, 번호 가져오는것
	public List<Map<String, String>> getMemberInfo(String sessionEmail){
		List<Map<String,String>> memberInfo = this.sqlSession.selectList(
				"com.naver.erp.MyPageDAO.getMemberInfo"
			   ,sessionEmail
		
		);

		return memberInfo;
		
		}
	
	
	public List<Map<String, String>> getBookList( String member_email ){
		List<Map<String,String>> BookList = this.sqlSession.selectList(
				"com.naver.erp.MyPageDAO.getBookList"
				,member_email
		);
		return BookList;
	}
	

	// 빌린 공구를 대여해준 지점에 대한 정보 가져오기
	public List<Map<String, String>> getJijumList( ){
		List<Map<String,String>> jijumList = this.sqlSession.selectList(
				"com.naver.erp.MyPageDAO.getJijumList"
		);
		return jijumList;
	}
	
	

	
	public List<Map<String, String>> getOnBookingList( String member_email ){
		List<Map<String,String>> bookingList = this.sqlSession.selectList(
				"com.naver.erp.MyPageDAO.getOnBookingList"
				,member_email
		);
		return bookingList;
	}
	
	
	public List<Map<String, String>> getReturnList( String member_email ){
		List<Map<String,String>> returnList = this.sqlSession.selectList(
				"com.naver.erp.MyPageDAO.getReturnList"
				,member_email
		);
		return returnList;
	}	
	
	
	
	public int isCorrectPwd(Map emailPwd ) {
		int correctPwd = this.sqlSession.selectOne(
				"com.naver.erp.MyPageDAO.isCorrectPwd"
				,emailPwd
				
				);
				
		
		
		return correctPwd;
	};
	
	
	
	public int upPwd(Map emailPwd) {
		int Pwd = this.sqlSession.update(
				"com.naver.erp.MyPageDAO.upPwd"
				,emailPwd
				);
		
		return Pwd;
	};
	
	
	
	public int delBookNo(int no) {
		int BookNo = this.sqlSession.delete(
				"com.naver.erp.MyPageDAO.delBookNo"
				,no
				);
		return BookNo;
		
	}
	
	public int upToolStatus(int no) {
	
		int ToolStatus = this.sqlSession.update(
				"com.naver.erp.MyPageDAO.upToolStatus"
				,no
				);
			
		return ToolStatus;
	
	
	}
	
	
	
	
	
	

	
}
