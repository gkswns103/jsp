package service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnector {
	//Mybatis :   
	//데이터베이스 프로그래밍을 좀 더 쉽게 접근할 수 있도록 도와주는 개발도구
	//Mybatis 와 같은 프레임워크를 ORM 이라고 한다 ( Object Relationship Mapper )
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static MyBatisConnector single = null;
	SqlSessionFactory factory=null;
	
	public static MyBatisConnector getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new MyBatisConnector();
		//생성된 객체정보를 반환
		return single;
	}
	
	//생성자
	public MyBatisConnector() {
		try {
			//sqlMapConfig.xml 을 읽어온다
			Reader reader=Resources.getResourceAsReader( "config/mybatis/sqlMapConfig.xml" );
			
			//reader 가 가진 DB연결정보 , 참조중인 mapper정보 등을 실제로 구현하기 위한 클래스
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}//생성자
	
	//생성자에서 얻어낸 factory를 반환
	public SqlSessionFactory getFactory() {
		return factory;
	}
	
	
}











