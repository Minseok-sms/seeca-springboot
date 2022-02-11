package com.webapp.seeca.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webapp.seeca.model.Board;
import com.webapp.seeca.model.User;
// User이라는 객체를 관리하는 repository, pk는 integer

@Repository
public interface BoardRepository extends JpaRepository<Board, Integer> {
	
}
