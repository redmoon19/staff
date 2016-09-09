package com.kedu.call.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kedu.call.dao.CallDao;
import com.kedu.call.dto.CallDto;
import com.kedu.util.Action;

public class CallComListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CallDao caDao = CallDao.getInstance();
		
		List<CallDto> callList = caDao.selectOneByCom(Integer.parseInt(request.getParameter("notno")));
		
//		System.out.println("CCLA : " + jsonList);
		
//		JSONArray callList = JSONArray.fromObject(jsonList);
		
		response.setContentType("charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(callList);
	}

}
