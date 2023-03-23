package com.jafa.domain;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberVO implements Serializable{
	
	private static final long serialVersionUID = -6917382595316125763L;
	
	private Long mno;
	private String memberId;
	private String password;
	private String memberName;
	private String memberEmail;
	private String memberAddress;
	private String memberPhone;
	private boolean enabled;
	private List<AuthVO> authList;
}



