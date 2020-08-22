package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import model.Customer;
import service.CommandProcess;
public class CusUpdateForm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String cno = (String)session.getAttribute("cno");
		CustomerDao cd = CustomerDao.getInstance();
		Customer customer  = cd.select(cno);
		request.setAttribute("customer", customer);
		return "updateForm";
	}
}