package com.kedu.gany.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kedu.gany.dao.GanyDao;
import com.kedu.gany.dto.GanyDto;
//<<<<<<< HEAD
import com.kedu.util.Action;

public class GanyListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/gany/ganyList.jsp";
		
		GanyDao gaDao = GanyDao.getInstance();
		
		List<GanyDto> ganyList = gaDao.selectAllGany();
		System.out.println("ganyList : " + ganyList);
		request.setAttribute("ganyList", ganyList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
//=======
//
//
//public class GanyListAction implements Action {
//
//	@Override
//	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String url = "/gany/ganyList.jsp";
//		
//		GanyDao gaDao = GanyDao.getInstance();
//		
//		List<GanyDto> gaList = gaDao.selectAllGany();
//		
//		request.setAttribute("gaList", gaList);
//		
//		RequestDispatcher dispztcher = request.getRequestDispatcher(url);
//		dispztcher.forward(request, response);
//>>>>>>> refs/remotes/origin/master
		
	}

}
