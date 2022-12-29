package com.naver.erp;

import java.util.Map;

import org.springframework.stereotype.Repository;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;


@Repository
public class LoginDAOImpl implements LoginDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getCntLogin( Map<String,String> idPwd ) {
		
		int login_idCnt = this.sqlSession.selectOne(
				"com.naver.erp.LoginDAO.getCntLogin" 
				, idPwd
		);
		
		return login_idCnt;
	}
	
	
	
	
}

