package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;
import model.Customer;

public class Confirm implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String cid = request.getParameter("cid");
		CustomerDao cd = CustomerDao.getInstance();
		int result = cd.idcheck(cid);
		request.setAttribute("cid", cid);
		request.setAttribute("result", result);
		return "confirm";
	}

}
