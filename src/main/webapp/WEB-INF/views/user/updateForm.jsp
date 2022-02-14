<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="../layout/header.jsp"%>


<div class="container">
	<h1 style="text-align:center">Modify Profile</h1>
	 <form>
	 	  <input type = "hidden" id ="id" value = "${principal.user.id}"/>
		  <div class="form-group">
		    <label for="username">Username</label>
		    <input type="text" value = "${principal.user.username}"class="form-control" placeholder="Enter username" id="username" readonly>
		  </div>
		
		  <div class="form-group">
		    <label for="password">Password</label>
		    <input type="password"  class="form-control" placeholder="Enter password" id="password">
		  </div>
		  
		  <div class="form-group">
		    <label for="email">Email</label>
		    <input type="email" value ="${principal.user.email}" class="form-control" placeholder="Enter email" id="email">
		  </div>
		  
		  <div class="form-group">
		    <label for="email">Your Status</label>
		    <c:choose>
		    	<c:when test="${principal.user.role == 'USER' }">
		    		 <input type="text" value ="user" class="form-control" placeholder="Enter status" id="role" readonly>
		    	</c:when>
		    	<c:otherwise>
		    		 <input type="text" value ="Pro user" class="form-control" placeholder="Enter status" id="role" readonly>
		    	</c:otherwise>
		    </c:choose>
		   
		  </div>
		  
	</form>
			  <button id="btn-update" class="btn btn-primary">update</button>
		
</div>
<script src ="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>



    