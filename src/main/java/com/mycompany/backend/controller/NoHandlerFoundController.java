package com.mycompany.backend.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@ControllerAdvice
public class NoHandlerFoundController implements ErrorController {
	//Spring Boot는 404 에러일 경우, /error로 포워딩
	@RequestMapping("/error")
	public String error() {
		log.info("실행");
		
		//Forward 방식으로 index.html을 응답하므로 URL이 변경되지 않음
		//따라서 Vue 라우트 정보는 남아있게 되어, 현재 페이지 유지
		return "forward:/";
		
		//Redirect 방식으로 index.html을 응답하므로 URL이 변경됨
		//따라서 Vue 라우트 정보는 없어지고 index.html 페이지로 이동
	    //return "redirect:/";
	}	
}
