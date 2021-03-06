<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/default.css?ver=1155">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/skin/board/qna/style.css?v2">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/board.common.css?ver=1155">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/js/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/mobile.css?ver=1155">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/css/contents.css?ver=1155">
<link rel="stylesheet" href="http://sample.paged.kr/purewhite/theme/pagedtheme/plugin/featherlight/featherlight.min.css?ver=1155">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script>
	$(document).ready(
			function() {
				var result = '${result}';
				var message = '${message}';
				// checkModal(result);
				checkModal2(message);
				history.replaceState({}, null, null);
				function checkModal2(message) {
					if (message && history.state == null) {
						$("#myModal .modal-body p").html(message);
						$("#myModal").modal("show");
					}
				}
				
			});
</script>

<script>
$(document).ready(function (){
	$('#btn_submit').click(function(){
			var revArr = ["rev_title","rev_content"];
			//?????? ??? ??? ??????
			for(var i=0;i<revArr.length;i++){
				//alert(arr[i]);
				if($.trim($('#'+revArr[i]).val()) == ''){
					alert('?????? ?????? ?????? ??? ?????? ????????? ?????????.');
					$('#'+revArr[i]).focus();
					return false;
				}
			}
			//??????
			$("#RevRegister").submit();
	});
});
</script>
<title>???????????? ?????????</title>
<style type="text/css">
#footdiv {
    width: 1000px;
    padding: 0 30px 30px 30px;
    text-align: center;
    color: gray;
    white-space: pre-line;
  	bottom:0;
  	margin-bottom: -143px;
}
#container1 {
	clear: both;
	posistion: relative;
	margin: 35px auto 0px;
	padding: 0 0 50px 0;
	width: 1000px;
	z-index: 1;
}
</style>
</head>
<body>
<u:mainNav></u:mainNav>
<c:choose>
	<c:when test="${authUser != null}">
		<div class="container">
			<section id="container1">
				<h3>?????? ??????</h3><br>
				<form action="${appRoot }/rev/register" id="RevRegister" method="POST" enctype="multipart/form-data"style="width:100%">
    
			    <c:if test="${errors.noCategory }">
					<small class="form-text text-muted">
							??????????????? ???????????????
					</small>
				</c:if>
	<%-- <input type="text" name="rev_category" class="form-group" value="${category }"/> --%> 
	
				<div class="bo_w_tit write_div">
        			<label for="wr_subject" class="sound_only">????????????<strong>??????</strong></label>
        				<div id="autosave_wrapper write_div " style="margin-bottom:8px;">
				            <select name="rev_category" class="form-control" style="width:160px;" required>
								<option value="">???????????? ??????</option>
								<option value="1">?????????</option>
								<option value="2">????????????</option>
								<option value="3">?????????</option>
								<option value="4">????????????</option>
							</select>
         				</div>
        
    			</div>
    	<div class="bo_w_tit write_div">
        	<label for="wr_subject" class="sound_only">??????<strong>??????</strong></label>
        	<div id="autosave_wrapper write_div" style="margin-bottom:8px;">
            	<input type="text" id="rev_title"name="rev_title" value="${title }" maxlength="50" id="wr_subject" required="" class="frm_input full_input required" size="50"  placeholder="??????">
            </div>
    	</div>

    	<div class="write_div" >
        	<label for="wr_content" class="sound_only">??????<strong>??????</strong></label>
        	<div class="wr_content " style="margin-bottom:8px;">
                 <span class="sound_only">???????????? ??????</span>
			<textarea id="rev_content" name="rev_content" class="frm_input full_input required" value="" maxlength="1000" style="width:100%;height:300px" placeholder="????????? ????????? ?????????. 2000??? ?????? " required></textarea>
			<span class="sound_only">??? ????????? ???</span>                    </div>
        	<input type="text" name="rev_writer" class="form-group" value="${authUser.user_id }" hidden/>
    	</div>

		<div class="bo_w_info mt-3" ><b>????????????</b>
     		<div class = "inputArea">
				<label for="revImg"></label>
	
 							<!--?????????????????????  -->
					<div class = "input_wrap" >
						<input type="file"  class="form-control" name="upload" id="input_imgs" multiple="multiple" accept="image/*"/>
					</div>	
					<div class="imgs_wrap">
						<img id="img"/>
							<script>
							  
							  $("#input_imgs").on("change", handleImgFileSelect);
							  //??????????????????
							  function handleImgFileSelect(e){
									//????????? ????????? ?????????
									$(".imgs_wrap").empty();
									
									var files = e.target.files;
									var filesArr = Array.prototype.slice.call(files);
								
									filesArr.forEach(function(f){
										if(!f.type.match("image.*")){
											
											// ????????? ?????? ????????? ????????????????????????
											var message = "????????????????????? ???????????????";
											function checkModal(message){
												if (message && history.state == null) {
													$("#myModal .modal-body p").html(message)
													$("#myModal").modal("show");
												}
											}
											checkModal(message);
											
											return;
										}
										
										var reader = new FileReader();
										reader.onload = function(e){
											
											 var html = "<div><img width=\"200\" src=\""+e.target.result+"\"></div>";
											$(".imgs_wrap").append(html);
										
										}
										reader.readAsDataURL(f);
									});
							 }
						 	</script>
						<!--?????????????????? -->
					</div>
 			</div>     
      </div>          
   

        
    

    <div class="btn_confirm write_div">
        <input type="submit" value="????????????" id="btn_submit" accesskey="s" class="btn_submit btn-secondary" style="border: thin;">

    <u:footer />

    </div> 
    </form>
</section>
</div>
 </c:when>
 <c:otherwise>
 	<script>
			alert('????????? ??? ????????? ?????? ???????????????.');
			location.href='${appRoot}/rev/list';
		</script> 
 </c:otherwise>
 </c:choose>
</body>
</html>