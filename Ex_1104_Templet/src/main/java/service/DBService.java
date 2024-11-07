package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBService {
	//DB연결을 위한 클래스인 DBService를
	//싱글톤(single-ton)으로 생성
	static DBService single = null;
	
	public static DBService getInstance() {
		if( single == null ) {
			single = new DBService();
		}
		
		return single;
	}
	
	DataSource ds;
	
	private DBService() {
		try{
		InitialContext ic = new InitialContext();
		
		Context ctx = (Context)ic.lookup("java:comp/env");
		
		ds = (DataSource)ctx.lookup("jdbc/oracle_test");
		
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	//DB연결
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
