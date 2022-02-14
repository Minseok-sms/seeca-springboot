<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="../layout/header.jsp"%>

<div class="container">
	<a href="/board/community_free">
		<div class="container p-3 my-3  bg-dark text-white">
			<h1>Free Board</h1>
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link" href="/board/community_free"></a></li>
			</ul>
			<c:forEach var="board" items="${boards.content}">
				<h5>${board.title}
					<br>
				</h5>
			</c:forEach>
		</div>
	</a>
	
<a href="/board/community_free">
	<div class="container p-3 my-3 bg-danger text-white">
		<h1>Information Board</h1>
		<ul class="nav justify-content-end">
			<li class="nav-item"><a class="nav-link" href="#"></a></li>
		</ul>
		<h5>Has anyone tried A lutein?</h5>
		<h5>Pharmacy says Bacchus is better than Vita 500</h5>
		<h5>I'm going to buy one of A and V's products</h5>
		<h5>Do pharmacies sell vitamins that have smaller pills?</h5>
	</div>
	</a>
	
	<a href="/board/community_free">
	<div class="container p-3 my-3 bg-warning text-white">
		<h1>Q&A Board</h1>
		<ul class="nav justify-content-end">
			<li class="nav-item"><a class="nav-link" href="#"></a></li>
		</ul>
		<h5>My eyes are dry. Should I go to the hospital?</h5>
		<h5>How much will it cost to pay for medical treatment?</h5>
		<h5>How do you protect your children's eye health?</h5>
		<h5>Pharmacy information.</h5>

	</div>
	</a>


</div>




<%@ include file="../layout/footer.jsp"%>
