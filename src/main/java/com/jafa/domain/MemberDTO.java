package com.jafa.domain;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

import com.jafa.validation.FiedlMatch;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FiedlMatch(first = "password", second = "confirmPassword", message = "비밀번호가 일치하지 않습니다.")
public class MemberDTO {
	
	@NotBlank(message = "아이디는 필수항목입니다.")
//	@Length(min = 4, max = 16, message = "아이디는 4~16자이어야합니다.")
	private String memberId;
	
//	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,16}$", message = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.")
	private String password; // 비밀번호
	private String confirmPassword; // 비밀번호 일치여부

	private String memberName;
	
	@Email(message = "올바른 이메일 형식이 아닙니다.")
	@NotBlank(message = "이메일은 필수항목입니다.")
	private String memberEmail;
	private String memberAddress;
	private String memberPhone;
}
