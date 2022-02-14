<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="layout/header.jsp"%>

<div class ="container">
	<c:choose>
		<c:when test="${!empty principal}">
				<h1 style="text-align:center">Welcome ${principal.user.username } 
				<c:choose>
						<c:when test="${principal.user.getRole() == 'P_USER'}">
								(Pro user)</h1>
						</c:when>
						<c:otherwise>
								(user)</h1>
						</c:otherwise>
				</c:choose>
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
	</c:choose>

</div>




<%@ include file="layout/footer.jsp"%>
