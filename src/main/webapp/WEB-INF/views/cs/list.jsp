<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>

<title>고객만족센터</title>
<style>
select {
width: 170px;
height : 40px;
border: 1px solid #D3D3D3;
border-radius: 3px;
}
#search {
width: 100px;
height : 40px;
border: 1px solid #D3D3D3;
border-radius: 3px;
}
#btn_add {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #4a4a4a;
    padding: 0px 30px;
    margin: 0px;
    line-height: 40px;
    float: right;
    width: 120px;
	height : 40px;
	border-radius: 3px;
	text-align: center;
}
#btn_add_search{
	color: #fff;
	font-size: 15px;
	background: #4a4a4a;
}
#container {
    clear: both;
    position: relative;
    margin: 35px auto 0px;
    padding: 0 0 50px 0;
    width: 1000px;
    z-index: 1;
}
#foot{
	background: #f8f8f8;
	border-top: 2px solid #E3E1E1;
	border-bottom: 1px solid #E3E1E1;
}
#menu {
  text-align: center;
}
#menu_no {
  text-align: center;
}
#menu_category {
  text-align: center;
}
#menu_title {
  text-align: center;
}
#menu_nickname {
  text-align: center;
}
#menu_regdate {
  text-align: center;
}
#menu_readcnt {
  text-align: center;
}
#menu_status {
  text-align: center;
}
#regdate {
  text-align: center;
}
#writer {
  text-align: center;
}
#readcnt {
  text-align: center;
}
#status {
  text-align: center;
}
#image {
  text-align: center;
}
thead {
	background: #f8f8f8;
}
#lock {
	background-color:hsl(80,10%,60%);
}
#_color {
	background-color:hsl(80,10%,60%);
}
#admin_color {
	background-color:hsl(80,10%,60%);
}
/* 페이지네이션 */
.pagerWrap {
    position: relative;
    text-align: center;
    margin: 0px 0;
}
.pagerWrap a {
    width: 34px;
    height: 34px;
    color: #333;
    border: 1px solid #dedede;
    text-align: center;
    line-height: 34px;
    background: #fff;
    display: inline-block;
}
.pagerWrap a.on {
    border-color: #222222;
    background: #4a4a4a;
    color: #fff;
}
.pagerWrap a:hover {
    border-color: #4a4a4a;
    color: #4a4a4a;
}
.pagerWrap a.on:hover {
    border-color: #4a4a4a;
    color: #fff;
}
</style>
</head>
<body>

