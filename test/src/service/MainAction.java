package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import model.Customer;

public class MainAction implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String cid = (String)session.getAttribute("cid");
		System.out.println("id : "+cid);
		if(cid != null) {
			CustomerDao cd = CustomerDao.getInstance();
			Customer customer = cd.select(cid);
			//request.setAttribute("customer", customer );
			if(customer != null)
				session.setAttribute("cid", cid);
		}
		return "main";
	}
	
}
