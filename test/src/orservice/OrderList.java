package orservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderLDao;
import dao.ProductDao;
import model.OrderL;

public class OrderList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String cid = (String)session.getAttribute("cid");
		
		OrderLDao old = OrderLDao.getInstance();
		List<OrderL> orderlist = old.select(cid);
		
		request.setAttribute("list",orderlist);
		return "orderList";
	}

}
