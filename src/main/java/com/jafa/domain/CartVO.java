package com.jafa.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartVO {

	private int cartNum; 
	private String mno; 
	private int product_bno; 
	private int product_Count; 
	private String product_Name; 
	private String product_Price; 
	private int total_Count; 
	
	
//	// product
//    private String PRODUCT_NAME;
//    private int PRODUCT_PRICE;
//    
//    // 추가
//    private int totalPrice;
	
}
