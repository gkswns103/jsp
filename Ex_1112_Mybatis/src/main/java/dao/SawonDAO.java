package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.SawonVO;

public class SawonDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static SawonDAO single = null;

	public static SawonDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new SawonDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	
	private SawonDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	public List<SawonVO> select(){

		SqlSession session = factory.openSession();
		List<SawonVO> list = session.selectList("sawon.sawon_list");
		session.close();
		
		return list;
	}
	
	public List<SawonVO> select(int deptno){
		
		SqlSession session = factory.openSession();
		List<SawonVO> list = session.selectList("sawon.sawon_deptno_list",deptno);
		session.close();
		
		return list;
	}
	
	public SawonVO selectSawon(int sabun) {
		SqlSession session = factory.openSession();
		SawonVO vo = session.selectOne("sawon.one_sawon",sabun);
		session.close();
		
		return vo;
	}
	
	public int insertSawon(SawonVO vo) {
		SqlSession session = factory.openSession(true); // 오토 commit;
		int res = session.insert("sawon.sawon_insert",vo);
		session.close();
		
		return res;
	}
	
	public int updateSawon(SawonVO vo) {
		SqlSession session = factory.openSession(true);
		int res = session.update("sawon.sawon_update",vo);
		session.close();
		
		return res;
	}
	
	public int deleteSawon(int sabun) {
		SqlSession session = factory.openSession(true);
		int res = session.delete("sawon.sawon_delete",sabun);
		session.close();
		
		return res;
	}
}
