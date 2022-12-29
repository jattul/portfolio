package com.naver.erp;

import java.util.Map;

import org.springframework.stereotype.Repository;


public interface LoginDAO {
	public int getCntLogin(Map<String,String> idPwd );
	public int joinMember(Map<String,String> member);
}
