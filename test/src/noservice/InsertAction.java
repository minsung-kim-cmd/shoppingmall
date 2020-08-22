package noservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDao;
import model.Notice;

public class InsertAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String nsubject = request.getParameter("nsubject");
		String ncontent = request.getParameter("ncontent");
		Notice notice = new Notice();
		notice.setNcontent(ncontent);
		notice.setNsubject(nsubject);
		NoticeDao nd = NoticeDao.getInstance();
		int result = nd.insert(notice);
		request.setAttribute("result", result);
		return "insert";
	}

}
