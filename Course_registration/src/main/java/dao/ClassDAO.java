package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.ClassDTO;
import service.MyBatisConnector;

public class ClassDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static ClassDAO single = null;

	public static ClassDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new ClassDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	
	private ClassDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	public List<ClassDTO> select_list(){
		SqlSession session = factory.openSession();
		List<ClassDTO> list = session.selectList("class.class_select_list");
		session.close();
		
		return list;
	}
	
	public List<ClassDTO> select_search_list(String search_class){
		SqlSession session = factory.openSession();
		List<ClassDTO> list = session.selectList("class.class_select_search_list",search_class);
		session.close();
		
		return list;
	}
}
