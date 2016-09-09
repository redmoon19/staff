<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html >
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
	
	<form method="post" enctype="multipart/form-data" name="frm">
		<input type="hidden" name="nonmakeImg" value="${gany.epic}">
		<div class="ui-widget">
		
			<table class="ui-widget ui-widget-content">
					
				<tr>
					<th>사원번호</th>
					<td>${gany.empno }</td>
				</tr>
				<tr>
					<th>부서명</th>
					<td>${gany.deptno }</td>
				</tr>
				<tr>
					<th>직급</th>
					<td>${gany.jobno }</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${gany.id }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${gany.pswd }</td>
				</tr>
				<tr>
					<th>사원이름</th>
					<td>${gany.ename }</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td>${gany.fjumin }</td>
					<td>${gany.bjumin }</td>
				</tr>
				<tr>
					<th>입사일</th>
					<td>${gany.hiredate }</td>
				</tr>
				<tr>
					<th>퇴사일</th>
					<td>${gany.resigndate }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${gany.email }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${gany.zipcode }</td>
					<td>${gany.addr }</td>
					<td>${gany.deaddr }</td>
				</tr>
				<tr>
					<th>급여</th>
					<td>${gany.sal }</td>
				</tr>
				<tr>
					<th>비고</th>
					<td>${gany.etc }</td>
				</tr>
				<tr>
					<th>사원등록일</th>
					<td>${gany.eregdate }</td>
				</tr>
				
				<tr>
					<th>사원사진</th>
					<td>${gany.epic }
					<input type="file" name="${gany.epic }"><br>
								(주의사항 : 이미지를 변경하고자 할때만 선택하시오) 
					</td>
				</tr>
				<tr>
					<th>관리자</th>
					<td>${gany.admin }</td>
				</tr>
				
				
			</table>
			<input type="button" value="정보 수정" 
			onclick="location.href='GanyServlet?command=gany_update_form&empno=${gany.empno }'">
		</div>
	
	</form>
	
</div>

<div class="foot">
</div>

</body>

</html>