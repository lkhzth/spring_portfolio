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
	private Long mno;  // 2
	private Long product_Bno; //2 
	private int product_Count;  // 3
	private String product_Name; 
	private int product_Price;  
	
}
