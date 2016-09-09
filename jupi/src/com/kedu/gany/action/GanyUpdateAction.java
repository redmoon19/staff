package com.kedu.gany.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kedu.gany.dao.GanyDao;
import com.kedu.gany.dto.GanyDto;
//<<<<<<< HEAD
import com.kedu.util.Action;

public class GanyUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GanyDto gaDto = new GanyDto();
		
		gaDto.setEmpno(request.getParameter("empno"));
		gaDto.setDeptno(request.getParameter("deptno"));
		gaDto.setJobno(request.getParameter("jobno"));
		gaDto.setId(request.getParameter("id"));
		gaDto.setPswd(request.getParameter("pswd"));
		gaDto.setEname(request.getParameter("ename"));
		gaDto.setFjumin(request.getParameter("fjumin"));
		gaDto.setBjumin(request.getParameter("bjumin"));
		gaDto.setHiredate(request.getParameter("hiredate"));
		gaDto.setResigndate(request.getParameter("resigndate"));
		gaDto.setEmail(request.getParameter("email"));
		gaDto.setZipcode(request.getParameter("zipcode"));
		gaDto.setAddr(request.getParameter("addr"));
		gaDto.setDeaddr(request.getParameter("deaddr"));
//=======
//
//public class GanyUpdateAction implements Action {
//
//	@Override
//	public void execute(HttpServletRequest request, HttpServletResponse response) 
//			throws ServletException, IOException {
//		GanyDto gaDto = new GanyDto();
//		
//		gaDto.setEmpno(request.getParameter("empno"));
//		gaDto.setDeptno(request.getParameter("deptno"));
//		gaDto.setJobno(request.getParameter("jobno"));
//		gaDto.setId(request.getParameter("id"));
//		gaDto.setPswd(request.getParameter("pswd"));
//		gaDto.setEname(request.getParameter("ename"));
//		gaDto.setFjumin(request.getParameter("fjumin"));
//		gaDto.setBjumin(request.getParameter("bjumin"));
//		gaDto.setHiredate(request.getParameter("hiredate"));
//		gaDto.setResigndate(request.getParameter("resigndate"));
//		gaDto.setEmail(request.getParameter("email"));
//		gaDto.setZipcode(request.getParameter("zipcode"));
//		gaDto.setAddr(request.getParameter("addr"));
//>>>>>>> refs/remotes/origin/master
		gaDto.setSal(Integer.parseInt(request.getParameter("sal")));
		gaDto.setEtc(request.getParameter("etc"));
		gaDto.setEregdate(request.getParameter("eregdate"));
		gaDto.setEpic(request.getParameter("epic"));
		gaDto.setAdmin(request.getParameter("admin"));
		
		GanyDao gaDao = GanyDao.getInstance();
		gaDao.updateGany(gaDto);
		
		new GanyListAction().execute(request, response);
	}

}
