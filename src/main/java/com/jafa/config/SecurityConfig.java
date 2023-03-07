package com.jafa.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
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
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.jafa.security.MemberAccessDeniedHandler;

import lombok.extern.log4j.Log4j;

@EnableWebSecurity
@Configuration
@Log4j
@ComponentScan("com.jafa")
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
	
	public AccessDeniedHandler accessDeniedHandler() {
		return new MemberAccessDeniedHandler();
	}
	
	// 비밀번호 암호화 빈등록 
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// 한글 처리
        CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        http.addFilterBefore(filter, CsrfFilter.class);
		
		http.authorizeRequests()
			.antMatchers("/member/all").access("permitAll")
			.antMatchers("/member/member").access("hasRole('ROLE_MEMBER')")
			.antMatchers("/member/admin").access("hasRole('ROLE_ADMIN')"); 
		
        http.formLogin()
	        .loginPage("/member/login") // 로그인 페이지 
			.loginProcessingUrl("/member/login") // 로그인 처리 
			.usernameParameter("loginId") // 아이디 name값
			.passwordParameter("loginPwd")
			.failureHandler(authenticationFailureHandler)
			.successHandler(authenticationSuccessHandler); // /login으로 요청하면 스프링시큐리티가 제공하는 로그인 페이지로 이동
        
        http.logout()
			.invalidateHttpSession(true) 
			.logoutUrl("/member/logout") // 로그아웃 처리 URL 기본값: /logout POST 요청
			.logoutSuccessHandler(logoutSuccessHandler);
//			.logoutSuccessUrl("/"); // 로그아웃 성공시 요청 페이지 기본값: 로그인 페이지
        
        http.exceptionHandling().accessDeniedHandler(accessDeniedHandler);
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	    auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}
	
	
	
}
