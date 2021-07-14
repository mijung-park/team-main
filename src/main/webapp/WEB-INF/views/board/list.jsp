<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>

<script>
$(document).ready(function() {
	$("#list-pagenation1 a").click(function(e) {
		// 기본 액션 중지 (hyperlink 역할 안함)
		e.preventDefault();
		
		console.log("a요소 클릭됨");
		
		var actionForm = $("#actionForm");
		
		// form의 pageNum input의 값을 a 요소의 href값으로 변경
		actionForm.find("[name=pageNum]").val($(this).attr("href"));
		
		// submit
		actionForm.submit();
	});
});
</script>

</head>
<body>

<div class="container">
	<h2>고객만족센터</h2>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>NO.</th>
				<th>분류</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="board">
				<tr>
					<td>${board.bno }</td>
					<td>
					
					<c:url var="getUrl" value="/board/get" >
						<c:param name="bno" value="${board.bno }" />
						<c:param name="pageNum" value="${pageMaker.cri.pageNum }" />
						<c:param name="amount" value="${pageMaker.cri.amount }" />
						<c:param name="type" value="${pageMaker.cri.type }" />
						<c:param name="keyword" value="${pageMaker.cri.keyword }" />
					</c:url>
					
					<a href="${getUrl}">
						${board.title } 
						<c:if test="${board.replyCnt > 0 }">
						<i class="far fa-comment-dots"></i> ${board.replyCnt }
						</c:if>
					</a>
					
					</td>
					<td>${board.writerName }</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/>
					</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }"/>
					</td>
				</tr>
			</c:forEach>			
		</tbody>
	</table>
</div>

<!--  pagenation -->
<div>
	<nav aria-label="Page navigation example">
	  <ul id="list-pagenation1" class="pagination justify-content-center">
	  
	  	<c:if test="${pageMaker.prev }">
		    <li class="page-item">
		      <a class="page-link" href="${pageMaker.startPage - 1 }">Previous</a>
		    </li>
	  	</c:if>
		
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
		<%-- href value
		href="${appRoot }/board/list?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}"
		 --%>
		    <li class="page-item ${num == cri.pageNum ? 'active' : '' }"><a class="page-link" 
		    href="${num }">${num }</a></li>
		</c:forEach>
	
		<c:if test="${pageMaker.next }">
		    <li class="page-item">
		      <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
		    </li>
		</c:if>
	  </ul>
	</nav>
	
	<%-- 페이지 링크용 form --%>
	<div style="display: none;">
		<form id="actionForm" action="${appRoot }/board/list" method="get">
			<input name="pageNum" value="${cri.pageNum }" />
			<input name="amount" value="${cri.amount }" />
			<input name="type" value="${cri.type }" />
			<input name="type" value="${cri.keyword }" />
		</form>
	</div>
</div>


</body>
</html>