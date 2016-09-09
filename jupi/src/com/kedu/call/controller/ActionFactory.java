package com.kedu.call.controller;

import com.kedu.call.action.CallComListAction;
import com.kedu.call.action.CallComWriteAction;
import com.kedu.call.action.CallDeleteAction;
import com.kedu.call.action.CallListAction;
import com.kedu.call.action.CallUpdateAction;
import com.kedu.call.action.CallUpdateFormAction;
import com.kedu.call.action.CallViewAction;
import com.kedu.call.action.CallWriteAction;
import com.kedu.call.action.CallWriteFormAction;
import com.kedu.util.Action;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();
	
	private ActionFactory() {
	}
	
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		System.out.println("commandAF : " + command);
		if(command.equals("call_list")){
			action = new CallListAction();
		} else if (command.equals("call_write_form")){
			action = new CallWriteFormAction();
		} else if (command.equals("call_write")){
			action = new CallWriteAction();
		} else if (command.equals("call_view")){
			action = new CallViewAction();
		} else if (command.equals("call_update_form")){
			action = new CallUpdateFormAction();
		} else if (command.equals("call_update")){
			action = new CallUpdateAction();
		} else if (command.equals("call_delete")){
			action = new CallDeleteAction();
		} else if (command.equals("call_com_list")){
			action = new CallComListAction();
		} else if (command.equals("call_com_write")){
			action = new CallComWriteAction();
		}
		return action;
	}

}
