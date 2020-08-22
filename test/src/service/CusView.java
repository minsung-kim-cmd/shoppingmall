package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;
import model.Customer;

public class CusView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String cno = request.getParameter("cno");
		CustomerDao cd = CustomerDao.getInstance();
		Customer customer = cd.cusselect(cno);
		request.setAttribute("customer",customer);
		return "cusView";
	}

}
