package com.kedu.euro.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kedu.euro.dao.EuroDao;
import com.kedu.euro.dto.EuroDto;
import com.kedu.util.Action;

public class EuroViewAction implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		EuroDto euDto = new EuroDto();
		euDto.setProno(Integer.parseInt(request.getParameter("prono")));
		
		EuroDao euDao = EuroDao.getInstance();
		
		euDto = euDao.selectOneByProno(Integer.parseInt(request.getParameter("prono")));
		
		JSONObject json = new JSONObject();
		
		json.put("prono", euDto.getProno());
		json.put("pname", euDto.getPname());
		json.put("prosta", euDto.getProsta());
		json.put("penddate", euDto.getPenddate());
		json.put("pregdate", euDto.getPregdate());
		json.put("pcontent", euDto.getPcontent());

		response.setContentType("charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		
	}

}
