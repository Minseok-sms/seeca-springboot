package com.webapp.seeca.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.webapp.seeca.auth.PrincipalDetail;
import com.webapp.seeca.model.Board;
import com.webapp.seeca.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	
	@GetMapping({"", "/"})
	public String index() {
		return "index";
	}
	@GetMapping("/board/community_free")
	public String freeboard(Model model, @PageableDefault(size = 5, sort="id", direction = Direction.DESC) Pageable pageable) {
		model.addAttribute("boards", boardService.글목록(pageable)); // model안에 board객체들을 담아서 boards라는 변수로 index.jsp에들고간다.
		return "board/community_free";
	}
	
	@GetMapping("/board/premium")
	public String premium() {
		return "board/premium";
	}
	
	@GetMapping("/board/community")
	public String community(Model model, @PageableDefault(size = 4, sort="id", direction = Direction.DESC) Pageable pageable) {
		model.addAttribute("boards", boardService.글목록(pageable));
		return "board/community";
	}
	
	@GetMapping("/board/saveForm")
	public String save() {
		return "board/saveForm";
	}
	
	@GetMapping("/board/{id}")
	public String findById(@PathVariable int id, Model model) {
		Board board = boardService.글상세보기(id);
		board.setCount(board.getCount()+1);
		boardService.글업데이트(board);
		model.addAttribute("board", board);
		return "board/detail";
	}
	
	@GetMapping("/board/{id}/updateForm")
	public String updateForm(@PathVariable int id, Model model) {
		model.addAttribute("board",boardService.글상세보기(id));
		return "board/updateForm";
	}
}
