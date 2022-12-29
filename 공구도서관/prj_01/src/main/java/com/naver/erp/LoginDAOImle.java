package com.naver.erp;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAOImle implements LoginDAO {
	
	//==============================================
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//==============================================
	public int getCntLogin(Map<String,String> idPwd ) {
		System.out.println("getCntLogin 함수 시작");
		
		int login_idCnt = this.sqlSession.selectOne(
				"com.naver.erp.LoginDAO.getCntLogin" 
				, idPwd
		);
		
		System.out.println("getCntLogin 함수 종료");
		return login_idCnt;
	}

	
	//==============================================	
	public int joinMember(Map<String,String> member){
		System.out.println("joinMember 함수 시작");
		
		int boardRegCnt = sqlSession.insert(
				"com.naver.erp.LoginDAO.joinMember"
				,member
		);
		
		System.out.println("joinMember 함수 종료");
		return boardRegCnt;
	}
	

	
	
}
