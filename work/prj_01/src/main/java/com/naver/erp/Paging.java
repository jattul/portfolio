package com.naver.erp;

import java.util.HashMap;
import java.util.Map;

public class Paging {
	
	public static Map<String,Integer> getPagingMap(
		int selectPageNo
		, int rowCntPerPage
		, int totCnt
	) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		try {
			if( totCnt==0 ) {
				map.put("selectPageNo", selectPageNo);
				map.put("last_pageNo", 0);
				map.put("begin_rowNo", 0);
				map.put("end_rowNo", 0);
				map.put("begin_pageNo_perPage", 0);
				map.put("end_pageNo_perPage", 0);
				return map;
		}
			if( selectPageNo<=0 ) { selectPageNo = 1; }
			if( rowCntPerPage<=0 ) { rowCntPerPage = 10; }
			//----------------------------------------------------------
			int last_pageNo = totCnt/rowCntPerPage; 
				if( totCnt%rowCntPerPage>0 ) { last_pageNo++; }
				if( last_pageNo<selectPageNo ) { selectPageNo = last_pageNo; }
			//----------------------------------------------------------
			int end_rowNo = selectPageNo * rowCntPerPage;
			int begin_rowNo = end_rowNo - rowCntPerPage + 1;
				if( end_rowNo>totCnt ) { end_rowNo = totCnt; }
			//----------------------------------------------------------
			int pageNoCnt_perPage = 10;
			int begin_pageNo_perPage = (int)Math.floor( (selectPageNo-1)/pageNoCnt_perPage )*pageNoCnt_perPage + 1;
			int end_pageNo_perPage = begin_pageNo_perPage + pageNoCnt_perPage - 1;

				if( end_pageNo_perPage>last_pageNo ) {
					end_pageNo_perPage = last_pageNo;
				}
			//----------------------------------------------------------
			map.put("selectPageNo", selectPageNo);
			map.put("last_pageNo", last_pageNo);
			map.put("begin_rowNo", begin_rowNo);
			map.put("serialNo_asc", begin_rowNo);
			map.put("serialNo_desc", totCnt - begin_rowNo + 1 );
			map.put("end_rowNo", end_rowNo);
			map.put("begin_pageNo_perPage", begin_pageNo_perPage);
			map.put("end_pageNo_perPage", end_pageNo_perPage);
			//----------------------------------------------------------			
			return map;
			
		}catch(Exception ex){
			return new HashMap<String,Integer>();
		}
	}
}
