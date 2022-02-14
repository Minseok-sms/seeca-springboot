let index = {
	init:function(){
		$("#btn-board-save").on("click", ()=> {
			this.save();
		}),
		$("#btn-board-delete").on("click", ()=> {
			this.deleteById();
		}),
		$("#btn-update").on("click", ()=> {
			this.update();
		}),
		$("#btn-reply-save").on("click", ()=> {
			this.replySave();
		})
		
	},
	
	save:function(){
		let data = {
			title: $("#title").val(),
			content: $("#content").val()

		};
		
			$.ajax({
			//회원가입수행요청
			type: "POST",
			url: "/api/board",
			data:JSON.stringify(data), 
			contentType: "application/json; charset=utf-8", //body데이터가 어떤타입인지
			dataType:"json" //요청을 서버로해서 응답이왔을때 문자열이 생긴게 json이면
										// javascript오브젝트로 반환
		}).done(function(resp){ // /blog/api/user 에 mapping되는 메서드의 반환값을 받는다.
				alert("글쓰기가 완료되었습니다.");
				location.href="/board/community_free";
			
		}).fail(function(error){
			alert(JSON.stringify(error));
		}); //ajax통신을통해 3개의데이터를 json으로변경하여 insert요청,
	
	},
	deleteById:function(){
		
			let id = $("#id").text();
			
			$.ajax({
			//회원가입수행요청
			type: "DELETE",
			url: "/api/board/" + id,
			dataType:"json" 
										
		}).done(function(resp){ 
				alert("삭제가 완료되었습니다.");
				location.href="/";
			
		}).fail(function(error){
			alert(JSON.stringify(error));
		}); 
	},
	
	update:function(){
		let id = $("#id").val();
		
		let data = {
			title: $("#title").val(),
			content: $("#content").val(),
		};
		
			$.ajax({
			//글 업데이트 
			type: "PUT",
			url: "/api/board/" + id,
			data:JSON.stringify(data), 
			contentType: "application/json; charset=utf-8", //body데이터가 어떤타입인지
			dataType:"json" //요청을 서버로해서 응답이왔을때 문자열이 생긴게 json이면
										// javascript오브젝트로 반환
		}).done(function(resp){ // /blog/api/user 에 mapping되는 메서드의 반환값을 받는다.
				alert("글수정이 완료되었습니다.");
				location.href="/";
			
		}).fail(function(error){
			alert(JSON.stringify(error));
		}); //ajax통신을통해 3개의데이터를 json으로변경하여 insert요청
	},
	
	replySave:function(){
		let data = {
			content: $("#reply-content").val()
		};
		let boardId = $("#boardId").val();
		
			$.ajax({
			//회원가입수행요청
			type: "POST",
			url: `/api/board/${boardId}/reply`, 
			data:JSON.stringify(data), 
			contentType: "application/json; charset=utf-8", //body데이터가 어떤타입인지
			dataType:"json" //요청을 서버로해서 응답이왔을때 문자열이 생긴게 json이면
										// javascript오브젝트로 반환
		}).done(function(resp){ // /blog/api/user 에 mapping되는 메서드의 반환값을 받는다.
				alert("댓글 작성이 완료되었습니다.");
				location.href=`/board/${boardId}`;
			
		}).fail(function(error){
			alert(JSON.stringify(error));
		}); //ajax통신을통해 3개의데이터를 json으로변경하여 insert요청,
	},
	replyDelete:function(boardId, replyId){

			$.ajax({
			//회원가입수행요청
			type: "DELETE",
			url: `/api/board/${boardId}/reply/${replyId}`, 
			dataType:"json" 
		}).done(function(resp){ // /blog/api/user 에 mapping되는 메서드의 반환값을 받는다.
				alert("Delete comment complete !");
				location.href=`/board/${boardId}`;
			
		}).fail(function(error){
			alert(JSON.stringify(error));
		}); //ajax통신을통해 3개의데이터를 json으로변경하여 insert요청,
	
	}
}

index.init();