package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;
import model.Customer;

public class JoinForm implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		CustomerDao cd = CustomerDao.getInstance();
		List<String> list = cd.confirmid();
		request.setAttribute("list",list);
		return "joinForm";
	}

}
