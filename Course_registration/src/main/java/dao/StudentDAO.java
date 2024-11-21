package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.StudentDTO;
import service.MyBatisConnector;

public class StudentDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static StudentDAO single = null;

	public static StudentDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new StudentDAO();
		//생성된 객체정보를 반환dept.xml
		return single;
	}
	
	SqlSessionFactory factory;
	
	private StudentDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	public StudentDTO selectId(String stunumber) {
		SqlSession session = factory.openSession();
		StudentDTO student = session.selectOne("student.student_select",stunumber);
		session.close();
		
		return student;
	}
	
	public int insert_student(StudentDTO student) {
		SqlSession session = factory.openSession(true);
		int res = session.insert("student.insert_student",student);
		session.close();
		
		return res;
	}

}
