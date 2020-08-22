package proservice;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Product;
public class ProductList implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rowPerPage = 10; // 한페이지에 10개 row를 보여준다.
		int pagePerBlock = 10; //한 블록에 10개 페이지를 보여준다.
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		// 시작번호 : (페이지번호 - 1) * 페이지당 갯수 + 1
		int startRow =(currentPage - 1)*rowPerPage + 1;
		// 끝번호 : 시작번호 + 페이지당갯수 - 1
		int endRow = startRow + rowPerPage - 1;
		ProductDao pd = ProductDao.getInstance();
		List<Product> list = pd.list(startRow, endRow);
		int total = pd.total();
		int tot = total - startRow + 1;
		// 총 페이지수 소숫점 이하에 숫자가 있으면 1페이지 증가
		int totalPage = (int)Math.ceil((double)total/rowPerPage);
		// 현재페이지 - (현재페이지 - 1)% 블록당 갯수
		int startPage = currentPage - (currentPage - 1)%pagePerBlock;
		// 시작페이지+블록당페이지 수 -1
		int endPage = startPage + pagePerBlock - 1;
		
		// endPage는 totalPage보다 크면 안된다
		if(endPage > totalPage)
			endPage = totalPage;
		
		request.setAttribute("list", list);
		request.setAttribute("tot", tot);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pagePerBlock", pagePerBlock);
		request.setAttribute("totalPage", totalPage);
		return "productList";
	}

}