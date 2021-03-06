<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 #btn {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #1e263c;
    padding: 0px 40px;
    margin: 0 0px;
    line-height: 45px;
    float: right;
}
 #reply-modify-button {
 	display: inline-block !important;
    padding: 8px 10px;
    font-size: 12px;
    text-decoration: none;
    vertical-align: middle;
    cursor: pointer;
    border-radius: 5px;
    -webkit-transition-duration: 0.2s;
    -webkit-transition-timing-function: ease;
    transition-duration: 0.2s;
    transition-timing-function: ease;
    margin-left: 370px;
    margin-top: -5px;
 }
 #reply-delete-button {
	display: inline-block !important;
    padding: 8px 10px;
    font-size: 12px;
    text-decoration: none;
    vertical-align: middle;
    cursor: pointer;
    border-radius: 5px;
    -webkit-transition-duration: 0.2s;
    -webkit-transition-timing-function: ease;
    transition-duration: 0.2s;
    transition-timing-function: ease;
    margin-left: 420px;
    margin-top: -65px;
 }
	#container {
    clear: both;
    position: relative;
    margin: 35px auto 0px;
    padding: 0 0 50px 0;
    width: 1000px;
    z-index: 1;
	}
	#container td {
    float: left;
    margin: 20px;
    border: 1px solid #d8d8d8;
    border-bottom: 3px solid #d8d8d8;
    background: #fff;
    width: 310px;
    min-height: 330px;
    overflow: hidden;
	}
	#btn_write {
    color: #fff;
    font-size: 15px;
    border: none;
  	background: #1e263c;
    padding: 0px 50px;
    margin: 0 0px;
    line-height: 45px;
    float:right;
    margin-right:120px;
	}
	.webzineTypeView {
    clear: both;
    border-top: 3px solid #4a4a4a;
    border-bottom: 3px solid #4a4a4a;
    margin: 50px 0 20px 0;
    width:1000px;
    height:100%;
	}
	.webzineTypeView .headWrap {
    background: #f5f5f5;
    position: relative;
    height: 60px;
    padding: 10px 30px;
    font-size: 14px;
    color: #222222;
    border-bottom: 1px solid #dedede;
    word-break: keep-all;
    word-wrap: break-word;
	}
	.webzineTypeView .bodyWrap {
		padding: 21px;
    color: #555555;
    font-size: 14px;
    line-height: 35px;
    word-break: keep-all;
    word-wrap: break-word;
	}
	.mr-t10 {
    margin-top: 10px !important;
	}
	.webzineTypeView .headWrap .category {
    color: #41a1eb;
    font-size: 14px;
	}
	.webzineTypeView .headWrap .date {
    position: absolute;
    right: 30px;
    top: 18px;
	}
	.webzineTypeView .headWrap .date p {
    float: left;
    color: #555555;
    margin-left: 30px;
    font-size: 14px;
	}
#btn_add {
    color: #000;
    font-size: 15px;
    border: none;
    padding: 0px 10px;
    line-height: 45px;
    float: right;
}
.new-reply-button {
		cursor: pointer; 
    color: #000;
    font-size: 15px;
    border: none;
    padding: 0px 30px;
    line-height: 45px;
}
	ol, ul {
	    list-style: none;
	}
	.recommView ul {
    border-top: 1px solid #dedede;
    width: 100%;
    margin-top: 15px;
    margin-bottom: 30px;
	}
	.recommView li {
    position: relative;
    padding: 20px 35px;
    margin-bottom: -40px;
	}
	.recommView li p.txt {
    font-size: 14px;
    color: #444444;
    line-height: 22px;
    margin-bottom: 20px;
    display: block;
    word-break: keep-all;
    word-wrap: break-word;
	}
	.recommView li p span {
    color: #999999;
    font-size: 13px;
    padding: 0 15px;
	}
	.recommView li p #datespan {
    color: #999999;
    font-size: 13px;
    padding: 0 15px;
    display: inline-block; 
    width: 133px; 
    white-space: nowrap; 
    overflow: hidden;
    margin-bottom: -6px;
	}
	.lws #reply_content_input {
		padding: 10px 20px;
    width: 877px;
    color: #666666;
    font-size: 15px;
    margin-top: 0;
    border: 1px solid #cccccc;
    line-height: 24px;
    height: 70px;
    box-sizing: content-box;
	}
	#btn_replyadd {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #353535;
    padding: 0px 50px;
    margin-right: -20px;
    line-height: 45px;
    float: right;
    margin-left: 10px;
    width: 180px;
    height: 80px;
    margin-top: 11px;
	}
	.recommView ul li .replyform {
    clear: both;
    color: #999999;
    font-size: 15px;
    height: 30px;
    width: 50px;
    border: 1px solid #dedede;
    padding: 3px 10px;
    background-color: white;
  }
  
