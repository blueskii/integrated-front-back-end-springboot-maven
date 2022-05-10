package com.mycompany.backend;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

//1.WAS에 배포할 경우에만 필요한 클래스
//2.WAS 배포 -> ServletInitializer -> onStartup 메소드 자동 실행
//  1)Servlet 3.0+ 에서는 javax.servlet.ServletContainerInitializer 구현 클래스의 onStartup() 실행
//  2)Spring은 ServletContainerInitializer 구현 클래스로 SpringServletContainerInitializer를 제공
//  3)SpringServletContainerInitializer는 WebApplicationInitializer 구현 클래스를 찾아 onStartup() 실행
//  4)WebApplicationInitializer 구현 클래스가 SpringBootServletInitializer임
public class ServletInitializer extends SpringBootServletInitializer {
	public ServletInitializer() {
		System.out.println("com.mycompany.backend.ServletInitializer.<Init>()");
	}
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		System.out.println("com.mycompany.backend.ServletInitializer.configure()");
		return application.sources(BackEndSpringbootApplication.class);
	}
}
