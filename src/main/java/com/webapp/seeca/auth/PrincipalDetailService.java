package com.webapp.seeca.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.webapp.seeca.model.User;
import com.webapp.seeca.repository.UserRepository;

@Service
public class PrincipalDetailService implements UserDetailsService {
	
	@Autowired
	private UserRepository userRepository;
	//스프링이 로그인 요청을 가로칠 때 , username, password 2개를 가로캔다
	//password는 알아서하고 username이 db에있는가 ?
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User principal = userRepository.findByUsername(username).orElseThrow(() -> {
			return new UsernameNotFoundException("해당유저가 존재하지 않음.");
		});
		return new PrincipalDetail(principal); // principal 에 해당 User 오브젝트를 넣음
																			// 이때 시큐리티 세션에 유저정보 저장
	}

}
