package proservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Product;
public class UpdateProForm implements CommandProcess  {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pcode=request.getParameter("pcode");
		ProductDao pd = ProductDao.getInstance();
		Product product = pd.select(pcode);
		request.setAttribute("product", product);
		return "updateProForm";
	}	
}