<div class="container">
	<section id ="container">
	<h3>고객만족센터</h3>
		<div class="container-sm">
  			<div class="row">
			    <table class="table table-hover ">
					<!-- 리스트 게시물의 상단 메뉴 -->
      				<thead>
				       <tr>
				         <th id="menu_no">NO.</th>
				         <th id="menu_category">분류</th>
				         <th id="menu_title">제목</th>
				         <th id="menu_nickname">작성자</i></th>
				         <th id="menu_readcnt">조회수</i></th>
				         <th id="menu_status">답변 상태</th>
				       </tr>
				    </thead>

      			<tbody>      
					<!-- c:forEach로 Controller의 list를 board라는 변수로 사용하도록 지정 -->
        			<c:forEach items="${list }" var="board">
          				<tr>
							<td id="menu">${board.cs_seq} </td>
							<td id="menu">${board.cs_category} </td>              
							<td>            
							<div>			
								<c:choose>									
									<%-- cs_secret의 값이 비공개 일때 --%>
					            	<c:when test="${board.cs_secret eq '비공개'}">					            	
					            		<span id="lock" class="badge badge-secondary"> 
					            			<i class="fas fa-lock"></i> 비밀글
					            		</span>
				            			<%-- cs_updatedate의 값이 비어 있지 않을때 --%>
					            		<c:if test="${not empty board.cs_updatedate}">
					            			<span class="badge badge-secondary"> 
					            				<i class="fas fa-edit"></i> 수정됨
					            			</span>
					            		</c:if>
										<%-- cs_readcnt 의 값이 100이 넘을시 --%>
						            	<c:if test="${board.cs_readcnt > 100}">
						            		<span id="star" class="badge badge-secondary"> 
						            			<i class="far fa-star"></i> 인기글
						            		</span>
						            	</c:if> 
						            	<%-- cs_filename 의 값이 비어 있지 않을시  --%>
						            	<c:if test="${not empty board.cs_filename}">
						            		<span id="star" class="badge badge-secondary"> 
						            			<i class="far fa-image"></i> 이미지
						            		</span>
						            	</c:if>						            	           	
					            	</c:when>
					            	
            						<%-- cs_secret의 값이 공개 일때 --%>
									<c:when test="${board.cs_secret eq '공개'}"> 
										<span class="badge badge-secondary"> 
											<i class="fas fa-unlock"></i> 공개글
										</span>
										<%-- cs_updatedate의 값이 비어 있지 않을때 --%>
										<c:if test="${not empty board.cs_updatedate}">
						            		<span class="badge badge-secondary"> 
						            		<i class="fas fa-edit"></i> 수정됨
						            		</span>
						            	</c:if>
										<%-- cs_readcnt 의 값이 100이 넘을시 --%>
						            	<c:if test="${board.cs_readcnt > 100}">
						            		<span id="star" class="badge badge-secondary"> 
						            		<i class="far fa-star"></i> 인기글
						            		</span>
						            	</c:if>		
						            	<%-- cs_filename 의 값이 비어 있지 않을시  --%>
						            	<c:if test="${not empty board.cs_filename}">
						            		<span id="star" class="badge badge-secondary"> 
						            			<i class="far fa-image"></i> 이미지
						            		</span>
						            	</c:if>			            	
									</c:when>									
					            </c:choose>			
							</div>
							
							<!-- 게시물의 제목 a링크를 누를시 해당하는 링크로 이동 -->
							<c:url value="/cs/get" var="boardLink">
					            	<c:param value="${board.cs_seq }" name="cs_seq" />
					            	<c:param value="${pageMaker.cri.pageNum }" name="pageNum" />
					            	<c:param value="${pageMaker.cri.amount }" name="amount" />
					            	<c:param value="${pageMaker.cri.type }" name="type"	/>
					            	<c:param value="${pageMaker.cri.keyword }" name="keyword" />
								</c:url>
							
							<a style="color: #4a4a4a;" href="${boardLink }"><c:out value="${board.cs_title}" /></a>
										 
							</td>
							<!-- 작성자, 작성일 -->            
            				<td>
					            <small id="writer" class="form-text text-dark"><i class="far fa-user"></i>${board.cs_writer}</small>                        
					 			<small id="regdate" class="form-text text-dark"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.cs_regdate}" /> </small>
            				</td>  
            				<!-- 조회수 -->                
            				<td>
				            	<small id="readcnt" class="form-text text-dark">${board.cs_readcnt}</small>
				            </td>
				            <!-- 답변상태 -->
				            <td id="status">
				            	<!-- 유저답변, 관리자 답변 카운트가 0일시 기본값(답변예정)으로 -->
				 				<c:if test="${board.cs_replycnt == 0 && board.cs_replycnt_admin == 0}">
				            		<span class="badge badge-secondary">${board.cs_status }</span> 
				 				</c:if>
				 				<!-- 유저답변의 값이 1이상일시 유저답변의 갯수로 표현 -->
				 		 		<c:if test="${board.cs_replycnt > 0 }">
				            		<span id="user_color" class="badge badge-secondary">유저 답변:${board.cs_replycnt }</span>  
				 				</c:if>
				 				<br>
				 				<!-- 관리자 답변의 값이 1이상일시 관리자 답변의 갯수로 표현 -->
				 				<c:if test="${board.cs_replycnt_admin > 0 }">
				            		<span id="admin_color" class="badge badge-secondary">관리자 답변:${board.cs_replycnt_admin }</span>
				 				</c:if>
				 			</td>															
          			</tr>          
        		</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div id="foot" class="row">
		<div class="col-7 align-left ml-0 my-lg-2">
			<!-- 검색  -->
			<form action="${appRoot }/cs/list" id="searchForm" class="form-inline my-0">			
	      		<select name="type" id="inlineFormCustomSelectPref">      
					<option value="T" ${pageMaker.cri.type eq 'T' ? 'selected' : ''}>제목</option>
					<option value="C" ${pageMaker.cri.type eq 'C' ? 'selected' : ''}>내용</option>
					<option value="S" ${pageMaker.cri.type eq 'S' ? 'selected' : ''}>분류</option>
					<option value="W" ${pageMaker.cri.type eq 'W' ? 'selected' : ''}>닉네임</option>
					<option value="TWC" ${pageMaker.cri.type eq 'TCSW' ? 'selected' : ''}>전체</option>
				</select>
				
					<input class="col-md-4 ml-3" id="search" name="keyword" required value="${pageMaker.cri.keyword }" type="search" placeholder="검색어 입력" aria-label="Search">
					<input type="hidden" name="pageNum" value="1" />
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
					<button class="btn my-2 my-sm-0 ml-3" type="submit" id="btn_add_search">검색</button>
	    	</form>	
		</div>
		
		<div class="col-5 align-right my-lg-2">
			<!-- 글쓰기 처리 세션의 member_id 값이 있을때만 글쓰기 버튼 활성화 -->
			<c:if test="${!empty authUser.member_id}">
	   			<a href="${appRoot }/cs/register/" id="btn_add">글쓰기</a>
	   		</c:if>
		</div> 	
	</div>
	</div>			


