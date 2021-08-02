<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
   var userId = "${authUser.user_id}";
   var nickname = "${authUser.user_nickname}";
   var appRoot = "${appRoot}";
</script>
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   $("#btn_plus").click(function() {
      location.href="${appRoot}/product/list";
   })
});
</script>
<title>쇼핑몰</title>
</head>
<style>
#container {
    clear: both;
    position: relative;
    margin: 35px auto 0px;
    padding: 0 0 50px 0;
    width: 1000px;
    z-index: 1;
}
#footdiv {
    width: 100%;
    padding: 0 30px 30px 30px;
    text-align: center;
    color: gray;
    white-space: pre-line;
    bottom:0;
    margin-bottom: -100px;
}
#map {
    width: 600px;
    height: 300px;
    position: absolute;
    margin-top: -240px;
    margin-left: 157px;
}
#foothr {
      margin-bottom: 15rem;
    border: 0;
    border-top: 1px solid rgba(0,0,0,.1);
}
.card {
    width:14.1rem;
    height:30rem;
}
.img_box {
    width: 14.1rem;
    height:19.0rem;
    position: relative;
}
.card img {
    width: 14.0rem;
    height:16.0rem;
}
.card p{
    text-overflow:ellipsis;
    height:40px;
    line-height:20px;   
    overflow:hidden;
}
.cardLine1{
    text-overflow:ellipsis;
    height:20px;
    line-height:20px;   
    overflow:hidden;
}
#btn_plus {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #747474;
    padding: 0px 30px;
    line-height: 45px;
    border-radius: 3px;
    margin-left: 425px;
      margin-top: 20px;
      margin-bottom: -100px;
}
.chat { 
      position:fixed; 
      width:130px; 
      display:inline-block; 
      top: 34%; /* 창에서 위에서 부터의 높이 */ 
      background-color: transparent; margin:0; 
}
#_chatbox { 
      /* overflow: scroll; */
      position:fixed; 
      width: 262px;
      display:inline-block;
      left: 5px; 
      top: 45%; /* 창에서 위에서 부터의 높이 */ 
      background-color: transparent; margin:0; 
} 
/* #messageWindow {
      overflow: scroll;
      width: 214px;
      height:250px; 
      margin-left: 20px; 
      position: fixed; 
      top:45%;
} */
</style>

<style>
body, code{
   font: 0.75em "돋움",Dotum,AppleGothic,sans-serif;
    color: #1c1c1c;
    background: #fff;
}
#header{
   width: 1280px;
    margin: 0 auto;
    text-align: center;
}
#header_bg {
    width: 100%;
    border-bottom: 1px solid #e1e1e1;
    background: #fff;
}
.xans-layout-statelogoff a {
    display: inline;
    font-size: 11px;
    line-height: 14px;
    color: #757575;
    padding-left: 15px;
}
.xans-layout-statelogoff {
    text-align: center;
    font-size: 11px;
    color: #757575;
    font-family: tahoma;
    padding: 12px 0;
    letter-spacing: 1px;
    *zoom: 1;
}
img, fieldset {
    border: none;
    vertical-align: top;
}
.xans-layout-logotop {
    text-align: center;
    width: 1280px;
}
.xans-layout-logotop .logo {
    margin-top: 20px;
}
.xans-layout-category {
    margin: 0 auto;
    width: 1280px;
    text-align: center;
    padding-top: 30px;
    border-bottom: 1px solid /* #ff0000 */ #d3d3d3;
    clear: both;
}
.xans-layout-category .postion {
    z-index: 1;
    margin: 0 auto;
}
.xans-layout-category li {
    position: relative;
    display: inline-block;
    padding: 0 15px;
    z-index: 99000;
}
.xans-layout-category li a {
    display: block;
    height: 34px;
    padding-top: 6px;
    font-weight: bold;
}
a {
    text-decoration: none;
    color: #555;
    outline: none;
    selector-dummy: expression(this.hideFocus=true);
}
#top_cs_line {
    width: 1280px;
    margin: 0 auto;
    clear: both;
    height: 114px;
    border-bottom: 1px solid #d3d3d3;
}
#top_cs_line .top_bbs {
    float: left;
    padding-top: 38px;
    width: 420px;
    border-bottom: 1px solid #d3d3d3;
    padding-bottom: 23px;
}
#top_cs_line .top_bbs li {
    float: left;
    padding-right: 6px;
}
#top_cs_line .top_cs {
    float: left;
    padding-top: 31px;
}
li {
    list-style: none;
}
.xans-layout-searchheader #keyword {
    width: 238px;
    height: 23px;
    padding: 2px 0 0 2px;
    border: 0;
    background: #fff;
    vertical-align: middle;
    color: #444;
    font-size: 11px;
}
input, select, textarea {
    font-size: 100%;
    font-family: "돋움",Dotum;
    color: #1b1b1b;
    vertical-align: middle;
}
.xans-layout-searchheader img {
    cursor: pointer;
} 
#top_cs_line .top_search {
    float: left;
    padding-top: 34px;
}
.xans-layout-searchheader fieldset {
    float: right;
    line-height: 0;
    border: 1px solid #d7d7d7;
}
.box {
    position: relative;
    font-size: 0;
    text-align: left;
    border: 1px solid #666;
    border-radius: 21px;
    box-sizing: border-box;
    width: 300px;
}
.box .form_input {
    display: block;
    width: 200px;
    height: 38px;
    color: #555;
    padding: 0px;
    border: 0;
    border-bottom: 0;
    margin-left: 24px;
    font-size: 14px;
}
.box .btn {
    position: absolute;
    top: 5px;
    right: 23px;
    z-index: 5;
}
</style>
<body>

