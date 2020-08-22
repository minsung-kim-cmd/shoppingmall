package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Cart;
public class CartDao {
	private static CartDao instance = new CartDao();
	private CartDao() {}
	public static CartDao getInstance() {
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
	public int insertCart(Cart cart) {
		int result = session.insert("cartns.insert",cart);
		return result;
	}
	public int updatePnt(Cart cart) {
		int result = session.update("cartns.update",cart);
		return result;
	}
	public int getListCount(String cid) {
		return (int)session.selectOne("cartns.select",cid);
	}
	
	public List<Cart> list(String cid){
		return session.selectList("cartns.list",cid);
	}
	public Cart proselect(String pcode,String cid, String poption) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pcode", pcode);
		map.put("cid", cid);
		map.put("poption", poption);
		return (Cart)session.selectOne("cartns.proselect", map);
	}
	public int delete(String pcode,String cid, String poption) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("pcode", pcode);
		map.put("cid", cid);
		map.put("poption", poption);
		int result =session.delete("cartns.delete", map);
		return result;
	}
	
	public Cart listOne(String pcode, String cid, String poption){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pcode", pcode);
		map.put("cid", cid);
		map.put("poption", poption);
		return (Cart)session.selectOne("cartns.listOne",map);
	}

}
