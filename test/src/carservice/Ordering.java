package carservice;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDao;
import dao.CustomerDao;
import model.Cart;
import model.Customer;
import carservice.CommandProcess;
public class Ordering implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		String cid = (String)session.getAttribute("cid");
		String[] pcode = request.getParameterValues("pcode");
		String[] poption = request.getParameterValues("poption");

		CartDao cd = CartDao.getInstance();
		List<Cart> list = new ArrayList<Cart>();
		
		for(int i=0;i<pcode.length;i++) {
			list.add(cd.listOne(pcode[i],cid,poption[i]));
		}
		request.setAttribute("cart",list);
		CustomerDao ctd = CustomerDao.getInstance();
		Customer customer = ctd.select(cid);
		request.setAttribute("customer", customer);
		return "ordering";
	}
}
