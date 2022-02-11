package com.webapp.seeca.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	//인증이 안된 사용자들이 출입 할수있는경로 
	//     /auth/** 
	//     홈경로 /
	//     /js/**, /css/**, 
	@GetMapping("/auth/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}

	@GetMapping("/auth/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}

	@GetMapping("/user/updateForm")
	public String updateForm() {
		return "user/updateForm";
	}
	
}
