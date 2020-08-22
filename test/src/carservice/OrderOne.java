package carservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.ibatis.sqlmap.engine.scope.SessionScope;
import dao.CartDao;
import model.Cart;
import carservice.CommandProcess;

public class OrderOne implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		return "buyForm";
	}

}
