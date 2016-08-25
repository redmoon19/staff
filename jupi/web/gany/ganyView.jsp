<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GanyView</title>

<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.theme.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/jquery-ui.js"></script>



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
	
	<form >
	
		<div class="ui-widget">
		
			<table class="ui-widget ui-widget-content">
				<tr>
					<th>사원번호</th>
					<td>${ga.empno }</td>
				</tr>
				<tr>
					<th>부서명</th>
					<td>${ga.deptno }</td>
				</tr>
				<tr>
					<th>직급</th>
					<td>${ga.jobno }</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${ga.id }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${ga.pswd }</td>
				</tr>
				<tr>
					<th>사원이름</th>
					<td>${ga.ename }</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td>${ga.fjumin }</td>
					<td>${ga.bjumin }</td>
				</tr>
				<tr>
					<th>입사일</th>
					<td>${ga.hiredate }</td>
				</tr>
				<tr>
					<th>퇴사일</th>
					<td>${ga.resigndate }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${ga.email }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${ga.zipcode }</td>
					<td>${ga.addr }</td>
					<td>${ga.deaddr }</td>
				</tr>
				<tr>
					<th>급여</th>
					<td>${ga.sal }</td>
				</tr>
				<tr>
					<th>비고</th>
					<td>${ga.etc }</td>
				</tr>
				<tr>
					<th>사원등록일</th>
					<td>${ga.eregdate }</td>
				</tr>
				<tr>
					<th>사원사진</th>
					<td>${ga.epic }</td>
				</tr>
				<tr>
					<th>관리자</th>
					<td>${ga.admin }</td>
				</tr>
				
			</table>
		
		</div>
	
	</form>
	
</div>

<div class="foot">
</div>

</body>

</html>