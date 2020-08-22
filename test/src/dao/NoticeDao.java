package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Notice;
public class NoticeDao {
	private static NoticeDao instance = new NoticeDao();
	private NoticeDao() {}
	public static NoticeDao getInstance() {
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
	@SuppressWarnings("unchecked")
	public List<Notice> list(int startRow, int endRow) { 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("noticens.list",map);
	}
	public Notice select(int ncode) {
		return (Notice)session.selectOne("noticens.select",ncode);
	}
	public int delete(int ncode) {
		return session.delete("noticens.delete", ncode);
	}
	public int insert(Notice notice) {
		return session.insert("noticens.insert", notice);
	}
	public void upview(int ncode) {
		session.update("noticens.upview", ncode);
	}
	public int update(int ncode, String nsubject, String ncontent) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ncode", ncode);
		map.put("nsubject", nsubject);
		map.put("ncontent", ncontent);
		return session.update("noticens.update", map);
	}
	public int total() {
		return (int) session.selectOne("noticens.count");
	}
}
