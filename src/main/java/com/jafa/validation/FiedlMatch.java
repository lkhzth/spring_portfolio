package com.jafa.validation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Documented
@Constraint(validatedBy = {FieldMatchValidator.class}) // Validation을 위한 Constraint Annotation, FieldMatchValidator class에서 validation logic을 정의
@Target({ElementType.TYPE, ElementType.ANNOTATION_TYPE}) // Annotation을 적용할 위치를 지정, TYPE(class, interface), ANNOTATION_TYPE(annotation)에 적용 가능
@Retention(RetentionPolicy.RUNTIME) // Annotation이 적용될 수 있는 시점을 지정, Runtime에도 유지
public @interface FiedlMatch {

	String first(); // 첫번째 필드

	String second(); // 두번째 필드

	String message() default "이 필드들은 서로 부합되어야 함"; // Constraint 위배 시 출력할 메시지
	
	Class<?>[] groups() default{}; // validation group 설정
	Class<? extends Payload>[] payload() default{}; // validation에서 사용할 Payload를 지정
	
	@Documented
	@Target({ElementType.TYPE, ElementType.ANNOTATION_TYPE})
	@Retention(RetentionPolicy.RUNTIME)
	@interface List{ // 여러 개의 FiedlMatch를 사용하기 위한 Annotation 생성
		FiedlMatch value(); // FiedlMatch Annotation의 배열 value
	}
}
 