package orservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDao;
import dao.OrderDao;
import dao.OrderLDao;
import model.Order1;
import model.OrderL;
public class OrderAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//orderl
		int ocode = (int)(Math.random()*100000+1);
		String orderinfo="";
		String oname = request.getParameter("oname");
		String oaddr =request.getParameter("postcode")+" "+ request.getParameter("address")+" "+request.getParameter("detailAddress");
		String otel = request.getParameter("otel");
		HttpSession session = request.getSession();
		String cid = (String)session.getAttribute("cid");
		int ocount = Integer.parseInt(request.getParameter("ocount"));
		int oprice = Integer.parseInt(request.getParameter("oprice"));
		String omemo = request.getParameter("omemo");
		
		//order
		String[] pcode = request.getParameterValues("pcode");
		String[] pname = request.getParameterValues("pname");
		String[] pcount = request.getParameterValues("pcount");
		String[] pprice = request.getParameterValues("pprice");
		String[] poption = request.getParameterValues("poption");
		String[] pimage = request.getParameterValues("pimage");
		
		OrderDao od = OrderDao.getInstance();
		Order1 order = new Order1();
		order.setCid(cid);
		order.setOcode(ocode);
		if(pcode.length != 1) {
			for(int i=0; i<pcode.length;i++) {
				order.setPcode(pcode[i]);
				order.setPname(pname[i]);
				order.setPcount(Integer.parseInt(pcount[i]));
				order.setPimage(pimage[i]);
				order.setPoption(poption[i]);
				order.setPprice(Integer.parseInt(pprice[i]));
				od.insert(order);
			}
			orderinfo = pname[0]+"외 "+(pcode.length-1);
		}
		if(pcode.length == 1){
			order.setPcode(pcode[0]);
			order.setPname(pname[0]);
			order.setPcount(Integer.parseInt(pcount[0]));
			order.setPimage(pimage[0]);
			order.setPoption(poption[0]);
			order.setPprice(Integer.parseInt(pprice[0]));
			od.insert(order);
			orderinfo = pname[0];
		}
		CartDao cd = CartDao.getInstance();
		for(int i=0;i<pcode.length;i++) {
			cd.delete(pcode[i],cid,poption[i]);
		}
		OrderL orderlist = new OrderL();
		orderlist.setOcode(ocode);
		orderlist.setCid(cid);
		orderlist.setOaddr(oaddr);
		orderlist.setOcount(ocount);
		orderlist.setOmemo(omemo);
		orderlist.setOname(oname);
		orderlist.setOprice(oprice);
		orderlist.setOtel(otel);
		orderlist.setOinfo(orderinfo);
		OrderLDao old = OrderLDao.getInstance();
		old.insert(orderlist);
		request.setAttribute("list", orderlist);
		return "orderComfirm";
	}
}
