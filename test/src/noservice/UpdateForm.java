package noservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDao;
import model.Notice;

public class UpdateForm implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int ncode = Integer.parseInt(request.getParameter("ncode"));
		NoticeDao nd = NoticeDao.getInstance();
		Notice notice = nd.select(ncode);
		request.setAttribute("notice", notice);
		return "updateForm";
	}
}
