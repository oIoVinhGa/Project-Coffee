package poly.edu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import poly.edu.service.AuthInterceptor;
import poly.edu.service.GlobalInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
	@Autowired GlobalInterceptor global;
	@Autowired AuthInterceptor auth;
	
	@Override
	public void addInterceptors(InterceptorRegistry regisry) {
		regisry.addInterceptor(global)
		.addPathPatterns("/**")
		.excludePathPatterns("/assets/**");
		
		regisry.addInterceptor(auth)
		.addPathPatterns("/account/**","/admin/**","/shopping-cart/views")
		.excludePathPatterns("/assets/**","/home/**","/admin/contact/create");
	}
}
