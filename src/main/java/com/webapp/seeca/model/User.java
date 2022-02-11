package com.webapp.seeca.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@DynamicInsert // insert시에 null인 필드를 없애줌.
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id; // Jpa가 사용하는 auto_increment
	
	@Column(name = "username", nullable = false, length = 100)
	private String username; // 아이디생성
	
	@Column(nullable = false, length = 100)
	private String password; //  패스워드
	
	@Column(name = "email", nullable = false, length = 50)
	private String email; // 이메일
	
	//private String symptom; // 증상
	
	@Enumerated(EnumType.STRING)
	private RoleType role; // 일반유저, 프리미엄유저, 어드민유저
	
	@CreationTimestamp
	private Timestamp createDate; //아이디 생성시간.
	
}
