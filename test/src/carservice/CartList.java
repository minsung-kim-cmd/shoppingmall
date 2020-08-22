package carservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.CartDao;
import model.Cart;
public class CartList implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String cid = (String)session.getAttribute("cid");
		CartDao cd = CartDao.getInstance();
		List<Cart> list = cd.list(cid);
		request.setAttribute("list", list);
		return "cartList";
	}
}