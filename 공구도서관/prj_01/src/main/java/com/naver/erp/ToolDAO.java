package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface ToolDAO {
	
	List<Map<String,String>> getToolList(ToolDTO toolDTO);
	
	List<Map<String,String>> getsmallList(ToolDTO toolDTO);

	List<Map<String,String>> getJijumList(ToolDTO toolDTO);
	
	List<Map> getToolDetailFromTool(int no);
	
	List<Map> getToolDetailFromJijum(int jijumno);
	
	int toolListTotCnt(ToolDTO toolDTO);
	
	int upToolStatus(int no);
	
	int insertToolRentBooktoOnBooking(Map bookInfo);
	
}
