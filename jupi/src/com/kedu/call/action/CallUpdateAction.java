package com.kedu.call.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kedu.call.dao.CallDao;
import com.kedu.call.dto.CallDto;
import com.kedu.util.Action;

public class CallUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CallDto caDto = new CallDto();
		
		caDto.setNotno(Integer.parseInt(request.getParameter("notno")));
		caDto.setEmpno(request.getParameter("empno"));
		caDto.setNotname(request.getParameter("notname"));
		caDto.setNotdate(request.getParameter("notdate"));
		caDto.setNothits(Integer.parseInt(request.getParameter("nothits")));
		caDto.setNotcon(request.getParameter("notcon"));
		caDto.setNotdel(request.getParameter("notdel"));
		
		CallDao caDao = CallDao.getInstance();
		caDao.updateCall(caDto);
		
		new CallListAction().execute(request, response);
	}

}
