package com.jafa.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import lombok.extern.log4j.Log4j;

@EnableWebSecurity
@Configuration
@Log4j
@EnableGlobalMethodSecurity(prePostEnabled = true,securedEnabled = true)
@ComponentScan("com.jafa.security")
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	// 접근 거부 핸들러
	@Autowired
	AccessDeniedHandler accessDeniedHandler;
	
	@Autowired
	AuthenticationFailureHandler authenticationFailureHandler;
	
	@Autowired
	AuthenticationSuccessHandler authenticationSuccessHandler;
	
	@Autowired
	LogoutSuccessHandler logoutSuccessHandler;
	
	@Autowired
	UserDetailsService userDetailsService;
	
	@Autowired
	DataSource dataSource;
	
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl jdbcTokenRepository =  new JdbcTokenRepositoryImpl();
		jdbcTokenRepository.setDataSource(dataSource);
		return jdbcTokenRepository;
	}
	
	// 비밀번호 암호화 빈등록 
	// 오버라이드된 AuthenticationManagerBuilder가 사용될때(122행) 받아온 비밀번호암호화 후 인증처리 
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// URL 접근 보안의 시작
		http.authorizeRequests()
		.antMatchers("/member/myPage").access("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN','ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')")
		.antMatchers("/member/myPageDetail").access("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN','ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')")
		.antMatchers("/member/admin").access("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')")
		// 상품접근
		.antMatchers("/product/detail*").access("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN','ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')")
		.antMatchers("/product/write").access("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')")
		.antMatchers("/product/modify*").access("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')")
		.antMatchers("/product/delete*").access("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')")
		// 게시판접근
		.antMatchers("/board/detail*").access("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN','ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')")
		.antMatchers("/board/write").access("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN','ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')")
		.antMatchers("/board/modify*").access("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN','ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')")
		.antMatchers("/board/delete*").access("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN','ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')")
		;

		// 한글 처리
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        http.addFilterBefore(filter, CsrfFilter.class);
		
        // 로그인
        http.formLogin()
        .loginPage("/member/login") // 로그인 페이지, 기본값 : /login GET요청 
		.loginProcessingUrl("/member/login") // 로그인 처리 , 기본값 : /login POST요청
		.usernameParameter("loginId") // 아이디 name값, 기본값 : username
		.passwordParameter("loginPwd") // 비밀번호 name 값, 기본값 : password
		.failureHandler(authenticationFailureHandler) // 로그인 실패 핸들러
		.successHandler(authenticationSuccessHandler); // 로그인 성공 핸들러, /login으로 요청하면 스프링시큐리티가 제공하는 로그인 페이지로 이동
        
        // 자동로그인설정
        http.rememberMe()
		.key("lee") // 인증받은 사용자의 정보로 token을 생성하는데 사용되는 임의의 key값 설정 
		.tokenRepository(persistentTokenRepository())
		.rememberMeParameter("remember-me") // 자동로그인 체크박스의 name속성 지정 : 기본값
		.tokenValiditySeconds(86400); // token만료시간 설정

        // 로그아웃
        http.logout()
    	.logoutUrl("/member/logout")
    	.logoutSuccessHandler(logoutSuccessHandler)
    	.deleteCookies("remember-me","JSESSION_ID");
        
        http.exceptionHandling().accessDeniedHandler(accessDeniedHandler);
	}
	
	// 사용자 인증에 필요한 정보를 제공하는 객체
	// auth.userDetailsService()메서드를 사용하여 UserDetailsService를 구현한 객체에 전달. 
	// db에 저장된 사용자정보를 가지고 와서 저장 
	// http.formLogin().usernameParameter와 http.formLogin().passwordParameter받아와서 
	//  가져온 사용자 정보와 사용자가 입력한 아이디와 비밀번호를 비교하여 인증을 처리
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	    auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}
}