<div id="header_bg">
   <div class="xans-element- xans-layout xans-layout-statelogoff ">
      <a href="${appRoot }/qa/list">Q&A</a>
      <a href="${appRoot }/rev/list">Review</a>
      <a href="${appRoot }/user/cart">Cart</a>
      <a href="${appRoot }/user/userOrderList" >Order</a>
      <a href="${appRoot }/user/userRead?user_id=${authUser.user_id}">MyPage</a>
    <c:if test="${authUser.user_grade == 0}">
      <a href="${appRoot }/user/userList">UserList</a>
    </c:if>
    <c:choose>
	<c:when test="${authUser == null}">
      <a href="${appRoot }/user/login">Log-in</a>
      <a href="${appRoot }/user/userRegister">Join</a>
    </c:when>
    <c:otherwise>
    	<a href="${appRoot }/user/logout">Log-out</a>
    </c:otherwise>
    </c:choose>
   </div>
         
</div>

<div id="header">                  
      <div class="logo"><a href="${appRoot }/main/mainPage"><img src="${appRoot }/resources/logo/logo.jpg" alt="로고"></a>
      </div>
</div>

<div class="xans-element- xans-layout xans-layout-category">
    <div class="postion">
   </div>
   
</div>


<div id="top_cs_line">

<div class="box" style="float: right; margin-top: 35px;"> 
<!-- <span style="margin-left:115px;"><img src="./images/s45_search_img.jpg"></span> -->
	<form action="${appRoot }/product/list" method="get" class="form-inline">
		<input name="type" value="TC" hidden="hidden"/>
		<input type="text" name="keyword" id="search_str" class="form_input" autocomplete="off" placeholder="검색어를 입력하세요.">
		<input type="image" src="${appRoot }/resources/logo/mi.png" alt="검색" class="btn-search">
	</form>
</div>

</div>

<div class="container">
	<section id="container">
		<div class="row d-flex justify-content-center">
	<!--상품 bootstrap card 시작  -->
	<c:forEach items="${list }" var="product">  
		<c:url value="/product/get" var="productLink">
			<c:param name="product_seq" value="${product.product_seq }"/>
			<c:param name="pageNum" value="${pageDTO.cri.pageNum }"/>
			<c:param name="amount" value="${pageDTO.cri.amount }"/>
			<c:param name="type" value="${pageDTO.cri.type }"/>
			<c:param name="keyword" value="${pageDTO.cri.keyword }"/>            	
			<c:param name="array" value="${pageDTO.cri.array }"/>            	
	  </c:url>
		<c:set var="visibility" value="100%"></c:set>
		<c:if test="${product.product_status == 1 }">
			<c:set var="visibility" value="30%"></c:set>
		</c:if>   
		<div class="card m-2">
			<div class="img_box">
				<a href="${productLink }" >
					<img style="opacity : ${visibility}" src="${appRoot }/resources/upload/${product.product_filename }" alt="Card image cap">
				</a>
				<div style="position:absolute;top:45%;left:30%">
					<c:if test="${product.product_status == 1 }">
						<h5>판매 종료</h5>
					</c:if>
				</div>
			</div>
			<div class="card-body" >
				<a href="${productLink }" >
	            <fmt:formatNumber value="${product.product_price }" type="number" var="price"></fmt:formatNumber>
				<h5 class="card-title"><c:out value="${price }"></c:out>원</h5>
				<p><c:out value="${product.product_name }"></c:out></p>
				</a>
				<div>
					<span><i class="fas fa-eye"></i> ${product.product_readcnt }</span>	
					<span><i class="fas fa-heart"></i> ${product.product_like }</span>										
				</div>
	            <fmt:formatNumber value="${product.product_quantity }" type="number" var="quantity"></fmt:formatNumber>
				<div class="cardLine1">총 ${quantity }개 남음</div>
					<hr>
			    <p class="card-text">판매자 : <c:out value="${ product.user_nickname}"></c:out></p>
			</div>
		</div>
	</c:forEach>
		</div>
	<button id="btn_plus" >더보기 +</button>
	</section>
</div>


<!-- 푸터 -->
<hr id="foothr">
<div class="container">
   <section id="container">
      <footer id="indexFooter">
         <div id="footdiv">
            <div id="map"></div>
            <div class="container" style="margin-left:-12px;">
            
            
            
                        
               사업자명 : 일론마스크 ㅣ 사업자 번호 : 123-45-78901 ㅣ 개인정보관리책임자 : 정동준
               주소 : 서울 강남구 테헤란로7길 7ㅣ 전화 : 02-561-1911 안내ㅣ 메일 : dongjunkorea@naver.com
            </div>
         </div>
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92a45c952d164aafbb2a15b9e8079a49"></script>
            <script>            
               $(document).ready(function() {
                  var container = document.getElementById('map');
                  var options = {
                     center: new kakao.maps.LatLng(37.49965365677918, 127.03047099839327),
                     level: 3
                  };
            
                  var map = new kakao.maps.Map(container, options);
                  
                  // 마커가 표시될 위치입니다 
                  var markerPosition  = new kakao.maps.LatLng(37.49965365677918, 127.03047099839327); 
         
                  // 마커를 생성합니다
                  var marker = new kakao.maps.Marker({
                      position: markerPosition
                  });
      
                  // 마커가 지도 위에 표시되도록 설정합니다
                  marker.setMap(map)
                  
               });
            </script>
      </footer>
   </section>
</div>
<script>
  
</script>
<script type="text/javascript">
  
</script>
</body>
</html>