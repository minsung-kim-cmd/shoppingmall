package proservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import dao.ReviewDao;
import model.Product;
import model.Review;

public class Detail implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pcode = request.getParameter("pcode");
		ProductDao pd = ProductDao.getInstance();
		Product product = pd.select(pcode);
		
		//review
		ReviewDao rd = ReviewDao.getInstance();
		List<Review> list = rd.select(pcode);
		request.setAttribute("list", list);
		request.setAttribute("product", product);
		return "detail";
	}

}