#footdiv {
    width: 1000px;
    padding: 0 30px 30px 30px;
    text-align: center;
    color: gray;
    white-space: pre-line;
    position:absolute;
  	bottom:0;
  	margin-bottom: -143px;
}
</style>
<script>
	var appRoot = '${appRoot}'; // ?????????????????? ???????????? contextPath??? ???????????? ??????.
	var rev_seq = ${RevBoard.rev_seq}; 
	var authUser = '${authUser.user_nickname}';
	var user_seq = '${authUser.user_seq}';
	var img = '${RevfileNameList }';
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
<meta name="HandheldFriendly" content="true">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<script src="${appRoot }/resources/rev_js/rev.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
<script>
//??? ?????? ?????? ?????? ????????? ??????
$(document).ready(function() {
		// ?????? ??????
		function dateString(date) {
			var d = new Date(date);
			return d.toISOString().split("T")[0];
			
			
		}
		
		if (img == null || img == '') {
			$('.webzineTypeView').css('height', '588px');
		}
		
function showList() {
			replyService.getList(rev_seq, function(list) {
				// console.log(list);	
				
				/* var replyUL = $("#reply-ul") */
				var reply_list = $("#reply_list").empty(); // append??? ?????? ????????? ???????????? ??????????????? ?????????????????? ??????
				/* for (var i = 0; i < list.length; i++) {
					var replyLI = '<li class="media" data-reply_seq="'
						+ list[i].reply_seq + '"><div class="media-body"><h5>'
						+ list[i].reply_writer + '<small class= "float-right">'
						+ dateString(list[i].reply_regdate) + "</small></h5>"
						+ list[i].reply_content + "<hr class='dashHr'></div></li>";
						
						
						replyUL.append(replyLI); 
						style="l"
					}  */
					  for (var i = 0; i < list.length; i++) {
						  
							var replyLI = '<ul>'
														+'<li style="border-top:none;" data-reply_seq="'+list[i].reply_seq+'">'
														+'<p class="txt">'+list[i].reply_content+'</p>'
														+'<p><span>'+list[i].reply_writer+'</span>'
														+'<span id="datespan">'+dateString(list[i].reply_regdateKST)+'</span>'
														+'</p>'
														+'</li>'
														+'</ul>';
														
							reply_list.append(replyLI);
						
					  }
							
							
							
							
							
/* 							'<article data-reply_seq="' + list[i].reply_seq + '"><header style="z-index:5;line-height: 40px;">'
						+  '<span class="guest">'
						+ list[i].reply_writer
						+  '</span><span class="bo_vc_hdinfo"><i class="far fa-clock" aria-hidden="true"></i>&nbsp<small class="text-secondary">'
						+ dateString(list[i].reply_regdateKST) + '</span></small></header><div class="cmt_contents" >'
						+ list[i].reply_content
						+ '<textarea style="display:none">' 
						+  list[i].reply_content  
						+ '</textarea></div></article>' */
						 
						
						
						
				}),
			function(err) {
			};
}
		
$("#new-reply-button").click(function() {
	console.log("new reply button clicked!");
	$("#new-reply-modal").modal("show");
});
//??? ?????? ?????? ?????? ?????? ????????? ??????
$("#reply-submit-button").click(function() {
	
	// input?????? value ???????????? ????????? ??????
	var reply_content = $("#reply_content-input2").val();		
	var reply_writer = $("#reply_writer-input2").val();
	
	// ajax ????????? ?????? ????????? ?????????
	var data = {reply_boardname: 'RevBoard', reply_boardseq: rev_seq, reply_content: reply_content,  reply_writer: reply_writer}
	
	replyService.add(data,
			function() {
			/* $("#reply-ul").empty();	????????? ???????????? ???????????? ???????????? 
		   	showList();					????????????????????? ????????? ???????????? ?????????
		   	alert("?????? ????????? ??????????????????"); */
				
		   	
		   	// ?????? ?????? ???????????? ??????
				 showList(); 
				// location.reload(); ?????????????????? ?????????????????? ??????
				
				alert("?????? ????????? ?????????????????????.");
				
				
				
				
				
	},
			function() {
		if (reply_content == null || $.trim(reply_content) == "") {
			alert("????????? ??? ???????????????!");
			location.reload();
		}
			
	});
	
	// ????????? ??????
	$("#new-reply-modal").modal("hide");
	// ????????? ?????? input ????????? value??? ?????????
	$("#reply_content-input2").val("");
	
	
	
	
	
	
});
//reply-ul ?????? ????????? ??????
$("#reply_list").on("click", "li",  function() { // on???????????? ???????????? reply-ul ???????????? <li> ??? ????????????
	//console.log("reply ul clicked.....");	   // ?????? ??????????????????.
	console.log($(this).attr("data-reply_seq"));		// ???????????? this??? click???????????? ?????? li??? ??????.
	// ????????? ?????? ????????????
	var reply_seq = $(this).attr("data-reply_seq");
	replyService.get(reply_seq, function(data) {
		console.log(reply_seq);
		console.log(data);
		console.log(data.reply_writer);
		
		//<div id="ddd">
		//<button id="reply-modify-button"type="button" class="btn btn-primary">??????</button>
		//<button id="reply-delete-button"type="button" class="btn btn-danger">??????</button>
		//</div>
		
		var modifyMd = $("#modify-footer");
		var namei = data.reply_writer;
		var ok = '';
		if (authUser == data.reply_writer) {
			$('#reply_content-input3').attr("readonly", false);
			ok = '<div id="confirm">'
			+ '<button id="reply-modify-button" type="button" class="btn btn-primary">??????</button>'
			+ '<button id="reply-delete-button" type="button" class="btn btn-danger">??????</button>'
			+ '</div>'
			
			modifyMd.empty();
			modifyMd.append(ok);
			
			//?????? ?????? ????????? ??????
			$("#reply-modify-button").click(function() {
				var reply_seq = $("#reply_seq-input3").val();
				var reply_content = $("#reply_content-input3").val();
				var data = {reply_seq: reply_seq, reply_content: reply_content}
				
				replyService.update(data, function() {
					alert("????????? ?????????????????????.");
					$("#modify-reply-modal").modal("hide");		
					showList();
				},
				function() {
					if (reply_content == null || $.trim(reply_content) == "") {
						alert("????????? ??? ???????????????!");
						location.reload();
					}
				}); 
			});
			
			//?????? ?????? ????????? ??????
			$("#reply-delete-button").click(function() {
				var reply_seq = $("#reply_seq-input3").val();
				var data = {reply_seq: reply_seq}
				
				replyService.remove(data, function() {
					alert("????????? ?????????????????????.");
					$("#modify-reply-modal").modal("hide");
					showList();
				});
			});
			showList();
			
			
			
		} else {
			modifyMd.empty();
			
			$('#reply_content-input3').attr("readonly", true);
			
			ok = '<div id="confirm">'
			+ '<button id="reply-close-button" type="button" class="btn btn-primary">??????</button>'
			+ '</div>'
			modifyMd.append(ok);
			
			$("#reply-close-button").click(function() {
				$("#modify-reply-modal").modal("hide");
			})
			
		}
		
		$("#reply_seq-input3").val(data.reply_seq);
		$("#reply_content-input3").val(data.reply_content);
		$("#reply_writer-input3").val(data.reply_writer);
		$("#reply_boardname-input3").val('RevBoard');
		$("#modify-reply-modal").modal("show");
	});
	
});
//?????? ?????? ????????? ??????
$("#reply-modify-button").click(function() {
	var reply_seq = $("#reply_seq-input3").val();
	var reply_content = $("#reply_content-input3").val();
	var data = {reply_seq: reply_seq, reply_content: reply_content}
	
	replyService.update(data, function() {
		alert("????????? ?????????????????????.");
		$("#modify-reply-modal").modal("hide");		
		showList();
	}); 
});
//?????? ?????? ????????? ??????
$("#reply-delete-button").click(function() {
	var reply_seq = $("#reply_seq-input3").val();
	var data = {reply_seq: reply_seq}
	
	replyService.remove(data, function() {
		alert("????????? ?????????????????????.");
		$("#modify-reply-modal").modal("hide");
		showList();
	});
});
showList();
});
</script>
<script>
	
	
	 $(document).ready(function() {
	
	$('#goodbtn').click(function(){
		   
		  $.ajax({
			  method: "get",
		      url: "${appRoot}/rev/like", 
		      dataType: "json",
		      data: {rev_seq: rev_seq, user_seq: user_seq},
		 	  success: function(res) {
		 		 console.log(res);
		 		  if (res == 0) {
		 			  /* alert("???????????? ??????????????????."); */
			 		  alert("???????????? ??????????????????.");
			 		  location.reload(); 
		 		  } else if (res == 1) {
		 			 alert("???????????? ?????????????????????.");
		 			location.reload();
		 			
		 		  }
		 	  }, error: function(error) {
		 		  alert("??????");
		 		  /* alert("???????????? ?????? ??????????????????."); */
		 	  }
		  });
		    /* .done(function(data) {	
		    	  alert("??????");
		          
		          	if (data == 0) {
		        	  alert("???????????? ??????????????????!");
		          	} else if (data == 1) {
		          		alert("???????????? ?????????????????????.");
		          	} 
		          })
		       .fail(function(xhr, status, er){
		    	  alert(rev_seq);
		    	  alert(user_seq);
		    	  console.log(xhr);
		    	  alert("???????????? ?????? ??????????????????!");
			     }) */
	}); 
	 });
	 $(document).ready(function() {
			
			$('#hatebtn').click(function(){
				   
				  $.ajax({
					  method: "get",
				      url: "${appRoot}/rev/hate",
				      dataType: "json",
				      data: {rev_seq: rev_seq, user_seq: user_seq}, 
				      success: function(res){	
				    	  
				          if (res == 0) {
				        	  alert("???????????? ??????????????????");
				        	  location.reload();
				          } else if (res == 1) {
				        	  alert("???????????? ?????????????????????");
				        	  location.reload();
				          }
				      },
				      error:function(error){
				    	  alert("??????");
				      }
				      
				  });
				});		
			});
	 
	 $(document).ready(function() {
		 
		 $('#login_add').click(function(){
			var a = confirm("???????????? ?????????????????????. ????????? ???????????????????");
			if (a == true) {
				location = '${appRoot}/user/login';
			} else if (a == false) {
			 //alert("???????????? ???????????? ?????????.");	 
			}
		 });
		 $('#login_add2').click(function(){
			var a = confirm("???????????? ?????????????????????. ????????? ???????????????????");
			if (a == true) {
				location = '${appRoot}/user/login';
			} else if (a == false) {
			 //alert("???????????? ???????????? ?????????.");	 
			}
		 });
	 });
	 $(document).ready(function() {
		 
	 	$('#new-reply-button1').click(function(){
	 		var b = confirm("???????????? ?????????????????????. ????????? ???????????????????");
	 		if (b == true) {
	 		location = '${appRoot}/user/login';
	 		} else if (b == false) {
	 		// ???????????????
	 		}
	 	});
	 });
