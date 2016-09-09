package com.kedu.gany.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kedu.gany.dao.GanyDao;
import com.kedu.gany.dto.GanyDto;
//<<<<<<< HEAD
import com.kedu.util.Action;

public class GanyWriteAction implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		GanyDto gnDto = new GanyDto();
		GanyDao gnDao = GanyDao.getInstance();
//		System.out.println("넘어감");
		gnDto.setEmpno(gnDao.GetEmno());
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
		
		int result = gnDao.insertGany(gnDto);
		System.out.println("Result GWA : " + result);
		System.out.println("GWA dto : " + gnDto);
		System.out.println("GWA deptno : " + gnDto.getEmpno());
		if( result == 1) {
			gnDto = gnDao.lastInsert(gnDto.getEmpno());
		}
		
		System.out.println("last gnDto : " + gnDto);
		
		JSONObject json = new JSONObject();
		json.put("empno", gnDto.getEmpno());
		json.put("deptno", gnDto.getDeptno());
		json.put("jobno", gnDto.getJobno());
		json.put("id", gnDto.getId());
		json.put("ename", gnDto.getEname());
		json.put("email", gnDto.getEmail());
		json.put("pswd", gnDto.getPswd());
		json.put("fjumin", gnDto.getFjumin());
		json.put("bjumin", gnDto.getBjumin());
		json.put("hiredate",gnDto.getHiredate());
		json.put("resigndate", gnDto.getResigndate());
		json.put("zipcode", gnDto.getZipcode());
		json.put("addr", gnDto.getAddr());
		json.put("deaddr", gnDto.getDeaddr());
		json.put("sal", gnDto.getSal());
		json.put("etc", gnDto.getEtc());
		json.put("eregdate", gnDto.getEregdate());
		json.put("epic", gnDto.getEpic());
		json.put("admin", gnDto.getAdmin());
		
		System.out.println("Json action : " + json);
		
		response.setContentType("charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
	}

}
