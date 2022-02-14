<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<c:choose>
		<c:when test = "${principal.user.getRole() == 'P_USER'}">
		
		</c:when>
		<c:otherwise>
				<div class="jumbotron text-center" style="margin-bottom:0">
				<p>✅ @@@@@@광고 배너 넣는곳 @@@@@@@✅</p>
				</div>
		</c:otherwise>
	</c:choose>
    
 	  
    

</body>
</html>