</script>

<title>Insert title here</title>
</head>
<body>
<u:mainNav></u:mainNav>
	<section id="container">
		<div class="webzineTypeView">
			<div class="headWrap">
				<p class="mr-t10">${RevBoard.rev_title }</p>
				<div class="date">
		
					<p>
						<strong>????????? : ${RevBoard.rev_writer } </strong>
					</p>
					
						<c:if test="${RevBoard.rev_updatedate == null }">
							<p>
								<strong>????????? :</strong>
								<fmt:formatDate value='${RevBoard.rev_regdate}' pattern='yyyy??? MM??? dd??? h??? m???'/>
							</p>
						</c:if>
						<c:if test="${RevBoard.rev_updatedate != null }">
							<p>
								<strong>????????? :</strong>
								<fmt:formatDate value='${RevBoard.rev_updatedate}' pattern='yyyy??? MM??? dd??? h??? m???'/>
							</p>
						</c:if>
					
				</div>
			</div>
			<!-- ?????? -->
			<div class="bodyWrap">
				<div class="form-group" style="margin-top:5px;">
					<input readonly hidden value="${RevBoard.rev_filename }" type="text" class="form-control" id="input3" />	
					<c:forEach items="${RevfileNameList }" var="revImg" varStatus="imgNum">
						<img onerror="this.src='${appRoot }/resources/noimage.jpg'" alt="" src="${appRoot }/resources/upload/${revImg}" height="280px" width="260px">
					 </c:forEach>
				</div>
				<p>${RevBoard.rev_content }</p>
			</div>
		</div>
		<c:url value="/rev/modify" var="modifyLink">
			<c:param name="rev_seq" value="${RevBoard.rev_seq }" />
			<c:param name="pageNum" value="${cri.pageNum }" />
			<c:param name="amount" value="${cri.amount }" />
			<c:param name="type" value="${cri.type }"/>
			<c:param name="keyword" value="${cri.keyword }"/>
		</c:url>
		<c:url value="/rev/list" var="listLink">
			<c:param name="rev_seq" value="${RevBoard.rev_seq }" />
			<c:param name="pageNum" value="${cri.pageNum }" />
			<c:param name="amount" value="${cri.amount }" />
			<c:param name="type" value="${cri.type }"/>
			<c:param name="keyword" value="${cri.keyword }"/>
		</c:url>
		<div class="form-group" style="float: right;">
			<c:if test="${authUser != null }">
				<button id="goodbtn" class="btn btn_b03" style="border: 0;outline: 0;"><i class="fas fa-thumbs-up" aria-hidden="false"></i>&nbsp&nbsp${RevBoard.rev_good }</button>
				<button id="hatebtn" class="btn btn_b03" style="border: 0;outline: 0;"><i class="fas fa-thumbs-down" aria-hidden="false"></i>&nbsp&nbsp${RevBoard.rev_hate }</button>
			</c:if>
			<c:if test="${authUser == null }">
				<a id="login_add" class="btn btn_b03" style="border: 0;outline: 0;"><i class="fas fa-thumbs-up" aria-hidden="false"></i></a>
				<a id="login_add2" class="btn btn_b03" style="border: 0;outline: 0;"><i class="fas fa-thumbs-down" aria-hidden="false"></i></a>
			</c:if>
		</div>
		<a id="btn_add" href="${listLink }">????????????</a> 
		<c:if test="${ sessionScope.authUser.user_nickname eq RevBoard.rev_writer || authUser.user_grade == 0}">
			<a id="btn_add" style="margin-right: 3px;" href="${modifyLink }" >??????</a> 
		</c:if>
		<c:if test="${authUser != null }">
			<a class="new-reply-button" id="new-reply-button">?????? ??????</a>
		</c:if>
		<c:if test="${authUser == null }">
			<a class="new-reply-button" id="new-reply-button1">?????? ??????</a>
		</c:if>
		<!-- ?????? ????????? -->
		<div class="recommView" id="reply_list"></div><br><br>
	
	<u:footer/>
	</section>
	

	<%-- modal ??? ?????? form --%>
	<div class="modal fade" id="new-reply-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						??? ??????
					</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group" >
						<label for="reply_content-input2" class="col-form-label" >
							??????
						</label>
						<input type="text" class="form-control" id ="reply_content-input2" >
					</div>
					<div class="form-group">
						<label for="reply_writer-input2" class="col-form-label" id="reply-writer">
							?????????
						</label>
						<input type="text" class="form-control" id="reply_writer-input2" value="${authUser.user_nickname}" readonly>
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>
					<button id="reply-submit-button"type="button" class="btn btn-primary">??????</button>
				</div>
				
				
				
			</div>
		</div>
	</div>
	
	
	<%-- modal ?????? form --%>
	<div class="modal fade" id="modify-reply-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						?????? / ??????
					</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input id="reply_seq-input3" type="hidden" />
					<div class="form-group">
						<label for="reply_content-input3" class="col-form-label">
							??????
						</label>
						<input type="text" class="form-control" id ="reply_content-input3">
					</div>
					<div class="form-group">
						<label for="reply_writer-input3" class="col-form-label">
							?????????
						</label>
						<input type="text" class="form-control" id="reply_writer-input3" readonly>
					</div>
					<input id="reply_boardname-input3" type="hidden" />
				</div>
				
				<div class="modal-footer" id="modify-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>

				</div>
				
			</div>
		</div>
	</div>

</body>
</html>