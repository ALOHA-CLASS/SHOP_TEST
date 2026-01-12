package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Order;
import shop.dto.Product;

public class OrderRepository extends JDBConnection {
	
	/**
	 * 주문 등록
	 * @param user
	 * @return
	 */
	public int insert(Order order) {
		int result = 0;
		String sql = " INSERT INTO `order` ( ship_name, zip_code, country, address, date, order_pw, user_id, total_price, phone ) "
				   + " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ? ) " ;				
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, order.getShipName());
			psmt.setString(no++, order.getZipCode());
			psmt.setString(no++, order.getCountry());
			psmt.setString(no++, order.getAddress());
			psmt.setString(no++, order.getDate());
			psmt.setString(no++, order.getOrderPw());
			psmt.setString(no++, order.getUserId());
			psmt.setInt(no++, order.getTotalPrice());
			psmt.setString(no++, order.getPhone());
			
			result = psmt.executeUpdate();			// 주문 등록 요청
			
		} catch (SQLException e) {
			System.err.println("주문 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("주문 데이터 " + result + "개가 등록되었습니다.");
		
		if( result > 0 ) {
			result = lastOrderNo();
		} else { 
			result = 0;
		}
		return result;
	}

	/**
	 * 최근 등록한 orderNo 
	 * @return
	 */
	public int lastOrderNo() {
		int orderNo = 0;
		String sql = " SELECT LAST_INSERT_ID() ";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if( rs.next() ) {
				orderNo = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.err.println("최근 order_no 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return orderNo;
	}

	
	/**
	 * 주문 내역 조회 - 회원
	 * @param userId
	 * @return
	 */
	public List<Product> list(String userId) {
		ArrayList<Product> productList = new ArrayList<Product>();
		
		String sql = " select o.order_no "
				   + "	     ,o.phone "
				   + "       ,o.order_pw "
				   + "       ,io.product_id "
				   + "       ,io.amount "
				   + "       ,p.* "
				   + " from `order` o left join product_io io on o.order_no  = io.order_no "
				   + "			      left join product p on p.product_id = io.product_id "
				   + " where o.user_id = ? "
				   ;
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, userId);
			rs = psmt.executeQuery();
			
			while( rs.next() ) {
				Product product = new Product();
				
				product.setOrderNo( rs.getInt("order_no") );
				product.setProductId( rs.getString("product_id") );
				product.setName( rs.getString("name") );
				product.setUnitPrice( rs.getInt("unit_price") );
				product.setDescription( rs.getString("description") );
				product.setManufacturer( rs.getString("manufacturer") );
				product.setCategory( rs.getString("category") );
				product.setUnitsInStock( rs.getLong("units_in_stock") );
				product.setCondition( rs.getString("condition") );
				product.setQuantity( rs.getInt("amount") );
				
				productList.add(product);
			}
			
		} catch (SQLException e) {
			System.err.println("상품 목록 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return productList; 
		
	}
	
	/**
	 * 주문 내역 조회 - 비회원
	 * @param phone
	 * @param orderPw
	 * @return
	 */
	public List<Product> list(String phone, String orderPw) {
		ArrayList<Product> productList = new ArrayList<Product>();
				
		String sql = " select o.order_no "
				   + "	     ,o.phone "
				   + "       ,o.order_pw "
				   + "       ,io.product_id "
				   + "       ,io.amount "
				   + "       ,p.* "
				   + " from `order` o left join product_io io on o.order_no  = io.order_no "
				   + "			      left join product p on p.product_id = io.product_id "
				   + " where o.phone = ? "
				   + "   and o.order_pw = ? "
				   ;
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, phone);
			psmt.setString(no++, orderPw);
			rs = psmt.executeQuery();
			
			while( rs.next() ) {
				Product product = new Product();
				
				product.setOrderNo( rs.getInt("order_no") );
				product.setProductId( rs.getString("product_id") );
				product.setName( rs.getString("name") );
				product.setUnitPrice( rs.getInt("unit_price") );
				product.setDescription( rs.getString("description") );
				product.setManufacturer( rs.getString("manufacturer") );
				product.setCategory( rs.getString("category") );
				product.setUnitsInStock( rs.getLong("units_in_stock") );
				product.setCondition( rs.getString("condition") );
				product.setQuantity( rs.getInt("amount") );
				productList.add(product);
			} 
			
		} catch (SQLException e) {
			System.err.println("상품 목록 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return productList; 
	}
	
}






























