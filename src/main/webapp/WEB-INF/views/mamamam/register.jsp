<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h2>문의하기</h2>

	<div class="row">
		<div class="col-12">
			<form action="${appRoot }/board/register" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="input2">NAME</label>
					<input id="input2" hidden value="" readonly class="form-control" name="writer">
					<input value="" readonly class="form-control">
				</div>	
				<div class="form-group">
					<label for="input1">TITLE</label>
					<input id="input1" class="form-control" name="title">
				</div>
				<div>
					<label for="input4">CLASSIFY</label>
					<select id="input4" name="sort" class="form-control mr-sm-2">
				  		<option value="">--</option>
				  		<option value="order">주문</option>
				  		<option value="price" }>상품</option>
				  		<option value="delivery" >배송</option>
				  		<option value="etc">기타</option>
			  		</select>
				</div>
				
				<div class="form-group">
					<label for="textarea1">CONTENT</label>
					<textarea id="textarea1" class="form-control" name="content"></textarea>
				</div>
				<div class="form-group">
					<lable for="input3">FILE</lable>
					<input id="input3" class="form-control" type="file" name="file" accept="image/*">
				</div>			
				<input class="btn btn-primary" type="submit" value="작성" />
			</form>
		</div>
	</div>
	
</div>
</body>
</html>