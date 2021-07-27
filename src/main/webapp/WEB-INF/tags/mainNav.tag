<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
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
      <a href="${appRoot }/user/login">Log-in</a>
      <a href="${appRoot }/user/userRegister">Join</a>
      <a href="${appRoot }/qa/list">Q&A</a>
       <a href="${appRoot }/rev/list">Review</a>
      <a href="${appRoot }/user/cart">Cart</a>
      <a href="${appRoot }/user/userRead?user_id=${authUser.user_id}">Mypage</a>
   </span>
   </div>
         
</div>

<div id="header">                  
      <div class="logo"><a href="${appRoot }/main/mainPage"><img src="${appRoot }/resources/logo/logo.jpg" alt="로고"></a></div>
   </div>
</div>

<div class="xans-element- xans-layout xans-layout-category">
    <div class="postion">
   </div>
</div>

