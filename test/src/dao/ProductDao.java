package dao;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Customer;
import model.Product;
public class ProductDao {
    private static ProductDao instance;
    public static ProductDao getInstance() {
    	if (instance==null) {	instance = new ProductDao();  	}
        return instance;
    }    
    private ProductDao() {}
    private Connection getConnection() throws Exception {
        Connection conn=null; 	 
      	Context init = new InitialContext();
     		DataSource ds = 
     			(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
     		conn = ds.getConnection();
         return conn;
    }
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
	public int insert(Product product) {
		int result = session.insert("productns.insert",product);
		return result;
	}
	public Product select(String pcode) {
		return (Product)session.selectOne("productns.select",pcode);
	} 
	public List<Product> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("startRow",startRow );
		hm.put("endRow",endRow );
		return session.selectList("productns.list",hm);
	}
	public int delete(String pcode) {
		return session.update("productns.delete", pcode);
	}
	public int update(Product product) {
		return session.update("productns.update", product);
	}
	public int total() {
		return (int) session.selectOne("productns.total");
	}
	public List<Product> mainlist(String b_code){
		return session.selectList("productns.main", b_code);
	}
	public String nameselect(String pcode) {
		return (String) session.selectOne("productns.name", pcode);
	}
    
}
