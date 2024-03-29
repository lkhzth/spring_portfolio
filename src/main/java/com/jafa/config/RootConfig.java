package com.jafa.config;

import java.io.IOException;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.jafa.domain.BoardVO;
import com.jafa.domain.CartResultVO;
import com.jafa.domain.CartVO;
import com.jafa.domain.Category;
import com.jafa.domain.MemberVO;
import com.jafa.domain.ProductCategory;
import com.jafa.domain.ProductVO;
import com.jafa.domain.ReplyVO;

@Configuration
@MapperScan("com.jafa.repository")
@PropertySource(value = "classpath:database/oracle.properties")
public class RootConfig {

	@Value("${db.driver}")
	private String driverClass; 
	@Value("${db.url}")
	private String url; 
	@Value("${db.username}")
	private String username; 
	@Value("${db.password}")
	private String password; 
	
	@Bean
	public DataSource dataSource() {
		DataSource dataSource = new DataSource();
		dataSource.setDriverClassName(driverClass);
		dataSource.setUrl(url);
		dataSource.setUsername(username);
		dataSource.setPassword(password);
		return dataSource;
	}
	
	@Bean
	public SqlSessionFactoryBean sqlSessionFactoryBean() throws IOException {
		SqlSessionFactoryBean factory = new SqlSessionFactoryBean();
		factory.setDataSource(dataSource());
		factory.setMapperLocations(new PathMatchingResourcePatternResolver()
				.getResources("classpath:mappers/**/*Mapper.xml"));
		factory.setTypeAliases(BoardVO.class, Category.class, ReplyVO.class, MemberVO.class, ProductVO.class, ProductCategory.class, CartVO.class, CartResultVO.class);
		return factory;
	}

	@Bean
	public SqlSessionTemplate sqlSessionTemplate() throws IOException, Exception {
		return new SqlSessionTemplate(sqlSessionFactoryBean().getObject());
	}

	// MessageSource 설정
	@Bean
	public MessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasenames("classpath:message/label");
		messageSource.setDefaultEncoding("utf-8");
		return messageSource;
	}

	// 반드시 static으로 할것.
	@Bean
 	public static PropertySourcesPlaceholderConfigurer placeholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
	
	// 파일업로드 설정(게시판글첨부이미지, 상품이미지)
	// 이름은 반드시 multipartResolver
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("utf-8");
		multipartResolver.setMaxUploadSize(-1);
		return multipartResolver;
	}
	
	// 트랜잭션관리자
	@Bean
	public DataSourceTransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}
}
