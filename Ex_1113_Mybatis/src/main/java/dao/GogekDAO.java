package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.GogekVO;

public class GogekDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static GogekDAO single = null;

	public static GogekDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new GogekDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	
	private GogekDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	public List<GogekVO> select_list(){
		SqlSession session = factory.openSession();
		List<GogekVO> list = session.selectList("gogek.gogek_list");
		session.close();
		
		return list;
	}
	
	public List<GogekVO> select_list(String addr){
		SqlSession session = factory.openSession();
		List<GogekVO> list = session.selectList("gogek.gogek_addr_list",addr);
		session.close();
		
		return list;
	}
}
