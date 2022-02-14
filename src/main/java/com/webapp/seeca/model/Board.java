package com.webapp.seeca.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Board {
		
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false, length = 100)
	private String title; // 제목
	
	@Lob
	private String content; //내용
	
	
	@Column(name = "count")
	@ColumnDefault("0") 
	private int count; // 게시글 조회수
	
	@Column(name = "thumbup")
	@ColumnDefault("0") 
	private int thumbup; // 추천수
	
	@Column(name = "thumbdown")
	@ColumnDefault("0") 
	private int thumbdown; // 비추천수
	
	// Many = board,   One = user
	@ManyToOne(fetch = FetchType.EAGER)  
	@JoinColumn(name="user_Id")
	private User user; // 자동으로 user의 pk가 맵핑된다.
									//user는 board에서 연관관계의 주인이다.
	
	// One = board, Many = reply
	// 연관관계의 주인이아니다. 
	@OneToMany(mappedBy = "board", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	@OrderBy("id desc")
	@JsonIgnoreProperties({"board"})
	private List<Reply> replys;
	
	@CreationTimestamp
	private Timestamp createDate;
	
	@UpdateTimestamp
	private Timestamp updateDate;

}
