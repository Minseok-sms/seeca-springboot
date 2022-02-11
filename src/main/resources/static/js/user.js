let index = {
	init:function(){
		$("#btn-save").on("click", ()=> {
			this.save();
		}),
		$("#btn-update").on("click", ()=> {
			this.update();
		});
	},
	
	save:function(){
		let data = {
			username: $("#username").val(),
			password: $("#password").val(),
			email: $("#email").val()
		};
		
			$.ajax({
			//회원가입수행요청
			type: "POST",
			url: "/auth/joinProc",
			data:JSON.stringify(data), 
			contentType: "application/json; charset=utf-8", //body데이터가 어떤타입인지
			dataType:"json" //요청을 서버로해서 응답이왔을때 문자열이 생긴게 json이면
										// javascript오브젝트로 반환
		}).done(function(resp){ // /blog/api/user 에 mapping되는 메서드의 반환값을 받는다.
			if(resp.status == 500){
				alert("회원가입에 실패하였습니다.|n  중복된 아이디가 존재합니다.");
			}else{
				alert("회원가입이 완료되었습니다.");
				location.href="/";
			}
		}).fail(function(error){
			alert(JSON.stringify(error));
		}); //ajax통신을통해 3개의데이터를 json으로변경하여 insert요청
	},
	
	update:function(){
		let data = {
			id: $("#id").val(),
			password: $("#password").val(),
			email: $("#email").val()
		};
		
			$.ajax({
			//회원가입수행요청
			type: "PUT",
			url: "/user",
			data:JSON.stringify(data), 
			contentType: "application/json; charset=utf-8", //body데이터가 어떤타입인지
			dataType:"json" //요청을 서버로해서 응답이왔을때 문자열이 생긴게 json이면
										// javascript오브젝트로 반환
		}).done(function(resp){ // /blog/api/user 에 mapping되는 메서드의 반환값을 받는다.
				alert("회원수정이 완료되었습니다.");
				location.href="/";
		}).fail(function(error){
			alert(JSON.stringify(error));
		}); //ajax통신을통해 3개의데이터를 json으로변경하여 insert요청,
	
	}
	

}

index.init();