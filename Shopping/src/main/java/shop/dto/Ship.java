package shop.dto;

public class Ship {
	
	private String cartId;
	private String shipName;
	private String date;
	private String country;
	private String zipCode;
	private String address;
	private String phone;
	
	public Ship() {
		
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public String getShipName() {
		return shipName;
	}

	public void setShipName(String shipName) {
		this.shipName = shipName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Ship [cartId=" + cartId + ", shipName=" + shipName + ", date=" + date + ", country=" + country
				+ ", zipCode=" + zipCode + ", address=" + address + ", phone=" + phone + "]";
	}

	
	
	
}
