package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.DeptDTO;
import service.DBService;

public class DeptDAO {
	// DAO(Data access object) : 
	// DB에서 자원을 검색하거나 수정하기 위한 작업을 하는 클래스
	
	static DeptDAO single = null;
	
	public static DeptDAO getInstance() {
		if( single == null ) {
			single = new DeptDAO();
		}
		return single;
	}
	
	private DeptDAO() {
		
	}
	
	// 부서 검색
	public List<DeptDTO> selectList(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<DeptDTO> dept_list = new ArrayList<DeptDTO>();
		
		String sql = "SELECT * FROM dept";
		
		try {
			conn = DBService.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DeptDTO dto = new DeptDTO();
				dto.setDeptno(rs.getInt("deptno"));
				dto.setDname(rs.getString("dname"));
				dto.setLoc(rs.getString("loc"));
				
				dept_list.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if( rs != null )
					rs.close();
				if( pstmt != null )
					pstmt.close();
				if( conn != null )
					conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return dept_list;
	}
}
