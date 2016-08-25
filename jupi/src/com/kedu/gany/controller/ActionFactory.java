package com.kedu.gany.controller;

import com.kedu.gany.action.Action;
import com.kedu.gany.action.GanyDeleteAction;
import com.kedu.gany.action.GanyListAction;
import com.kedu.gany.action.GanyUpdateAction;
import com.kedu.gany.action.GanyUpdateFormAction;
import com.kedu.gany.action.GanyViewAction;
import com.kedu.gany.action.GanyWriteAction;

public class ActionFactory {

	private static ActionFactory instance = new ActionFactory();
	
	private ActionFactory() {
	}
	
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		
		if(command.equals("gany_list")){
			action = new GanyListAction();
//		} else if (command.equals("gany_write_form")){
//			action = new GanyWriteFormAction();
		} else if (command.equals("gany_write")){
			action = new GanyWriteAction();
		} else if (command.equals("gany_view")){
			action = new GanyViewAction();
		} else if (command.equals("gany_update_form")){
			action = new GanyUpdateFormAction();
		} else if (command.equals("gany_update")){
			action = new GanyUpdateAction();
		} else if (command.equals("gany_delete")){
			action = new GanyDeleteAction();
		}
		return action;
	}
}
