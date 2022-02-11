package com.webapp.seeca.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webapp.seeca.model.User;
// User이라는 객체를 관리하는 repository, pk는 integer

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	
	Optional<User> findByUsername(String username);
	
		
	// SELECT * FROM user WHERE username = ? AND password =?;	
//	User findByUsernameAndPassword(String username, String password);
		
}
