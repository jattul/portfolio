package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ToolDAOImpl implements ToolDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String,String>> getToolList( ToolDTO toolDTO ){		
		List<Map<String,String>> getToolList = this.sqlSession.selectList(			
				"com.naver.erp.ToolDAO.getToolList"	
				,toolDTO 
		);
		return getToolList;
	}
	
	public List<Map<String,String>> getsmallList( ToolDTO toolDTO ){		
		List<Map<String,String>> getsmallList = this.sqlSession.selectList(			
				"com.naver.erp.ToolDAO.getsmallList"	
				,toolDTO 
		);
		return getsmallList;
	}
	
	public List<Map<String,String>> getJijumList( ToolDTO toolDTO ){		
		List<Map<String,String>> getJijumList = this.sqlSession.selectList(			
				"com.naver.erp.ToolDAO.getJijumList"	
				,toolDTO 
		);
		return getJijumList;
	}
	
	
	public int toolListTotCnt( ToolDTO toolDTO ) {
		int toolListTotCnt = this.sqlSession.selectOne(
				"com.naver.erp.ToolDAO.toolListTotCnt"
				,toolDTO
			);
		return toolListTotCnt;
	}

	public List<Map> getToolDetailFromTool(int no){
		List<Map> ToolDetailFromTool = this.sqlSession.selectList(
				"com.naver.erp.ToolDAO.getToolDetailFromTool"
				, no
				);
		return ToolDetailFromTool;	
	}
	
	public List<Map> getToolDetailFromJijum(int jijumno){
		List<Map> ToolDetailFromJijum = this.sqlSession.selectList(
				"com.naver.erp.ToolDAO.getToolDetailFromJijum"
				, jijumno
				);			
		return ToolDetailFromJijum;
	}
	
	
	public int upToolStatus(int no){
		int toolStatus = this.sqlSession.update(
				"com.naver.erp.ToolDAO.upToolStatus"
				,no
				);
			return toolStatus;
		}
		
	public int insertToolRentBooktoOnBooking(Map bookInfo) {
		int ToolRentBooktoOnBooking = this.sqlSession.insert(
				"com.naver.erp.ToolDAO.insertToolRentBooktoOnBooking"
				,bookInfo
				);
		
		return ToolRentBooktoOnBooking;
	}
		
		
	
	
}



	
	
	

