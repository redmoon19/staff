package com.kedu.euro.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kedu.euro.dao.EuroDao;
import com.kedu.euro.dto.EuroDto;
import com.kedu.util.Action;

public class EuroListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/euro/euroList.jsp";
		
		EuroDao euDao = EuroDao.getInstance();
		
		List<EuroDto> euroList = euDao.selectAllEuro();
		
		request.setAttribute("euroList", euroList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
