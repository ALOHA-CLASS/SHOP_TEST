package shop.dto;

import java.io.Serializable;

/**
 * Product 자바빈즈
 * - 상품 아이디
 * - 상품 명
 * - 상품 가격
 * - 상품 설명
 * - 제조사
 * - 분류
 * - 재고 수
 * - 상태(condition)
 */
public class Product implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String productId;		// 상품ID
	private String name;			// 상품명
	private Integer unitPrice;		// 가격(단가)
	private String description;		// 설명
	private String manufacturer;	// 제조 업체
	private String category;		// 카테고리
	private long unitsInStock;		// 재고 수
	private String condition;		// 상태
	private String file;			// 파일 경로 변수 추가
	private int quantity;			// 장바구니 개수 

	// 
	private String userId;			// 회원ID
	private int orderNo;			// 주문번호
	private String type;			// 입출고 타입
	
	public Product() {
		
	}

	public Product(String productId, String name, Integer unitPrice) {
		this.productId = productId;
		this.name = name;
		this.unitPrice = unitPrice;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", name=" + name + ", unitPrice=" + unitPrice + ", description="
				+ description + ", manufacturer=" + manufacturer + ", category=" + category + ", unitsInStock="
				+ unitsInStock + ", condition=" + condition + ", file=" + file + ", quantity=" + quantity + ", userId="
				+ userId + ", orderNo=" + orderNo + ", type=" + type + "]";
	}
	

}
