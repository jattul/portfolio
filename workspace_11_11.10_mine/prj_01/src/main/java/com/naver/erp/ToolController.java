package com.naver.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ToolController {
	
	@Autowired 
	private ToolDAO toolDAO;
	
	@Autowired
	private MyPageDAO myPageDAO;   
	
	@RequestMapping(value="/toolRentMainForm.do")
	public ModelAndView toolRentMain(
			ToolDTO toolDTO
	) {
		
		int toolTotCnt = this.toolDAO.toolListTotCnt(toolDTO);
		
		Map<String,Integer> pagingMap = Paging.getPagingMap(
				toolDTO.getSelectPageNo( )
				, toolDTO.getRowCntPerPage( )
				, toolTotCnt
		);
		toolDTO.setSelectPageNo((int)pagingMap.get("selectPageNo"));
		toolDTO.setBegin_rowNo((int)pagingMap.get("begin_rowNo"));
		toolDTO.setEnd_rowNo((int)pagingMap.get("end_rowNo") - 1);
		
		List<Map<String,String>> toolList =  this.toolDAO.getToolList(toolDTO);	
		
		List<Map<String,String>> smallList =  this.toolDAO.getsmallList(toolDTO);			

		List<Map<String,String>> jijumList =  this.toolDAO.getJijumList(toolDTO);	
		
		ModelAndView mav = new ModelAndView();
		
		
		mav.addObject("toolList",toolList);
		mav.addObject("smallList",smallList);
		mav.addObject("jijumList",jijumList);
		mav.addObject("toolDTO" , toolDTO );
		mav.addObject("toolTotCnt",toolTotCnt);
		mav.addObject("pagingMap",pagingMap);
		mav.addObject("selectPageNo" , (int)pagingMap.get("selectPageNo") );
		mav.setViewName("toolRentMainForm.jsp");
		
		return mav;
	}
	
	@RequestMapping( value="/toolRentDetail.do" )
	public ModelAndView toolRentDetail(
			@RequestParam(value="no") int no
			,@RequestParam(value="jijumno") int jijumno
			,ToolDTO toolDTO
			) {
		ModelAndView mav = new ModelAndView();
		
		List<Map> jijums = this.toolDAO.getToolDetailFromJijum(jijumno);
		List<Map> tools = this.toolDAO.getToolDetailFromTool(no);
		
		
		mav.addObject("tools",tools.get(0));
		mav.addObject("jijums",jijums.get(0));
		mav.addObject("toolDTO" , toolDTO );
		mav.setViewName("toolRentDetail.jsp");
		
		return mav;
	}
	
	
	@RequestMapping( value="/toolRentBook.do" )
	public ModelAndView toolRentBook(
			@RequestParam(value="no") int no
			,@RequestParam(value="jijumno") int jijumno
			,HttpSession session
			) {
		ModelAndView mav = new ModelAndView();
		
		List<Map> jijums = this.toolDAO.getToolDetailFromJijum(jijumno);
		List<Map> tools = this.toolDAO.getToolDetailFromTool(no);
		
		String email = (String)session.getAttribute("email");

		List<Map<String,String>> memberInfo =  this.myPageDAO.getMemberInfo(email);
	
		mav.addObject("tools",tools.get(0));
		mav.addObject("jijums",jijums.get(0));
		mav.addObject("memberInfo",memberInfo);
		
		mav.setViewName("toolRentBook.jsp");
		
		return mav;
	}
	
	
	@RequestMapping( value="/upToolStatusProc.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8")

	@ResponseBody
	public int toolStatusProc(

			@RequestParam(value="no") int no
			,@RequestParam(value="jijumno") int jijumno
			,@RequestParam(value="bookDate") String bookDate
			,@RequestParam(value="toolname") String toolname
			,HttpSession session
			) {
		
		int upToolCnt = this.toolDAO.upToolStatus(no);
		
		Map bookInfo = new HashMap();
		
		bookInfo.put("email",(String)session.getAttribute("email"));
		bookInfo.put("memberemail",(String)session.getAttribute("email"));
		bookInfo.put("no",no);
		bookInfo.put("jijumno",jijumno);
		bookInfo.put("bookDate",bookDate);
		bookInfo.put("toolname",toolname);
		bookInfo.put("upToolCnt",upToolCnt+"");
		
		int insertOnBookingCnt = this.toolDAO.insertToolRentBooktoOnBooking(bookInfo);
		
		
		int resultCnt = upToolCnt + insertOnBookingCnt;
		
		
		
		
		
		return resultCnt;
	}
	
	
	
	
}
