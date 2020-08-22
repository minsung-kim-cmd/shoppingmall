package noservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDao;

public class DeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int ncode = Integer.parseInt(request.getParameter("ncode"));
		NoticeDao nd = NoticeDao.getInstance();
		int result = nd.delete(ncode);
		request.setAttribute("result", result);
		return "delete";
	}

}