<div class="container d-flex justify-content-center" style="margin-top: 15px;">
		<div class="pagerWrap">
			<!-- 페이징 처리 -->
		  	<c:if test="${pageMaker.prev }" >
			  	<c:url value="/cs/list" var="prevLink">
			  		<c:param value="${pageMaker.startPage - 1 }" name="pageNum" />
			  		<c:param value="${pageMaker.cri.amount }" name="amount" />
			  		<c:param name="type" value="${pageMaker.cri.type }"/>
			  		<c:param name="keyword" value="${pageMaker.cri.keyword }"/>	
			  	</c:url>		  			  	
		  			<a href="${prevLink }" style="width:80px;">Prev</a>
		  	</c:if>
		  	
		  	<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
		  		<c:url value="/cs/list" var="pageLink" >
		  			<c:param name="pageNum" value="${num }" />
		  			<c:param name="pageNum" value="${pageMaker.cri.amount }" />	
		  			<c:param name="type" value="${pageMaker.cri.type }"/>
		  			<c:param name="keyword" value="${pageMaker.cri.keyword }"/>		  				  			
		  		</c:url>		  						
					<a class="${pageMaker.cri.pageNum eq num ? 'on' : '' }" href="${pageLink }">${num }</a>
		  	</c:forEach>		  	
		  	
		    <c:if test="${pageMaker.next }">
		  	<c:url value="/cs/list" var="nextLink">
		  		<c:param value="${pageMaker.endPage + 1 }" name="pageNum" />
		  		<c:param value="${pageMaker.cri.amount }" name="amount" />
		  		<c:param name="type" value="${pageMaker.cri.type }"/>
		  		<c:param name="keyword" value="${pageMaker.cri.keyword }"/>	
		  	</c:url>
		    		<a href="${nextLink }" style="width:80px;">Next</a>
		    </c:if>
	</div>
</div>

	</section>
</div>

<div class="modal fade" id="password_input">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						새 댓글
					</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="reply-input" class="col-form-label">
							댓글
						</label>
						<input type="text" class="form-control" id="reply-input">
					</div>
					<div class="form-group">
						<label for="reply-input" class="col-form-label">
							작성자
						</label>
						<input type="text" class="form-control" id="replyer-input">
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="reply-submit-button">등록</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
				
			</div>		
		</div>
	</div>

</body>
</html>