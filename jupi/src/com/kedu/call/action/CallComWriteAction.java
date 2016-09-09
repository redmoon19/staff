package com.kedu.call.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kedu.call.dao.CallDao;
import com.kedu.call.dto.CallDto;
import com.kedu.util.Action;

public class CallComWriteAction implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CallDto caDto = new CallDto();
		CallDao caDao = CallDao.getInstance();
		System.out.println("CWA : " + request.getParameter("notno"));
		caDto.setNotno(Integer.parseInt(request.getParameter("notno")));
		caDto.setEmpno(request.getParameter("empno"));
		caDto.setComcon(request.getParameter("comcon"));
	
		int result = caDao.insertCallCom(caDto);
		
		if( result == 1) {
			caDto = caDao.lastInsert();
		}
		
		JSONObject json = new JSONObject();
		json.put("notno", caDto.getNotno());
		json.put("comno", caDto.getComno());
		json.put("empno", caDto.getEmpno());
		json.put("comcon", caDto.getComcon());
		json.put("comdate", caDto.getComdate());
		json.put("comdel", caDto.getComdel());
		
		response.setContentType("charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		
	}

}
