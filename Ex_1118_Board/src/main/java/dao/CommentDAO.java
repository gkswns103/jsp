package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CommentVO;

public class CommentDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static CommentDAO single = null;

	public static CommentDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new CommentDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	
	private CommentDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	// 댓글조회
	public List<CommentVO> selectList(Map<String,Integer> map){
		SqlSession session = factory.openSession();
		List<CommentVO> list = session.selectList("c.comment_list_page",map);
		session.close();
		
		return list;
	}
	
	//댓글추가
	public int insert(CommentVO vo) {
		SqlSession session = factory.openSession(true);
		int res = session.insert("c.comment_insert",vo);
		session.close();
		
		return res;
	}
	
	public int delete(int c_idx) {
		SqlSession session = factory.openSession(true);
		int res = session.delete("c.comment_delete",c_idx);
		session.close();
		
		return res;
	}
	
	//댓글 갯수
	public int getRowTotal(int idx) {
		SqlSession session = factory.openSession();
		int count = session.selectOne("c.comment_idx_count",idx);
		session.close();
		
		return count;
	}
}
