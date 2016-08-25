<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GanyWrite</title>

<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.theme.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/jquery-ui.js"></script>

<script type="text/javascript">
	$(function() {
		$(".datepicker").datepicker({
			 changeYear: true,
			 changeMonth: true,
			 dayNames: ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
			 dayNamesMin: ['월','화','수','목','금','토','일'],
			 monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
			 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			 dateFormat: "yy-mm-dd"
			
		});
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
	
	<form method="post" action="GanyServlet">
		<input type="hidden" name="command" value="gany_write">
	
		<div class="ui-widget">
		
			<table class="ui-widget ui-widget-content">
				<tr>
					<th>사원번호</th>
					<td><input type="text" name="empno"></td>
				</tr>
				<tr>
					<th>부서명</th>
					<td><input type="text" name="deptno"></td>
				</tr>
				<tr>
					<th>직급</th>
					<td><input type="text" name="jobno"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="pswd"></td>
				</tr>
				<tr>
					<th>사원이름</th>
					<td><input type="text" name="ename"></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="fjumin"></td>
					<td><input type="text" name="bjumin"></td>
				</tr>
				<tr>
					<th>입사일</th>
					<td>
						<input type="text" class="datepicker" name="hiredate" size="auto">
					</td>
					
				</tr>
				<tr>
					<th>퇴사일</th>
					<td>
						<input type="text" class="datepicker" name="resigndate" size="auto">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="zipcode"></td>
					<td><input type="text" name="addr"></td>
					<td><input type="text" name="deaddr"></td>
				</tr>
				<tr>
					<th>급여</th>
					<td><input type="text" name="sal"></td>
				</tr>
				<tr>
					<th>비고</th>
					<td><input type="text" name="etc"></td>
				</tr>
				<tr>
					<th>사원등록일</th>
					<td>
						<input type="text" class="datepicker" name="eregdate" size="auto">
					</td>
				</tr>
				<tr>
					<th>사원사진</th>
					<td><input type="text" name="epic"></td>
				</tr>
				<tr>
					<th>관리자</th>
					<td><input type="text" name="admin"></td>
				</tr>
				
			</table>
			
			<br><br>
			<input type="submit" value="등록">			
			<input type="reset" value="취소">
			<input type="button" value="목록" onclick="location.href='GanyServlet?command=gany_list'">
		</div>
	
	</form>
	
</div>

<div class="foot">
</div>

</body>

</html>