package com.mycompany.backend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import lombok.extern.log4j.Log4j2;

//단독(내장 톰캣)으로 실행할 경우에만 필요한 클래스
@SpringBootApplication
public class BackEndSpringbootApplication {
	public static void main(String[] args) {
		SpringApplication.run(BackEndSpringbootApplication.class, args);
	}
}
