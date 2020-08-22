package orservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import dao.ProductDao;
import model.Customer;
import model.Product;

public class BuyNow implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//상품정보
		String pcode = request.getParameter("pcode");
		int ordercnt = Integer.parseInt(request.getParameter("ordercnt"));
		String poption = request.getParameter("poption");
		HttpSession session = request.getSession();
		String cid = (String)session.getAttribute("cid");
		
		ProductDao pd = ProductDao.getInstance();
		Product product = pd.select(pcode);
		request.setAttribute("product", product);
		request.setAttribute("poption", poption);
		request.setAttribute("ordercnt", ordercnt);
		
		//배송지,회원 정보
		CustomerDao cd = CustomerDao.getInstance();
		Customer customer = cd.select(cid);
		request.setAttribute("customer", customer);
		return "buyNow";
	}

}
