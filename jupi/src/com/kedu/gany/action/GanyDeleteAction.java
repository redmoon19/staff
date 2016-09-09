package com.kedu.gany.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//<<<<<<< HEAD
import org.json.simple.JSONObject;

import com.kedu.gany.dao.GanyDao;
import com.kedu.util.Action;

public class GanyDeleteAction implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String empno = request.getParameter("empno");
		
		GanyDao gaDao = GanyDao.getInstance();
		int result = gaDao.deleteGany(Integer.parseInt(empno));
		JSONObject json = new JSONObject();
		
		if(result == 1) {
			json.put("msg", "success");
		} else {
			json.put("msg", "fail");
		}
		
		new GanyListAction().execute(request, response);
	}

}
