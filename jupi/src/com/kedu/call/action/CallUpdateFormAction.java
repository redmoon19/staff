package com.kedu.call.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kedu.call.dao.CallDao;
import com.kedu.call.dto.CallDto;
import com.kedu.util.Action;


public class CallUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String url = "/call/callUpdate.jsp";
		
		String notno = request.getParameter("notno");
		
		CallDao caDao = CallDao.getInstance();
		
		CallDto caDto = caDao.selectOneByNotno(notno);
		
		request.setAttribute("call", caDto);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
