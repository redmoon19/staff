<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<<<<<<< HEAD
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GanyUpdate</title>

<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.theme.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/jquery-ui.js"></script>

<script type="text/javascript">

$( function() {

	$( ".salutation" ).selectmenu();
    
    /* 날자입력 */
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
	
	<form name="frm" method="post" action="GanyServlet?command=gany_update">
		
		<div class="ui-widget">
		
			<table class="ui-widget ui-widget-content">
				<tr>
					<th>사원번호</th>
					<td>
						<input type="text" size="12" name="empno" readonly="readonly" value="${gany.empno }">
					</td>
				</tr>
				<tr>
					<th>부서명</th>
					<td>
						<label for="deptno"></label>
					    <select name="deptno" class="salutation">
					      <option disabled selected>부서 선택</option>
					      <option value="1">부서1</option>
					      <option value="2">부서2</option>
					      <option value="3">부서3</option>
					    </select>
					</td>
				</tr>
				<tr>
					<th>직급</th>
					<td>
						<label for="jobno"></label>
					    <select name="jobno" class="salutation">
					      <option disabled selected>직급 선택</option>
					      <option value="1">1</option>
					      <option value="2">2</option>
					      <option value="3">3</option>
					    </select>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" value="${gany.id }">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pswd" value="${gany.pswd }">
					</td>
				</tr>
				<tr>
					<th>사원이름</th>
					<td>
						<input type="text" name="ename" value="${gany.ename }">
					</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td>
						<input type="text" size="12" maxlength="6" name="fjumin" value="${gany.fjumin }">
						<input type="text" size="12" maxlength="7" name="bjumin" value="${gany.bjumin }">
					</td>
				</tr>
				<tr>
					<th>입사일</th>
					<td>
						<label for="hiredate"></label>
						<input type="text" name="hiredate" id="hiredate" value="${gany.hiredate }" class="datepicker">
					</td>
				</tr>
				<tr>
					<th>퇴사일</th>
					<td>
						<label for="resigndate"></label>
						<input type="text" name="resigndate" id="resigndate" value="${gany.resigndate }" class="datepicker">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" size="12" name="email" value="${gany.email }">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${gany.zipcode }</td>
					<td>${gany.addr }</td>
					<td>${gany.deaddr }</td>
				</tr>
				<tr>
					<th>급여</th>
					<td>
						<input type="text" size="12" name="sal" value="${gany.sal }">
					</td>
				</tr>
				<tr>
					<th>비고</th>
					<td>
						<textarea cols="20" rows="5" name="etc">${gany.etc }</textarea>
					</td>
				</tr>
				<tr>
					<th>사원등록일</th>
					<td>
						<input type="text"  name="eregdate" readonly="readonly" value="${gany.eregdate }">
					</td>
				</tr>
				<tr>
					<th>사원사진</th>
					<td>${gany.epic }</td>
				</tr>
				<tr>
					<th>관리자</th>
					<td>
						<label for="admin"></label>
					    <select name="admin" class="salutation">
					      <option value="0">관리자</option>
					      <option selected="selected" value="0">사원</option>
					    </select>
					</td>
				</tr>
				
			</table>
			<br><br>
			<input type="submit" value="등록">
			<input type="reset" value="다시 작성">
			<input type="button" value="목록" onclick="location.href='GanyServlet?command=gany_list'">
			
		</div>
		
	</form>
=======
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GanyUpdate</title>

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
					<td><input type="text" name="hiredate"></td>
				</tr>
				<tr>
					<th>퇴사일</th>
					<td><input type="text" name="resigndate"></td>
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
					<td><input type="text" name="eregdate"></td>
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
		
	</div>
>>>>>>> refs/remotes/origin/master
	
</div>

<div class="foot">
</div>

</body>

</html>