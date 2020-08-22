package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;

public class IdfindAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String cname = request.getParameter("cname");
		String cbir = request.getParameter("cbir");
		CustomerDao cd = CustomerDao.getInstance();
		String cid = "";
		cid = cd.idfind(cname,cbir);
		request.setAttribute("cid", cid);
		return "idfind";
	}

}
