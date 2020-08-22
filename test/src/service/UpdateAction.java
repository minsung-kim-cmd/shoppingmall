package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;
import model.Customer;

public class UpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String cid = request.getParameter("cid");
		String cpass = request.getParameter("cpass");
		String cname = request.getParameter("cname");
		String ctel = request.getParameter("ctel");
		String caddr = request.getParameter("address");
		String cdetailaddr = request.getParameter("detailAddress");
		String cpostcode = request.getParameter("cpostcode");
		String cemail = request.getParameter("cemail");
		String cbir = request.getParameter("cbir");
		
		Customer customer = new Customer();
		customer.setCid(cid);
		customer.setCaddr(caddr);
		customer.setCtel(ctel);
		customer.setCpass(cpass);
		customer.setCname(cname);
		customer.setCemail(cemail);
		customer.setCbir(cbir);
		customer.setCpostcode(cpostcode);
		customer.setCdetailaddr(cdetailaddr);
		
		CustomerDao cd = CustomerDao.getInstance();
		int result = cd.update(customer);
		request.setAttribute("result", result);
		return "update";
	}

}
