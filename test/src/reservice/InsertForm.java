package reservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pcode = request.getParameter("pcode");
		request.setAttribute("pcode",pcode);
		return "rinsertForm";
	}

}
