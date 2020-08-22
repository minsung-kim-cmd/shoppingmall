package proservice;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Product;

public class MainList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String b_code = request.getParameter("b_code");
		String b_name = request.getParameter("b_name");
		ProductDao pd = ProductDao.getInstance();
		List<Product> list = pd.mainlist(b_code);
		request.setAttribute("list",list);
		request.setAttribute("b_name", b_name);
		return "mainList";
	}

}
