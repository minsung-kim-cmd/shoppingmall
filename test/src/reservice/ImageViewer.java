package reservice;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/ImageViewer")
public class ImageViewer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ImageViewer() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname = request.getParameter("fname");
		String filePath = "C:\\review\\";
		File imgFile = new File(filePath+fname);
		FileInputStream ifo = new FileInputStream(imgFile);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buf = new byte[1024];
		int readlength=0;
		while((readlength = ifo.read(buf))!= -1) {
			baos.write(buf,0,readlength);
		}
		byte[] imgbuf = null;
		imgbuf = baos.toByteArray();
		baos.close();
		ifo.close();
		int length = imgbuf.length;
		response.setContentType("image/jpeg");
		OutputStream out = response.getOutputStream();
		out.write(imgbuf,0,length);
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
