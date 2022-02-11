package com.webapp.seeca.test;

import java.util.List;
import java.util.function.Supplier;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.webapp.seeca.model.RoleType;
import com.webapp.seeca.model.User;
import com.webapp.seeca.repository.UserRepository;



@RestController
public class DummyControllerTest {

	@Autowired
	private UserRepository userRepository;
//	@PostMapping("/dummy/join")
//	public String join(@RequestParam("username") String username,@RequestParam("password") String password,@RequestParam("email") String email) {
//		
//		System.out.println("username : " + username);
//		System.out.println("password : " + password);
//		System.out.println("email : " + email);
//		return "회원가입완료";
//	}
	
//	@PostMapping("/dummy/join")
//	public String join(User user) {
//		
//		System.out.println("username : " + user.getUsername());
//		System.out.println("password : " + user.getPassword());
//		System.out.println("email : " + user.getEmail());
//		return "회원가입완료";
//	}
	
	@PostMapping("/dummy/join")
	public String join(User user) {
		
		user.setRole(RoleType.USER);
		userRepository.save(user);
		return "회원가입완료";
	}
	
	@GetMapping("/dummy/user")
	public List<User> find(){
		return userRepository.findAll();
	}
	@GetMapping("/dummy/user/{id}")
	public User detail(@PathVariable int id) {
		User user = userRepository.findById(id).orElseThrow(new Supplier<IllegalArgumentException>() {
			public IllegalArgumentException get() {
				return new IllegalArgumentException("해당 유저는 없습니다. id : " + id);
			}
		});
		return user; // 스프링부트 MessasgeConverter가 자바객체를 
						//Jaskson라이브러리를 호출해서 json형태로 변환해줌.
		
	}
	
	@GetMapping("/dummy/user/page/{id}")
	public List<User> pageList(@PageableDefault(size = 2, sort="id", direction = Direction.ASC) Pageable pageable){
		return userRepository.findAll(pageable).getContent();
	}
	
	@Transactional
	@PutMapping("/dummy/user/{id}")
	public User updateUser(@PathVariable int id, @RequestBody User requestUser) {
		User user = userRepository.findById(id).orElseThrow(new Supplier<IllegalArgumentException>() {
			public IllegalArgumentException get() {
				return new IllegalArgumentException("해당 유저는 없습니다. id : " + id);
			}
		});
		user.setUsername(requestUser.getUsername());
		user.setPassword(requestUser.getPassword());
		user.setEmail(requestUser.getEmail());

		
		return null;
	}
}
