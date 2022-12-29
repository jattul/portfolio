package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<Map<String, String>> getReportBoard(  ){
		List<Map<String,String>> reportList = this.sqlSession.selectList(
				"com.naver.erp.AdminDAO.getReportBoard"
		);
		return reportList;
	}


	
	
	public int getTotMember(  ){
		int totMember = this.sqlSession.selectOne(
				"com.naver.erp.AdminDAO.getTotMember"
		);
		return totMember;
	};

	
	public int getTotJijum(  ){
		int totJijum = this.sqlSession.selectOne(
				"com.naver.erp.AdminDAO.getTotJijum"
		);
		return totJijum;
	};
	
	public int getTotTool(  ){
		int totTool = this.sqlSession.selectOne(
				"com.naver.erp.AdminDAO.getTotTool"
		);
		return totTool;
	};
	
	public int getTotOnRental(  ){
		int totOnRental = this.sqlSession.selectOne(
				"com.naver.erp.AdminDAO.getTotOnRental"
		);
		return totOnRental;
	};
	


	public int getTotOnBooking(  ){
		int totOnBooking = this.sqlSession.selectOne(
				"com.naver.erp.AdminDAO.getTotOnBooking"
		);
		return totOnBooking;
	};
	
	
	
	
	
	
	
	
	
	
	public int getReportListTotCnt( ReportDTO reportDTO ) {
		int reportListTotCnt = this.sqlSession.selectOne(
				"com.naver.erp.AdminDAO.getReportListTotCnt"
				,reportDTO
			);
		return reportListTotCnt;
	}
	
	
	public List<Map> getOnBooking( ) {
		List<Map> onBooking = this.sqlSession.selectList(
				"com.naver.erp.AdminDAO.getOnBooking"
				
			);
		return onBooking;
	}
	
	public List<Map> getOnRental(  ) {
		List<Map> onRental = this.sqlSession.selectList(
				"com.naver.erp.AdminDAO.getOnRental"
				
			);
		return onRental;
	}
	
	//////////////////
	public List<Map> getOnBook(int no) {
		List<Map> onBook = this.sqlSession.selectList(
				"com.naver.erp.AdminDAO.getOnBook"
				,no
				
				);
		return onBook;
		
		
	}
	
	public int insertBook(Map info) {
		int book = this.sqlSession.insert(
				"com.naver.erp.AdminDAO.insertBook"
				,info
				);
		return book;
	}
	
	
	
	public int upBook(int no) {
		int book = this.sqlSession.delete(
				"com.naver.erp.AdminDAO.upBook"
				,no
				
				);
		return book;
		
		
	}
	
	
	public List<Map> getOnRentals(int no){
		List<Map> onRentals = this.sqlSession.selectList(
				"com.naver.erp.AdminDAO.getOnRentals"
				,no
				);
		return onRentals;
		
		
	}
	
	public int insertReturn(Map info) {
		int returns = this.sqlSession.insert(
				"com.naver.erp.AdminDAO.insertReturn"
				,info
				);
		return returns; 
		
	}
	
	
	public int upReturn(int no) {
		int returns = this.sqlSession.delete(
				"com.naver.erp.AdminDAO.upReturn"
				,no
				);
		return returns;
		
		
	}
	
	public int upStat(int no) {
		int stat = this.sqlSession.update(
				"com.naver.erp.AdminDAO.upStat"
				,no
				);
		return stat;
		
	}
	
	
}
