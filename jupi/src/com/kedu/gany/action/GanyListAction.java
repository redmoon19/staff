package com.kedu.gany.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kedu.gany.dao.GanyDao;
import com.kedu.gany.dto.GanyDto;


public class GanyListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/gany/ganyList.jsp";
		
		GanyDao gaDao = GanyDao.getInstance();
		
		List<GanyDto> gaList = gaDao.selectAllGany();
		
		request.setAttribute("gaList", gaList);
		
		RequestDispatcher dispztcher = request.getRequestDispatcher(url);
		dispztcher.forward(request, response);
		
	}

}
