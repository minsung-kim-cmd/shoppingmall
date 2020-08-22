package carservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.CartDao;

public class CartDelete implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String cid = (String) session.getAttribute("cid");
		String pcode = request.getParameter("pcode");
		String poption = request.getParameter("poption");
		
		CartDao cd = CartDao.getInstance();
		int result = cd.delete(pcode,cid,poption);

		request.setAttribute("result", result);
		return "cartDelete";
	}

}
