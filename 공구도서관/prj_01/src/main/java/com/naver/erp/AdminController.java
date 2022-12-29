package com.naver.erp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	@Autowired
	private AdminDAO adminDAO;   
	

	@RequestMapping( value="/adminStatsForm.do")
	public ModelAndView adminStatsForm( ){
		ModelAndView mav = new ModelAndView();
		
		int totMember =  this.adminDAO.getTotMember(  );
		int totJijum =  this.adminDAO.getTotJijum(  );
		int totTool =  this.adminDAO.getTotTool(  );
		int totOnRental =  this.adminDAO.getTotOnRental(  );
		int totOnBooking =  this.adminDAO.getTotOnBooking(  );

		mav.addObject("totMember", totMember );
		mav.addObject("totJijum", totJijum );
		mav.addObject("totTool", totTool );
		mav.addObject("totOnRental", totOnRental );
		mav.addObject("totOnBooking", totOnBooking );
		mav.setViewName( "adminStatsForm.jsp" );
		return  mav;
	};


	@RequestMapping( value="/adminReportForm.do")
	public ModelAndView getReportBoard(  ) {
		System.out.println("getReportBoard 메소드 진입");
		
		List<Map<String,String>> reportList =  this.adminDAO.getReportBoard( );
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("reportList", reportList );
		System.out.println(reportList);
		mav.setViewName( "adminReportForm.jsp" );
		System.out.println("getReportBoard 메소드 완료");
		return mav;
		
	}

	@RequestMapping( value="/adminBookForm.do")
	public ModelAndView getAdminBookForm(  ) {
		
		List<Map> onBookList = new ArrayList();
		List<Map> onRentalList = new ArrayList();
		onBookList = this.adminDAO.getOnBooking();
		onRentalList = this.adminDAO.getOnRental();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("onBookList",onBookList);
		mav.addObject("onRentalList",onRentalList);
		
	
		mav.setViewName( "adminBookForm.jsp" );
		return mav;
		
	}
	
	
	
	///////////////////////////
	@RequestMapping( value="/upBook.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8")

	@ResponseBody
	public int upBook(
			
			@RequestParam(value="upBookNo") int upBookNo
			) {
		System.out.print(upBookNo);
		List<Map> onBookInfo = new ArrayList();
		onBookInfo = this.adminDAO.getOnBook(upBookNo);
		System.out.print(onBookInfo);
		Map infos = new HashMap();
		infos = onBookInfo.get(0);
		System.out.print(infos);
		int insertCnt = this.adminDAO.insertBook(infos);
		System.out.print("여기까지됨");
		int upCnt = this.adminDAO.upBook(upBookNo);
		System.out.print(upCnt);
		
		
		
		
		return upCnt;
	}

	@RequestMapping( value="/upRental.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8")

	@ResponseBody
	public int upRental(
			
			@RequestParam(value="upRentalNo") int upRentalNo
			) {
		List<Map> onRentalInfo = new ArrayList();
		onRentalInfo = this.adminDAO.getOnRentals(upRentalNo);
		
		Map infos = new HashMap();
		infos = onRentalInfo.get(0);
		int upStat = this.adminDAO.upStat(upRentalNo);
		int insertCnt = this.adminDAO.insertReturn(infos);
		
		int upCnt = this.adminDAO.upReturn(upRentalNo);
		System.out.print("upRentalNo = "+ upRentalNo);
		
		System.out.print("upStat = " + upStat);
		
		
		return upCnt;
	}
	
	
	
	
	
}
