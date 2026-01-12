package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Product;

public class ProductIORepository extends JDBConnection {

	/**
	 * 상품 입출고 등록
	 * @param product
	 * @param type
	 * @return
	 */
	public int insert(Product product) {
		int result = 0;
		String sql = " INSERT INTO product_io ( product_id, order_no, amount, type, user_id ) "
				   + " VALUES ( ?, ?, ?, ?, ? ) " ;				
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, product.getProductId());
			psmt.setInt(no++, product.getOrderNo());
			psmt.setInt(no++, product.getQuantity());
			psmt.setString(no++, product.getType());
			psmt.setString(no++, product.getUserId());
			result = psmt.executeUpdate();			// 입출고 등록 요청
			
		} catch (SQLException e) {
			System.err.println("입출고 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("입출고 데이터 " + result + "개가 등록되었습니다.");
		return result;
		
	}
	

}