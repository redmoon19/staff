package com.kedu.gany.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kedu.gany.dao.GanyDao;
import com.kedu.gany.dto.GanyDto;

public class GanyWriteAction implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GanyDto gnDto = new GanyDto();
		
		gnDto.setEmpno(request.getParameter("empno"));
		gnDto.setDeptno(request.getParameter("deptno"));
		gnDto.setJobno(request.getParameter("jobno"));
		gnDto.setId(request.getParameter("id"));
		gnDto.setPswd(request.getParameter("pswd"));
		gnDto.setEname(request.getParameter("ename"));
		gnDto.setFjumin(request.getParameter("fjumin"));
		gnDto.setBjumin(request.getParameter("bjumin"));
		gnDto.setHiredate(request.getParameter("hiredate"));
		gnDto.setResigndate(request.getParameter("resigndate"));
		gnDto.setEmail(request.getParameter("email"));
		gnDto.setZipcode(request.getParameter("zipcode"));
		gnDto.setAddr(request.getParameter("addr"));
		gnDto.setDeaddr(request.getParameter("deaddr"));
		gnDto.setSal(Integer.parseInt(request.getParameter("sal")));
		gnDto.setEtc(request.getParameter("etc"));
		gnDto.setEregdate(request.getParameter("eregdate"));
		gnDto.setEpic(request.getParameter("epic"));
		gnDto.setAdmin(request.getParameter("admin"));
		
		GanyDao gnDao = GanyDao.getInstance();
		
		int result = gnDao.insertGany(gnDto);
		System.out.println("Result : " + result);
		
		if( result == 1) {
			gnDto = gnDao.lastInsert();
		}
		
		System.out.println("last gnDto : " + gnDto);
		
		JSONObject json = new JSONObject();
		json.put("empno", gnDto.getEmpno());
		json.put("deptno", gnDto.getDeptno());
		json.put("jobno", gnDto.getJobno());
		json.put("ename", gnDto.getEname());
		
		System.out.println("Json action : " + json);
		
		response.setContentType("charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
	}

}
