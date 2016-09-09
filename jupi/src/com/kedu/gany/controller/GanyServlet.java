package com.kedu.gany.controller;

import java.io.IOException;
//<<<<<<< HEAD

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kedu.util.Action;


@WebServlet("/GanyServlet")
public class GanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GanyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		HttpSession session = request.getSession();
//		System.out.println("sessionS : " + session.getAttribute("loginUser"));
		
		
		String command = request.getParameter("command");
		String id = request.getParameter("id");
		System.out.println("idS : " + id);
		System.out.println("commandS : " + command);
		
		ActionFactory af = ActionFactory.getInstance();
		Action action = af.getAction(command);
		
		if(action != null) {
			action.execute(request, response); 
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
