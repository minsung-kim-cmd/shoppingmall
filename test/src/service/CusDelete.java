package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import service.CommandProcess;
public class CusDelete implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String cno = (String)session.getAttribute("cno");
		CustomerDao cd = CustomerDao.getInstance();
		int result = cd.deletecus(cno);
		if (result > 0) {
			session.invalidate();
		}
		request.setAttribute("result", result);
		return "cusDelete";
	}

}
