<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="../layout/header.jsp"%>
<div class="container">
		 
		 <button class="btn btn-secondary" onclick="history.back()" style="float:right;">Back</button>
		  <c:if test="${board.user.id == principal.user.id}">
 		 		<a href="/board/${board.id}/updateForm" class="btn btn-warning" style="float:right;">Update</a>
 		 		 <button id="btn-board-delete"class="btn btn-danger" style = "float:right;">Delete</button>
 		  </c:if>
 		
 		 <br><br>
 		 
 		 <div>	
 		 		<!-- <div style ="float:left;">글 번호 : <span id = "id"><i>${board.id}</i></span></div> -->
 		 		<div style ="float:right;">Thumbup : <span><i>${board.thumbup}</i></span></div>
 		 		<br>
 		 		<div style = "float:left">Writer : <span><i>${board.user.username}</i></span></div>	
 		 		<div style ="float:right;">Views : <span><i>${board.count}</i></span></div>	 		
 		 </div>
 		 <br>
 		 
 		 
			  <div>
			    	<h3>${board.title}</h3>
			  </div>
		  
		  <hr>
		  
		  <div>
		  		<div>${board.content}</div>
	 	  </div>
	 	  
	 	  <hr>  
	 	  
	 	  
	 	  <div class="card">
	 	  		<form>
 	  					<input type= "hidden" id="userId" value = "${principal.user.id}"/>
	 	  				<input type ="hidden" id ="boardId" value="${board.id}"/>
					   <div class = "card-body">
					   		<textarea id="reply-content" rows="/" class="form-control"></textarea>
					   </div>
					   
					   <div class = "card-footer">
					   		<button type ="button" id="btn-reply-save" class="btn btn-primary">Commit</button>
					   	</div>
				</form>
	 	  </div>
	 	  <br>
	 	  <div class="card">
					   <div class = "card-header">Comment</div>
					   <ul id="reply-box"class="list-group">
					   	
					   <c:forEach var="reply" items="${board.replys}">
					   			<li id="reply-${reply.id}" class="list-group-item d-flex justify-content-between">
						  			<div>${reply.content}</div>
						  			<div class="d-flex">
						  				<div class="font-italic">Writer : ${reply.user.username}&nbsp;</div>
						  				<c:if test="${reply.user.id == principal.user.id}">
						  					<button onclick = "index.replyDelete(${board.id}, ${reply.id})" class="badge">Delete</button>
						  				</c:if>
						  				<div></div>
						  			</div>
					  			</li>
					   </c:forEach>
					  	
					  </ul>
	 	  </div>
	 	  <br>
</div>
  
<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>


    