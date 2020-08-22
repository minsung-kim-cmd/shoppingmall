package proservice;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ProductDao;
import model.Product;

public class RegisterPro implements CommandProcess {
	
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<String> fname = new ArrayList<String>();
		int size = 20*1024*1024;
		String uploadPath = "C:\\product";
		MultipartRequest multi = new MultipartRequest(request,uploadPath, size, "utf-8",new DefaultFileRenamePolicy());
		int result = 0;
		Product product = new Product();
			int pprice = Integer.parseInt(multi.getParameter("pprice"));
			int pcount= Integer.parseInt(multi.getParameter("pcount"));	
			product.setPcode(multi.getParameter("pcode"));
			product.setPname(multi.getParameter("pname"));
			product.setPprice(pprice);
			product.setPcount(pcount);
			product.setPcon(multi.getParameter("pcon"));
			product.setB_code(multi.getParameter("b_code"));
			product.setA_code(multi.getParameter("a_code"));
			product.setPoption(multi.getParameter("poption"));
			
			Enumeration<String> files = multi.getFileNames();
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				fname.add(multi.getFilesystemName(name));
				File src = new File(uploadPath+"\\"+name);
			}int pathMiddle = fname.get(0).lastIndexOf(".");
		
		product.setPimage(fname.get(0).substring(0,pathMiddle-1));
		ProductDao pd = ProductDao.getInstance();
		result = pd.insert(product);
		request.setAttribute("result", result);
		return "registerPro";
	}

}
