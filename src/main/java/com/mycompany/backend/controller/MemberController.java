package com.mycompany.backend.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mycompany.backend.dto.Member;
import com.mycompany.backend.security.JwtUtil;
import com.mycompany.backend.service.MemberService;
import com.mycompany.backend.service.MemberService.JoinResult;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/member")
@Slf4j
public class MemberController {
	@Resource
	private MemberService memberService;
	
	@Resource
	private PasswordEncoder passwordEncoder;
	
	@RequestMapping("/join1")
	public Map<String, String> join1(Member member) {
		log.info("실행");
		//활성화 설정
		member.setMenabled(true);
		//패스워드 암호화
		String mpassword = member.getMpassword();
		//PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		mpassword = passwordEncoder.encode(mpassword); 
		member.setMpassword(mpassword);
		//회원 가입 처리
		JoinResult jr = memberService.join(member);
		Map<String, String> map = new HashMap<>();
		if(jr == JoinResult.SUCCESS) {
			map.put("result", "success");
		} else if(jr == JoinResult.DUPLICATED) {
			map.put("result", "duplicated");
		} else {
			map.put("result", "fail");
		}	
		return map;
	}
	
	@RequestMapping("/join2")
	public Map<String, String> join2(@RequestBody Member member) {
		log.info("실행");
		return join1(member);
	}	
	
	@Resource
	private AuthenticationManager authenticationManager;
	
	@PostMapping("/login1")
	public Map<String, String> login1(String mid, String mpassword) throws Exception {
		log.info("실행");		
		if(mid == null || mpassword == null) {
			throw new BadCredentialsException("mid or mpassword cannot be null");
		}	
		//사용자 인증
		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(mid, mpassword);
	    Authentication authentication = authenticationManager.authenticate(token);
	    SecurityContext securityContext = SecurityContextHolder.getContext();
	    securityContext.setAuthentication(authentication);
	    //응답 내용
	    String authority = authentication.getAuthorities().iterator().next().toString();
	    Map<String, String> map = new HashMap<>();
		map.put("mid", mid);
		map.put("jwt", JwtUtil.createToken(mid, authority));
		log.info(map.toString());
		return map;
	}
	
	@PostMapping("/login2")
	public Map<String, String> login2(@RequestBody Member member) throws Exception {
		log.info("실행");
		return login1(member.getMid(), member.getMpassword());
	}	
}




