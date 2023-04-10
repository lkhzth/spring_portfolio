package com.jafa.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartResultVO {
	private int cartResultNum; 
	private Long mno;
	private Long product_Bno;  
	private int product_Count;  
	private String product_Name; 
	private int product_Price;
	private Date orderDate;
}


