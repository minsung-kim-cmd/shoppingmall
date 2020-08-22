package reservice;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ReviewDao;
import model.Review;

public class InsertAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String uploadPath = "C:\\review";
		int size = 20*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",new DefaultFileRenamePolicy());
		
	
		Review review = new Review();
		review.setPcode(multi.getParameter("pcode"));
		review.setRwriter(multi.getParameter("rwriter"));
		review.setRsubject(multi.getParameter("rsubject"));
		review.setRcontent(multi.getParameter("rcontent"));
		if(multi.getFilesystemName("fname")!= null) {
			String fname=multi.getFilesystemName("fname");
			String imagePath = uploadPath+"\\"+fname;
			File src = new File(imagePath);
			
			String thumImagePath = uploadPath+"\\"+fname;
			File dest = new File(thumImagePath);
			review.setRimg(fname);
		}
		
		ReviewDao rd = ReviewDao.getInstance();
		int result = 0;
		result = rd.insert(review);
		request.setAttribute("result",result);
		request.setAttribute("pcode", multi.getParameter("pcode"));
		return "rinsert";
	}

}
