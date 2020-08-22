package reservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDao;

public class reviewChk implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String cid = (String)session.getAttribute("cid");
		String pcode = request.getParameter("pcode");
		System.out.println(cid+pcode);
		OrderDao order = OrderDao.getInstance();
		int result = order.chkpro(cid,pcode);
		request.setAttribute("pcode", pcode);
		request.setAttribute("result",result);
		return "reviewChk";
	}

}
