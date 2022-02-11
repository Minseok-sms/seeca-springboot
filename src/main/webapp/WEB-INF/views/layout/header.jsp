<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="principal"/>
</sec:authorize>
 
 
 
<!DOCTYPE html>
<html>
<head>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
  
</head>
<body>
<h1>${principal.user.getRole()}</h1>
<nav class="navbar navbar-expand-sm bg-success navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="/">Seeca</a>
    </li>
    <c:choose>
    	<c:when test= "${empty principal}">
    			<li class="nav-item">
			      <a class="nav-link" href="/auth/loginForm">로그인</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="/auth/joinForm">회원가입</a>
			    </li>
    	</c:when>
    	<c:otherwise>
		    				<c:choose>
		    					<c:when test = "${principal.user.getRole() == 'P_USER'}">
		    															<li class="nav-item">
																	      <a class="nav-link" href="/board/saveForm">글쓰기</a>
																	    </li>
																	    <li class="nav-item">
																	      <a class="nav-link" href="/user/updateForm">회원정보</a>
																	    </li>
																	     <li class="nav-item">
																	      <a class="nav-link" href="/logout">로그아웃</a>
																	    </li>
																	      <li class="nav-item">
																	      <a class="nav-link" href="/board/premium">프리미엄</a>
																	    </li>
		    					</c:when>
		    					<c:otherwise>
		    															<li class="nav-item">
																	      <a class="nav-link" href="/board/saveForm">글쓰기</a>
																	    </li>
																	    <li class="nav-item">
																	      <a class="nav-link" href="/user/updateForm">회원정보</a>
																	    </li>
																	     <li class="nav-item">
																	      <a class="nav-link" href="/logout">로그아웃</a>
																	    </li>
		    					
		    					</c:otherwise>
																	    
						   </c:choose>
    	</c:otherwise>
    </c:choose>
 

  </ul>
</nav>
    