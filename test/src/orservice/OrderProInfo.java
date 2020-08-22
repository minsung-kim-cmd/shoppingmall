package orservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDao;
import model.Order1;

public class OrderProInfo implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String ocode = request.getParameter("ocode");
		String cid = request.getParameter("cid");
		
		OrderDao od = OrderDao.getInstance();
		List<Order1> order = od.select(ocode,cid);
		
		request.setAttribute("order", order);
		return "orderProInfo";
	}

}
