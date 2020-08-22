package proservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Product;
public class UpdatePro implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pcode = request.getParameter("pcode");
		String pname = request.getParameter("pname");
		int pprice = Integer.parseInt(request.getParameter("pprice"));
		int pcount= Integer.parseInt(request.getParameter("pcount"));
		String pcon = request.getParameter("pcon");
		String b_code = request.getParameter("b_code");
		String a_code = request.getParameter("a_code");
		String poption = request.getParameter("poption");

		Product product = new Product();
		product.setPcode(pcode);
		product.setPname(pname);
		product.setPprice(pprice);
		product.setPcount(pcount);
		product.setPcon(pcon);
		product.setB_code(b_code);
		product.setA_code(a_code);
		product.setPoption(poption);
		
		ProductDao pd = ProductDao.getInstance();
		int result = pd.update(product);
		request.setAttribute("result", result);
		return "updatePro";
	}
}