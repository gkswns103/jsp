package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.BoardVO;

public class BoardDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static BoardDAO single = null;

	public static BoardDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new BoardDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	
	private BoardDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	//전체 게시글 조회
	public List<BoardVO> selectList( Map<String,Object> map){
		SqlSession session = factory.openSession();
		List<BoardVO> list = session.selectList("b.board_list",map);
		session.close();
		
		return list;
	}
	
	public int getRowTotal(Map<String,Object> map) {
		SqlSession session = factory.openSession();
		int count = session.selectOne("b.board_count",map);
		session.close();
		System.out.println(count);
		return count;
	}
	
	public int insertBoard(BoardVO vo) {
		SqlSession session = factory.openSession(true);
		int res = session.insert("b.insert",vo);
		session.close();
		
		return res;
	}
	
	public BoardVO selectOne(int idx) {
		SqlSession session = factory.openSession();
		BoardVO vo = session.selectOne("b.select_one",idx);
		session.close();
		
		return vo;
	}
	
	public int update_readhit(int idx) {
		SqlSession session = factory.openSession(true);
		int res = session.update("b.board_update_readhit",idx);
		session.close();
		
		return res;
	}
	
	//댓글 처리를 위한 step + 1
	public int update_step(BoardVO baseVO) {
		SqlSession session = factory.openSession(true);
		int res = session.update("b.board_update_step",baseVO);
		session.close();
		
		return res;
	}
	
	public int reply(BoardVO vo) {
		SqlSession session = factory.openSession(true);
		int res = session.insert("b.board_reply",vo);
		session.close();
		
		return res;
	}
	
	//삭제(된 것 처럼 업데이트)
	public int del_update(int idx) {
		SqlSession session = factory.openSession(true);
		int res = session.update("b.board_del_update",idx);
		session.close();
		
		return res;
	}
	
	public int update(BoardVO vo) {
		SqlSession session = factory.openSession(true);
		int res = session.update("b.board_update",vo);
		session.close();
		
		return res;
	}
}
