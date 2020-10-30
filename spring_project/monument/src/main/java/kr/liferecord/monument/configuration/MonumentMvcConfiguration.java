package kr.liferecord.monument.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.liferecord.conf.WebappConfiguration;

@Configuration
@EnableWebMvc
@ComponentScan({"kr.liferecord.test"})
public class MonumentMvcConfiguration extends WebappConfiguration {
//public class MonumentMvcConfiguration implements WebMvcConfigurer {

	@Bean
    public UrlBasedViewResolver resolver() {
       InternalResourceViewResolver resolver = new InternalResourceViewResolver();
       resolver.setViewClass(JstlView.class);
       resolver.setPrefix("/views/");
       resolver.setSuffix(".jsp");
       return resolver;
    }
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry){
//		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
//		registry.addResourceHandler("/webapp/css/**").addResourceLocations("/webapp/css/");
		registry.addResourceHandler("/webapp/**").addResourceLocations("/webapp/");
	}

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer){
		configurer.enable();
	}
	
	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**");
	}

}
