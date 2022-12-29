package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface AdminDAO {
	
	List<Map<String, String>> getReportBoard( );
	
	int getTotMember( );

	int getTotJijum(  );

	int getTotTool(  );

	int getTotOnRental( );

	int getTotOnBooking(  );
	
	int getReportListTotCnt( ReportDTO reportDTO );
	
	List<Map> getOnBooking();
	List<Map> getOnRental();
	int upBook(int no);
	int insertBook(Map info);
	List<Map> getOnBook(int no);
	List<Map> getOnRentals(int no);
	int insertReturn(Map info);
	int upReturn(int no);
	int upStat(int no);
}

/*


	// 총 신고당한 횟수구하기
	List<Map<String,String>> getRoportCount( ReportDTO reportDTO );

*/
