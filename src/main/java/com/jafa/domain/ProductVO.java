package com.jafa.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductVO {

	private Long product_Bno;
	private String cateId;
	private String product_Name;
	private String product_Intro;
	private String product_Content;
	private String product_Size;
	private String product_Weight;
	private String product_Price;
	private String product_Stock;
	private String fileName_Product;
	private FileType fileType_Product;
	
	private ProductCategory productCategory;

	@NoArgsConstructor
	public enum FileType{
		IMAGE, OTHER;
	}
}
/* 
 	스프링 db컬럼에 product_Bno 이런식으로 _ 이게 들어가도 상관없음?
스프링 프레임워크에서는 일반적으로 데이터베이스 컬럼명에 언더스코어(_)를 사용하는 것을 권장합니다. 따라서 "product_Bno"와 같이 언더스코어를 포함한 컬럼명을 사용해도 문제는 없습니다.
그러나 몇 가지 주의해야 할 점이 있습니다. 첫째, 언더스코어를 사용할 때는 데이터베이스에서 대소문자를 구분하므로 "product_Bno"와 "product_bno"는 서로 다른 컬럼으로 인식됩니다. 둘째, 언더스코어를 사용하면 자바에서 해당 컬럼을 참조할 때 일부 불편함이 있을 수 있습니다. 예를 들어, 자바에서 해당 컬럼을 참조할 때는 "product_bno"와 같이 언더스코어를 사용하는 것이 좋습니다.
따라서 "product_Bno"와 같이 언더스코어를 사용해도 문제는 없지만, 대소문자와 자바에서의 참조 방식에 유의하여 사용하시기 바랍니다.
실행시에 no getter이라고 뜨는것도 연관이 있을수있는가
예, 실행 시 "no getter" 오류가 발생하는 경우, 해당 필드에 대한 getter 메서드가 없기 때문에 발생할 수 있습니다. getter 메서드가 없으면 해당 필드에 접근할 수 없으므로, 이러한 오류가 발생합니다.
만약 오류가 발생하는 필드가 데이터베이스의 컬럼이라면, 일반적으로 해당 컬럼에 대한 getter 메서드를 생성해주어야 합니다. 스프링 프레임워크에서는 일반적으로 getter와 setter 메서드를 자동으로 생성해주는 기능을 제공합니다. 따라서 해당 필드에 getter 메서드가 없는 경우, 해당 클래스에 getter 메서드를 추가하거나, 롬복과 같은 라이브러리를 이용하여 자동으로 getter 메서드를 생성해주는 방법을 고려할 수 있습니다.
하지만 오류가 발생하는 원인은 getter 메서드가 없는 것이 확실하지 않을 수도 있습니다. 따라서 오류 메시지를 자세히 살펴보고, 다른 가능성도 함께 고려해보시는 것이 좋습니다.
언더스코어때문에 그럴수도 있다는 말이네
네, 언더스코어로 인해 getter 메서드 생성이 올바르게 이루어지지 않아서 "no getter" 오류가 발생할 수도 있습니다. 스프링에서는 자바 클래스의 필드와 데이터베이스의 컬럼명을 매핑할 때, 일반적으로 언더스코어를 사용합니다. 그렇기 때문에 만약 클래스의 필드명과 데이터베이스의 컬럼명이 일치하지 않으면, 스프링은 자동으로 getter와 setter 메서드를 생성하지 못할 수 있습니다.
따라서 "no getter" 오류가 발생하는 경우, 해당 클래스의 필드명과 데이터베이스의 컬럼명이 일치하는지, 또는 언더스코어 사용 여부를 확인해보는 것이 좋습니다. 필드명과 컬럼명이 일치하지 않으면 @Column 어노테이션을 사용하여 매핑 정보를 직접 지정해주어야 하며, 언더스코어를 사용하는 경우에는 필드명에 언더스코어를 포함시켜주어야 합니다.
 * */










