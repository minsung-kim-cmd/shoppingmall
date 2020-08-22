package dao;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Customer;
public class CustomerDao {
	private static CustomerDao instance = new CustomerDao();
	private CustomerDao() {}
	public static CustomerDao getInstance() {
		return instance;
	}
	// DB연결 : Connection Pool대신에 SqlSession생성
	private  static SqlSession session;
	static { // 클래스변수 초기화 블럭
		try {
			Reader reader = 
				Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf =
				new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		}catch (Exception e) {
			System.out.println("초기화 에러 : "+e.getMessage());
		}
	}
	public List<Customer> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("startRow",startRow );
		hm.put("endRow",endRow );
		return session.selectList("customerns.list",hm);
	}
	public Customer select(String cid) {			
		return (Customer)session.selectOne("customerns.select", cid);
	}
	
	public int insert(Customer customer) {
		int result = session.insert("customerns.insert",customer);
		return result;
	}
	public int loginChk(String cid, String cpass) {
		int result = 0;
		Customer customer = select(cid);
		if(customer == null) {
			result = -1;
		}
		else if(cpass.equals(customer.getCpass())){
			result = 1;
		}
		if("y".equals(customer.getCdel())) {
			result = -2;
		}
		return result;
	}
	public int update(Customer customer) {
		return session.update("customerns.update",customer);
	}
	public int delete(String cid) {
		return session.update("customerns.delete",cid);
	}
	public String idfind(String cname, String cbir) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cname", cname);
		map.put("cbir", cbir);
		return (String) session.selectOne("customerns.selectid", map);
	}
	public String passfind(String cid, String cname, String cbir) {
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("cid", cid);
		map2.put("cname", cname);
		map2.put("cbir", cbir);
		return (String) session.selectOne("customerns.selectpass", map2);
	}
	public int deletecus(String cno) {
		return session.delete("customerns.deletecus",cno);
	}
	public int total() {
		return (int) session.selectOne("customerns.total");
	}
	public Customer cusselect(String cno) {
		return (Customer)session.selectOne("customerns.cnoselect", cno);
	}
	public List<String> confirmid() {
		return session.selectList("customerns.confirmid");
	}
	public int idcheck(String cid) {
		return (int)session.selectOne("customerns.idcheck", cid);
	}
	public void chgpass(String cpass, String cid) {
		HashMap<String,String>map = new HashMap<String, String>();
		map.put("cid", cid);
		map.put("cpass", cpass);
		session.update("customerns.chgpass", map);
	}
	
}
