package com.mycompany.backend.security;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class JwtCheckFilter extends OncePerRequestFilter {
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
		log.info("실행");	
		
		String jwt = null;
        if(request.getHeader("Authorization") != null && request.getHeader("Authorization").startsWith("Bearer ")) {
        	//Authorization 헤더값에서 JWT 토큰 추출
        	jwt = request.getHeader("Authorization").substring(7);
        } else if(request.getParameter("jwt") != null) {
        	//QueryString에서 JWT 토큰 추출(<img src="...?jwt=.../>)
        	jwt = request.getParameter("jwt");
        }
		
        if(jwt != null) {
        	try {
	        	//JWT 유효성 검사
	        	Claims claims = JwtUtil.validateToken(jwt);
	        	if(claims != null) {
	            	//JWT가 유효할 경우 정보 추출
	        		String mid = JwtUtil.getMid(claims);
	        		String authority = JwtUtil.getAuthority(claims);
	        		//SpringSecurity 인증 처리
	        		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(mid, null, AuthorityUtils.createAuthorityList(authority));       
	        		SecurityContext securityContext = SecurityContextHolder.getContext();
	        	    securityContext.setAuthentication(token);
	        	}
        	} catch(Exception e) {
        		log.info(e.getMessage());
        	}
        }
        
		filterChain.doFilter(request, response);
	}
}
 

