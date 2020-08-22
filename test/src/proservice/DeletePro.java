package proservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDao;
public class DeletePro implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pcode=request.getParameter("pcode");
		ProductDao pd = ProductDao.getInstance();
		int result = pd.delete(pcode);
		request.setAttribute("result", result);
		return "deletePro";
	}

}
