package proservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import model.Customer;

public class UpdateForm implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String cid = (String)session.getAttribute("cid");
		CustomerDao cd = CustomerDao.getInstance();
		Customer customer = cd.select(cid);
		request.setAttribute("customer", customer);
		return "updateForm";
	}

}
