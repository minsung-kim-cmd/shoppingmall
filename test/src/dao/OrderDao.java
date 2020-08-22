package dao;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import model.Order1;
public class OrderDao {
	private static OrderDao instance = new OrderDao();
	private OrderDao() {}
	public static OrderDao getInstance() {
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
	public int insert(Order1 order) {
		int result = session.insert("orderns.insert",order);
		return result;
	}
	public List<Order1> select(String ocode, String cid) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("ocode", ocode);
		map.put("cid", cid);
		return session.selectList("orderns.select", map);
	}
	public Order1 order(String ocode) {
		return (Order1) session.selectOne("orderns.order",ocode);
	}
	public int chkpro(String cid, String pcode) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("pcode", pcode);
		map.put("cid", cid);
		return (int) session.selectOne("orderns.chkpro", map);
		
	}
	
}
