<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Call-write</title>

<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.theme.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/jquery-ui.js"></script>

<script type="text/javascript">

$(function(){
	
	
});

</script>

</head>
<body>

<div class="head">
</div>

<div class="logininfo">
</div>

<div class="lave1">
</div>

<div class="lav">
<!-- 메뉴 버튼 영역 -->
</div>

<div class="con">
<!-- 본문 영역 -->

	<form method="post" action="CallServlet">
		<input type="hidden" name="command" value="call_write">
		<input type="hidden" name="empno" value="nonono">
		<div class="ui-widget">
		
			<table class="ui-widget ui-widget-content">
				<tr>
					<th>제목</th>
					<td><input type="text" name="notname"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" name="notcon"></textarea>
					</td>
				</tr>
			</table>
			
			<br><br>
			<input type="submit" value="등록">			
			<input type="reset" value="취소">
			<input type="button" value="목록" onclick="location.href='CallServlet?command=call_list'">
		</div>
	
	</form>

</div>

<div class="foot">
</div>

</body>
</html>