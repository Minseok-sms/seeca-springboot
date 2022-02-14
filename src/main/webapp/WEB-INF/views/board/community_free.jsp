<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../layout/header.jsp"%>

  <div class="text-center">
	<h1>Free Board</h1>
  </div>
 <div class="text-right">
 <div class="container">
 <img src="https://imyeonn.github.io/assets/images/post/001/30_00title.png"  width ="50px" height="50px">
  <a href="/board/saveForm"><button type="button" class="btn btn-outline-primary" >Write</button></a>
  </div>
  </div>



<div class ="container">

	<c:forEach var="board"  items="${boards.content}"> <!-- model안에 boards라는 변수로 던진 index.jsp를사용 -->
			<div class="card m-2" >
			  <div class="card-body">
			    <h4 class="card-title">${board.title }</h4> <!-- board의 getter메소드가 호출됨. -->
			    <a href="/board/${board.id }" class="btn btn-primary">More Detail</a>
			    <h5 style="float:right;">Post author : ${board.user.username}</h5>
			    <br>
			    <div style="float:right;"><h5>${board.createDate}</h5></div>
			  </div>
			</div>
</c:forEach>
 	
<ul class="pagination justify-content-center">	
	<c:choose>
		<c:when test= "${boards.first}">
					  <li class="page-item disabled"><a class="page-link" href="?page=${boards.number-1}">Previous</a></li>
		</c:when>
		<c:otherwise>
					      <li class="page-item"><a class="page-link" href="?page=${boards.number-1}">Previous</a></li>
		</c:otherwise>
	</c:choose> 
	
	  <c:forEach var="i" begin="1" end="${boards.totalPages}">
            <li class="page-item"><a class="page-link" href="?page=${i-1}">${i}</a></li>
        </c:forEach>
	
	<c:choose>
		<c:when test= "${boards.last}">
					  <li class="page-item disabled"><a class="page-link" href="?page=${boards.number+1}">Next</a></li>
		</c:when>
		<c:otherwise>
					      <li class="page-item"><a class="page-link" href="?page=${boards.number+1}">Next</a></li>
		</c:otherwise>
	</c:choose> 

</ul>
	
</div>

	
</div>




<%@ include file="../layout/footer.jsp"%>
