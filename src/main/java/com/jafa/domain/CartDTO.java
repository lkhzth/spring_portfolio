package com.jafa.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class CartDTO {

	private int cartId; 
	private String memberId; 
	private int product_bno; 
	private int product_Count; 

	// product
    private String PRODUCT_NAME;
    private int PRODUCT_PRICE;
    
    // 추가
    private int totalPrice;

    // 세터 -> salePrice, totalPrice 값이 변경될 가능성 있으므로 세터 생성x
	public void setCart_Id(int cart_Id) {
		this.cartId = cart_Id;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public void setProduct_bno(int product_bno) {
		this.product_bno = product_bno;
	}
	public void setProduct_Count(int product_Count) {
		this.product_Count = product_Count;
	}
	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}
	public void setPRODUCT_PRICE(int pRODUCT_PRICE) {
		PRODUCT_PRICE = pRODUCT_PRICE;
	}

	//  salePrice와 totalPrice의 변수 값을 초기화 해주는 메서드를 생성
	public void initSaleTotal() {
		this.totalPrice = this.PRODUCT_PRICE*this.product_Count;
	}
	
}
