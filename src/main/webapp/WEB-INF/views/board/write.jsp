<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<form action="${appRoot }/board/write" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="input2">NAME</label>
					<input id="input2" hidden value="" readonly class="form-control" name="writer">
					<input value="${pinfo.member.userName }" readonly class="form-control">
				</div>	
				<div class="form-group">
					<label for="input1">TITLE</label>
					<input id="input1" class="form-control" name="title">
				</div>
				<div>분류</div>
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