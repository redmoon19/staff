package com.kedu.gany.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kedu.gany.dao.GanyDao;
import com.kedu.gany.dto.GanyDto;
//<<<<<<< HEAD
import com.kedu.util.Action;

public class GanyUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String url = "/gany/ganyUpdate.jsp";
		
		String empno = request.getParameter("empno");
		
		GanyDao gaDao = GanyDao.getInstance();
		
		GanyDto gaDto = gaDao.selectOneByEmpno(empno);
		
		request.setAttribute("gany", gaDto);
//=======
//
//public class GanyUpdateFormAction implements Action {
//
//	@Override
//	public void execute(HttpServletRequest request, HttpServletResponse response) 
//			throws ServletException, IOException {
//		String url = "/gany/ganyUpdate.jsp";
//		
//		String empno = request.getParameter("empno");
//		
//		GanyDao gaDao = GanyDao.getInstance();
//		
//		GanyDto gaDto = gaDao.selectOneGanyByEmpno(empno);
//		
//		request.setAttribute("ga", gaDto);
//>>>>>>> refs/remotes/origin/master
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
