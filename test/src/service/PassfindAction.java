package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;

public class PassfindAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String cid = request.getParameter("cid");
		String cname = request.getParameter("cname");
		String cbir = request.getParameter("cbir");
		CustomerDao cd = CustomerDao.getInstance();
		String cpass = "";
		cpass = cd.passfind(cid,cname,cbir);
		
		StringBuffer sb = new StringBuffer();
		if(!("".equals(cpass))) {
			char[] charSet = new char[] {
					'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
					'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' }; 
			int idx = 0; 
			for (int i = 0; i < 6; i++) { 
				idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
				 sb.append(charSet[idx]);
			}
			
			cd.chgpass(sb.toString(),cid);
		}
		request.setAttribute("tempps", sb.toString());
		request.setAttribute("cpass", cpass);
		return "passfind";
	}

}
