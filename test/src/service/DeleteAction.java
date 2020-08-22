package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;

public class DeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String cid = (String)session.getAttribute("cid");
		CustomerDao cd = CustomerDao.getInstance();
		int result = cd.delete(cid);
		if(result > 0) {
			session.invalidate(); //탈퇴하면 세션 삭제
		}
		request.setAttribute("result", result);
		return "delete";
	}

}
