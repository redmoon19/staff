package com.kedu.euro.controller;

import com.kedu.euro.action.EuroListAction;
import com.kedu.euro.action.EuroViewAction;
import com.kedu.util.Action;

public class ActionFactory {

	private static ActionFactory instance = new ActionFactory();
	
	private ActionFactory() {
	}
	
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		
		/*확인용*/
		System.out.println("command-AF : " + command);
		
		Action action = null;
		if(command.equals("euro_list")){
			action = new EuroListAction();
		} else if(command.equals("euro_view")){
			action = new EuroViewAction();
		}
		return action;
	}
	
}
