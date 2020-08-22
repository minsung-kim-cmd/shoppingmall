package noservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDao;
import model.Notice;

public class UpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int ncode = Integer.parseInt(request.getParameter("ncode"));
		String nsubject = request.getParameter("nsubject");
		String ncontent = request.getParameter("ncontent");
		
		NoticeDao nd = NoticeDao.getInstance();
		int result = nd.update(ncode,nsubject,ncontent);
		request.setAttribute("result", result);
		return "update";
	}

}
