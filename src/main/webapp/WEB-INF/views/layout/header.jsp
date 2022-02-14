<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
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
<link rel="stylesheet" href="/css/HamMenu.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body>


	<div class="jumbotron text-center" style="margin-bottom: 0">
		<a href="/" style="text-decoration: none; color: black;"><i class="fa fa-eye" style="font-size: 36px"></i></a> <a href="/" style="text-decoration: none; color: black;"><p style="font-size: 30px">SEECA</p></a>
	</div>


	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<ul class="navbar-nav">
			<!-- 
    <li class="nav-item active" >
      <a class="nav-link" href="/" >Seeca</a>
    </li>
     -->
			<c:choose>
				<c:when test="${empty principal}">
					<li class="nav-item"><a class="nav-link" href="/auth/loginForm">Sign In</a></li>
					<li class="nav-item"><a class="nav-link" href="/auth/joinForm">Sign Up</a></li>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${principal.user.getRole() == 'P_USER'}">
							<li class="ham-btn"><a class="menu-trigger" href="#"> <span></span> <span></span> <span></span>
							</a></li>
							<div class="ham-con">
								<div class="navbar-nav"></div>


								<div id="ham-menu-wrap">
									<a href="/" style="text-decoration: none; color: black;"><div style="text-align: center; padding-top: 40px">
											<i class="fa fa-eye" style="font-size: 36px;"></i>
										</div></a> <a href="/" style="text-decoration: none; color: black;"><p style="font-size: 30px; text-align: center">SEECA</p></a>
									<div class="ham-menu mt-5">
										<ul class="ham-top-menu">
											<li><a href="/board/community">Community<i class="bi bi-caret-down-fill"></i></a></li>
										</ul>
										<ul class="ham-top-menu">
											<li><a href="/board/market">Market<i class="bi bi-caret-down-fill"></i></a></li>
										</ul>
										<ul class="ham-top-menu">
											<li><a href="/board/exercise">Exercise<i class="bi bi-caret-down-fill"></i></a></li>
										</ul>
										<ul class="ham-top-menu">
											<li><a href="/board/pro">Pro<i class="bi bi-caret-down-fill"></i></a></li>
										</ul>
										<ul class="ham-top-menu">
											<li><a href="/board/record">Record<i class="bi bi-caret-down-fill"></i></a></li>
										</ul>
										<ul class="ham-top-menu">
											<li><a href="/logout">Logout<i class="bi bi-caret-down-fill"></i></a></li>
										</ul>

									</div>

								</div>
								<a href="/user/updateForm"><div style="float:right; padding-top: 10px;padding-right : 15px;"><i class="fa fa-gear" style="font-size:50px;"></i></div></a>
							</div>
						</c:when>
						<c:otherwise>
							<li class="ham-btn"><a class="menu-trigger" href="#"> <span></span> <span></span> <span></span>
							</a></li>
							<div class="ham-con">
								<div class="navbar-nav"></div>
								<div id="ham-menu-wrap">
									<a href="/" style="text-decoration: none; color: black;"><div style="text-align: center; padding-top: 40px">
											<i class="fa fa-eye" style="font-size: 36px;"></i>
										</div></a> <a href="/" style="text-decoration: none; color: black;"><p style="font-size: 30px; text-align: center">SEECA</p></a>
									<div class="ham-menu mt-5">
										<ul class="ham-top-menu">
											<li><a href="/board/community">Community<i class="bi bi-caret-down-fill"></i></a></li>
										</ul>
										<ul class="ham-top-menu">
											<li><a href="/board/market">Market<i class="bi bi-caret-down-fill"></i></a></li>
										</ul>
										<ul class="ham-top-menu">
											<li><a href="/board/exercise">Exercise<i class="bi bi-caret-down-fill"></i></a></li>
										</ul>

										<ul class="ham-top-menu">
											<li><a href="/board/record">Record<i class="bi bi-caret-down-fill"></i></a></li>
										</ul>
										<ul class="ham-top-menu">
											<li><a href="/logout">Logout<i class="bi bi-caret-down-fill"></i></a></li>
										</ul>
									</div>
								</div>
								<a href="/user/updateForm"><div style="float:right; padding-top: 10px;padding-right : 15px;"><i class="fa fa-gear" style="font-size:50px;"></i></div></a>
							</div>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>


		</ul>
	</nav>
	<div class="jumbotron jumbotron-fluid" style="padding-top: 5px; padding-bottom: 5px; padding-left: 20%;">
		<div class="container">
			<img src="/image/ad.PNG" style="text-align: center;">
		</div>
	</div>
	<script src="/js/menu.js"></script>