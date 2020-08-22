package carservice;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibatis.sqlmap.engine.scope.SessionScope;

import dao.CartDao;
import model.Cart;
public class CartInsert implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String cid = (String)session.getAttribute("cid");
		String cname = request.getParameter("pname");
		int cprice = Integer.parseInt(request.getParameter("pprice"));
		String pcode = request.getParameter("pcode");
		int pcount = Integer.parseInt(request.getParameter("pcount"));
		String pimage = request.getParameter("pimage");
		String poption = request.getParameter("poption");
		
		
		int result=0;
		CartDao cd = CartDao.getInstance();
		Cart pc = cd.proselect(pcode,cid,poption);
	    if(pc==null) {
	    	Cart cart = new Cart();
	    	cart.setCname(cname);
	    	cart.setCprice(cprice);
	    	cart.setPcode(pcode);
	    	cart.setPcount(pcount);
	    	cart.setCid(cid);
	    	cart.setPimage(pimage);
	    	cart.setPoption(poption);
	    	result = cd.insertCart(cart);
	    }else {
	    	result=-1;
	    }
	    request.setAttribute("result", result);
		return "cartInsert";
	}

}
