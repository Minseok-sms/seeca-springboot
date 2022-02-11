package com.webapp.seeca.controller.api;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.webapp.seeca.dto.ResponseDto;
import com.webapp.seeca.model.RoleType;
import com.webapp.seeca.model.User;
import com.webapp.seeca.service.UserService;

//여기서는 js가 보낸 json형식을 처리하는 곳.
@RestController
public class UserApiController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder encode;
	
	//회원가입
	@PostMapping("/auth/joinProc")
	public ResponseDto<Integer> save(@RequestBody User user) {
		
		userService.회원가입(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1); 
		// user.js 에 done부분에 resp로 반환시켜줌
	}
	@PutMapping("/user")
	public ResponseDto<Integer> update(@RequestBody User user) {
		
		userService.회원수정(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1); 
		// user.js 에 done부분에 resp로 반환시켜줌
	}
	

}
