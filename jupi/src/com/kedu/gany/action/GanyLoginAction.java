package com.kedu.gany.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kedu.gany.dao.GanyDao;
import com.kedu.gany.dto.GanyDto;
import com.kedu.util.Action;

public class GanyLoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="/gany/login.jsp";
		
		String id = request.getParameter("id");
		String pswd = request.getParameter("pswd");
		System.out.println("id1 = " + id + ", pswd = " + pswd);
		
		GanyDao gaDao = GanyDao.getInstance();
		int result = gaDao.userCheck(id, pswd);
		System.out.println("resultLA : " + result);
		if(result == 1) {
			GanyDto gaDto = gaDao.getGany(id);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", gaDto);
			url="/gany/ganyList.jsp";
		} else if (result == -1) {
			/*request.setAttribute("message", "아이디, 비밀번호를 입력 해주세요.");*/
		} else if (result == 0) {
			request.setAttribute("message", "비밀번호가 맞지 않습니다.");
		} 
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
