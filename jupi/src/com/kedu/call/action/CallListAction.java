package com.kedu.call.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kedu.call.dao.CallDao;
import com.kedu.call.dto.CallDto;
import com.kedu.util.Action;

public class CallListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/call/callList.jsp";
		
		CallDao caDao = CallDao.getInstance();
		
		List<CallDto> callList = caDao.selectAllGany();
		System.out.println("callList : " + callList);
		request.setAttribute("callList", callList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
