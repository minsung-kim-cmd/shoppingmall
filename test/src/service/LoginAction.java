package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;

public class LoginAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String cid = request.getParameter("cid");
		String cpass = request.getParameter("cpass");
		CustomerDao cd = CustomerDao.getInstance();
		int result = cd.loginChk(cid,cpass);
		
		if(result >0) {
			HttpSession session = request.getSession();
			session.setAttribute("cid",cid);
		}
		request.setAttribute("result", result);
		return "login";
	}
	
}
