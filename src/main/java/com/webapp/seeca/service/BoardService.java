package com.webapp.seeca.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webapp.seeca.model.Board;
import com.webapp.seeca.model.RoleType;
import com.webapp.seeca.model.User;
import com.webapp.seeca.repository.BoardRepository;
import com.webapp.seeca.repository.UserRepository;




@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;
	
	@Transactional
	public void 글쓰기(Board board, User user) {
		board.setCount(0);
		board.setThumbup(0);
		board.setThumbdown(0);
		board.setUser(user);
		boardRepository.save(board);
	}
	
	@Transactional(readOnly = true)
	public Page<Board> 글목록(Pageable pageable){
		return boardRepository.findAll(pageable);
	}
	
	@Transactional(readOnly = true)
	public Board 글상세보기(int id) {
		return boardRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("글상세보기 실패 : 아이디를 찾을 수 없습니다.");
		});
	}
	
	@Transactional
	public void 글삭제하기(int id) {
		boardRepository.deleteById(id);
	}
	
	@Transactional
	public void 글업데이트(Board board) {
		boardRepository.save(board);
	}
	
	@Transactional
	public void 글수정하기(int id, Board requestBoard) {
		// 영속화를 시킨다.
		Board board = boardRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("글수정하기 실패 : 아이디를 찾을 수 없습니다.");
		});
		board.setTitle(requestBoard.getTitle());
		board.setContent(requestBoard.getContent());
		
		// 이함수가 종료되면서 영속성컨텍스트에 데이터가 변경되었다고 감지 -> 더티채킹
		// 더티채킹이발생하면 자동으로 영속성컨텍스트에 데이터바뀌고 db에 저장시켜준다.
	}
	
	
}
