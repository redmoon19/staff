<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Call-update</title>

<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.theme.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/jquery-ui.js"></script>

<script type="text/javascript">

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
	
	<form name="frm" method="post" action="CallServlet?command=call_update">
		
		<div class="ui-widget">
		
			<table class="ui-widget ui-widget-content">
				<tr>
					<th>공지사항 번호</th>
					<td>
						<input type="text" size="12" name="notno" readonly="readonly" value="${call.notno }">
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<input type="text" name="empno" readonly="readonly" value="${call.empno }">
					</td>
				</tr>
				<tr>
					<th>공지사항 제목</th>
					<td>
						<input type="text" name="notname" value="${call.notname }">
					</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>
						<input type="text" name="notdate" readonly="readonly" value="${call.notdate }">
					</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>
						<input type="text" size="12" readonly="readonly" name="nothits" value="${call.nothits }">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea cols="10" rows="5" name="notcon">${call.notcon }</textarea>
					</td>
				</tr>
				<tr>
					<th>삭제여부</th>
					<td>
						<input type="text" size="12" name="notdel" readonly="readonly" value="${call.notdel }">
					</td>
				</tr>
				
			</table>
			<br><br>
			<input type="submit" value="등록">
			<input type="reset" value="다시 작성">
			<input type="button" value="목록" onclick="location.href='CallServlet?command=call_list'">
			
		</div>
		
	</form>
	
</div>

<div class="foot">
</div>

</body>

</html>