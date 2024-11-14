package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.DeptVO;

public class DeptDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static DeptDAO single = null;

	public static DeptDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new DeptDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	
	private DeptDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	public List<DeptVO> select(){
		
		SqlSession session = factory.openSession();
		List<DeptVO> list = session.selectList("dept.dept_list");
		session.close();
		
		return list;
	}
	
	public List<DeptVO> select(String dname){
		
		SqlSession session = factory.openSession();
		List<DeptVO> list = session.selectList("dept.dept_dname_list",dname);
		session.close();
		
		return list;
	}
}
