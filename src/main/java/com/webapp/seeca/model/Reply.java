package com.webapp.seeca.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Reply {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false, length = 200)
	private String content;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_Id")
	private User user;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "board_Id")
	private Board board;
	
	@CreationTimestamp
	private Timestamp createDate;
	
	@UpdateTimestamp
	private Timestamp updateDate;
	
}
