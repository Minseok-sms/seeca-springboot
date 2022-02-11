package com.webapp.seeca.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webapp.seeca.model.RoleType;
import com.webapp.seeca.model.User;
import com.webapp.seeca.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	
	@Transactional
	public void 회원가입(User user) {
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword); // 해쉬
		user.setPassword(encPassword);
		user.setRole(RoleType.P_USER);
		userRepository.save(user);
	}
	
	@Transactional
	public void 회원수정(User user) {
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword); // 해쉬
		user.setPassword(encPassword);
		user.setRole(RoleType.P_USER);
		userRepository.save(user);
	}
	

}
