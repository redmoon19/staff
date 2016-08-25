package com.kedu.gany.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kedu.gany.dao.GanyDao;

public class GanyDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String empno = request.getParameter("empno");
		
		GanyDao gaDao = GanyDao.getInstance();

		gaDao.deleteGany(empno);
		
		new GanyListAction().execute(request, response);
	}

}
