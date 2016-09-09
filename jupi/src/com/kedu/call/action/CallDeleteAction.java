package com.kedu.call.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kedu.call.dao.CallDao;
import com.kedu.util.Action;

public class CallDeleteAction implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String notno = request.getParameter("notno");
		
		CallDao caDao = CallDao.getInstance();
		int result = caDao.deleteCall(Integer.parseInt(notno));
		JSONObject json = new JSONObject();
		if(result == 1) {
			json.put("msg", "success");
		} else {
			json.put("msg", "fail");
		}
		new CallListAction().execute(request, response);
	}

}
