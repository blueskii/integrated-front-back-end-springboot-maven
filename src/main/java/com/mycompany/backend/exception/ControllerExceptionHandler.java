package com.mycompany.backend.exception;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.slf4j.Slf4j;

@Component
@ControllerAdvice
@Slf4j
public class ControllerExceptionHandler {
	//예외 처리자 설정
	@ExceptionHandler
	public void handleBadCredentialsException(BadCredentialsException e, 
			HttpServletResponse response) throws IOException {
		log.info(e.getMessage());
		
		//인증 실패시 기본적으로 403(권한 없음) 에러가 응답되므로 401(인증 실패) 응답으로 변경
		response.sendError(401);
		
		/*response.setStatus(401);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println(e.getMessage());
		pw.flush();*/
	}
	
	@ExceptionHandler
	public void handleOtherException(Exception e, 
			HttpServletResponse response) throws IOException {
		log.info(e.getMessage());
		e.printStackTrace();
		response.sendError(500);
	}	
}

