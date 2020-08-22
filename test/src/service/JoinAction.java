package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;
import model.Customer;

public class JoinAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		CustomerDao cd = CustomerDao.getInstance();
		Customer customer = new Customer();
		int result = 0;
		String cid = request.getParameter("cid");
		if (cd.idcheck(cid) == 0) {
			String cpass = request.getParameter("cpass");
			String cname = request.getParameter("cname");
			String caddr = request.getParameter("address");
			String cdetailaddr = request.getParameter("detailAddress");
			String ctel = request.getParameter("ctel");
			String cemail = request.getParameter("cemail");
			String cbir = request.getParameter("cbir");
			String cpostcode = request.getParameter("cpostcode");

			customer.setCid(cid);
			customer.setCpass(cpass);
			customer.setCname(cname);
			customer.setCaddr(caddr);
			customer.setCtel(ctel);
			customer.setCemail(cemail);
			customer.setCbir(cbir);
			customer.setCpostcode(cpostcode);
			customer.setCdetailaddr(cdetailaddr);
			result = cd.insert(customer);
		}
		request.setAttribute("result", result);
		return "join";
	}

}
