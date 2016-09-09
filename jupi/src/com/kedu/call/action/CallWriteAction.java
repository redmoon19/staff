package com.kedu.call.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kedu.call.dao.CallDao;
import com.kedu.call.dto.CallDto;
import com.kedu.util.Action;

public class CallWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CallDto caDto = new CallDto();
		
		caDto.setEmpno(request.getParameter("empno"));
		caDto.setNotname(request.getParameter("notname"));
		caDto.setNotcon(request.getParameter("notcon"));
		
		CallDao caDao = CallDao.getInstance();
		caDao.insertCall(caDto);
		
		new CallListAction().execute(request, response);
	}

}
