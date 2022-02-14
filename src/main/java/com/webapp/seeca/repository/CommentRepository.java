package com.webapp.seeca.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webapp.seeca.model.Reply;

public interface CommentRepository extends JpaRepository<Reply, Integer> {
	
}
