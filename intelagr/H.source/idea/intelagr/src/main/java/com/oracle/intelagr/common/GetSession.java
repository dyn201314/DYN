package com.oracle.intelagr.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oracle.intelagr.entity.User;

public class GetSession {
	public static User getSessionEntity(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null) {
			return (User) session.getAttribute("user");
		}
		return new User();
	}

	public static void setSessionEntity(User user, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		if(user.getUserType().equals(Constants.USER_TYPE_COMPANY)){
			session.setAttribute("isCompanyUser", "true");
		}else{
			session.setAttribute("isCompanyUser", "false");
		}
	}
	
	public static void removeSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("isCompanyUser");
	}
}