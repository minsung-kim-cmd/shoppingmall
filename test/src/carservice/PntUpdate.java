package carservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDao;
import model.Cart;
import carservice.CommandProcess;
public class PntUpdate implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response){
		int pcount = Integer.parseInt(request.getParameter("pcount"));
		String ccode = request.getParameter("ccode");
	
		System.out.println(pcount);
		System.out.println(ccode);
		
		CartDao cd = CartDao.getInstance();
		Cart cart = new Cart();
		cart.setCcode(ccode);
		cart.setPcount(pcount);
		int result = cd.updatePnt(cart);
		request.setAttribute("result", result);
		return "pntUpdate";
	}
}
