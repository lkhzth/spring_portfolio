package com.jafa.validation;

import java.lang.reflect.InvocationTargetException;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.apache.commons.beanutils.BeanUtils;

public class FieldMatchValidator implements ConstraintValidator<FiedlMatch, Object>{

	private String firstFieldName; // password
	private String secondFieldName; // confirmPassword
	private String message; // 에러메세지

	@Override
	public void initialize(FiedlMatch constraintAnnotation) {
		this.firstFieldName = constraintAnnotation.first();
		this.secondFieldName = constraintAnnotation.second();
		this.message = constraintAnnotation.message();
	}
	
	@Override
	public boolean isValid(Object value, ConstraintValidatorContext context) {
		boolean valid = true;
		try {
			String first = BeanUtils.getProperty(value, firstFieldName);
			String second = BeanUtils.getProperty(value, secondFieldName);
			valid = first != null && second != null && first.equals(second);
			if(!valid) { // false일때
				context.buildConstraintViolationWithTemplate(message)
				.addPropertyNode(secondFieldName)
				.addConstraintViolation()
				.disableDefaultConstraintViolation();
			}
		} catch (IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
			e.printStackTrace();
		}
		return valid;
	}
}
