package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.ProductVO;

public class ProductDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static ProductDAO single = null;

	public static ProductDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new ProductDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	
	public ProductDAO() {
		factory=MyBatisConnector.getInstance().getFactory();
	}
	
	public List<ProductVO> select_prod(String category){
		SqlSession sqlSession=factory.openSession();
		List<ProductVO> list=sqlSession.selectList("p.select_category",category);
		
		sqlSession.close();
		
		return list;
		
	}
	
	public int insert_prod(ProductVO vo) {
		
		SqlSession sqlSession=factory.openSession(true);
		int cnt= sqlSession.insert("p.insert_product",vo);
		
		sqlSession.close();
		
		return cnt;
	}
	
	public ProductVO updateOne(int idx) {
		SqlSession sqlSession=factory.openSession();
		ProductVO vo=sqlSession.selectOne("p.upd_one",idx);
		
		sqlSession.commit();
		sqlSession.close();
		return vo;
		
	}
	
	public int update_prod(ProductVO vo) {
		SqlSession sqlSession=factory.openSession();
		int cnt=sqlSession.insert("p.update_product",vo);
		
		sqlSession.commit();
		sqlSession.close();
		return cnt;
		
	}
	//상세보기를 위한 상세조회
	public ProductVO selectOne( int idx ) {
		SqlSession sqlSession=factory.openSession();
		ProductVO vo=sqlSession.selectOne("p.product_one",idx);
		sqlSession.close();
		
		return vo;
		
	}
	
	public int delete(int idx) {
		SqlSession session = factory.openSession(true);
		int res = session.delete("p.product_del",idx);
		session.close();
		
		return res;
	}
	
	
}
