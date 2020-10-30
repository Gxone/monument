package kr.liferecord.monument.configuration;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

@Configuration
public class MonumentDatabaseConfiguration {

	private static final Logger LOGGER = LoggerFactory.getLogger(MonumentDatabaseConfiguration.class);
	
	static {
		LOGGER.info("Configure Database[Mysql]");
	}
	
	public static final String className = "com.mysql.jdbc.Driver";
	
	@Bean(name="monumentDataSource")
	public DataSource getDataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName(className);
		dataSource.setUrl("jdbc:mysql://172.16.0.21:3306/Monument?autoReconnect=true&useUnicode=true&characterEncoding=utf8&useSSL=false&zeroDateTimeBehavior=convertToNull");
		dataSource.setUsername("lifesemantics");
		dataSource.setPassword("forhealth!");
		dataSource.setValidationQuery("SELECT 1");
		dataSource.setValidationQueryTimeout(86400);
		return dataSource;
	}
	
	@Bean(name="monumentTransactionManager")
	public DataSourceTransactionManager transactionManager() {
		return new DataSourceTransactionManager(getDataSource());
	}
	
	@Bean("monumentMapperScannerConfigurer")
	public MapperScannerConfigurer mapperScannerConfigurer() {
		MapperScannerConfigurer mapperScannerConfigurerBean = new MapperScannerConfigurer();
		mapperScannerConfigurerBean.setSqlSessionFactoryBeanName("monumentSqlSessionFactory");
		mapperScannerConfigurerBean.setBasePackage("kr.liferecord.monument.service.mapper");
		return mapperScannerConfigurerBean;
	}
	
	@Bean(name="monumentSqlSessionFactory")
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
		sessionFactoryBean.setDataSource(getDataSource());
		sessionFactoryBean.getObject().getConfiguration().setMapUnderscoreToCamelCase(true);
		return sessionFactoryBean.getObject();
	}
}
