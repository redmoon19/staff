<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>

<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.theme.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/jquery-ui.js"></script>

<script type="text/javascript">

$(function(){

	/* 다이어로그 */
	var dialog,
		form,
		id = $("#id"),
		pswd = $("#pswd"),
		allFields = $([]).add(id).add(pswd),
		tips = $(".validateTips");
	
	function updateTips(t) {
		tips
			.text(t)
			.addClass("ui-state-highlight");
		setTimeout(function(){
			tips.removeClass("ui-state-highlight", 1500);
		}, 500);
	}
	
	/* 길이 체크 */
	 function checkLength(o, n) {
		if( o.val().length < 1) {
			o.addClass("ui-state-error");
			updateTips(n + "를 입력해 주세요.");
			return false;
		} else {
			return true;
		}
	}
	
	/* 정규 표현식 체크 */
	function checkRegexp(o, regexp, n) {
		if( !(regexp.test(o.val()))) {
			o.addClass("ui-state-error");
			updateTips(n);
			return false;
		}else {
			return true;
		}
	}
	
	function checkUser() {
		var url = "GanyServlet?command=gany_login";
		var valid = true;
		allFields.removeClass("ui-state-error");
		
		valid = valid && checkLength(id, "아이디");
		valid = valid && checkRegexp(id, /^[가-힣a-z]([가-힣0-9a-z_\s])+$/i, "아이디는 한글과 영어, 숫자만 입력 가능 합니다");
		
		valid = valid && checkLength(pswd, "비밀번호");
		valid = valid && checkRegexp(pswd,  /^[a-z]([0-9a-z_\s])+$/, "비밀번호는 영문 소문자, 숫자만 입력 가능합니다");
		
		var queryString = $("form[name=indi]").serialize();
		
		if (valid) {
			
			$.ajax({
				  url:url
				, data: queryString
				, type:'post'
				, contentType: "application/x-www-form-urlencoded; charset=UTF-8"
				, success: function(json){ 
					/*data = JSON.parse(json);
					$("#users tbody").before(
						"<tr class='" + data.empno + "'>" 
							+ "<td>" + data.empno + "</td>"
							+ "<td>" + data.deptno + "</td>"
							+ "<td>" + data.jobno + "</td>"
							+ "<td>" + data.id + "</td>"
							+ "<td>" + data.pswd + "</td>"
							+ "<td>" + data.fjumin + "</td>"
							+ "<td>" + data.bjumin + "</td>"
							+ "<td>" + data.hiredate + "</td>"
							+ "<td>" + data.resigndate + "</td>"
							+ "<td>" + data.ename + "</td>"
							+ "<td>" + data.email + "</td>"
							+ "<td>" + data.zipcode + "</td>"
							+ "<td>" + data.addr + "</td>"
							+ "<td>" + data.deaddr + "</td>"
							+ "<td>" + data.sal + "</td>"
							+ "<td>" + data.etc + "</td>"
							+ "<td>" + data.eregdate + "</td>"
							+ "<td>" + data.epic + "</td>"
							+ "<td>" + data.admin + "</td>"
							+ "<td width='50px'><button id='delete-user' onclick='deleteUser("
									 + data.empno + ");'>삭제</button></td>"
						+ "</tr>"); */
				}
				, error: function(xhr, status, error) {
					alert(error);
				}
			});
			
			dialog.dialog("close");
		}
		return valid;
	}
	
	dialog = $("#dialog-form").dialog({
		autoOpen: true,
		height: 300,
		width: 250,
		modal: true,
		buttons: {
			"로그인" : checkUser,
			"취소" : function(){
				dialog.dialog("close");
			}
		},
		
		close: function() {
			form[0].reset(); //모든 자료 초기화~!!
			allFields.removeClass("ui-state-error");
			
		} 
	});
	
	// 동적 처리 위해 on메서드를 먼저 등록해야한다 
	form = dialog.find("form").on("submit", function(event){
		/* event.preventDefault(); //이전 기능 막음 */
		checkUser();
	});
	
	$("#login-user").button().on("click", function(){
		dialog.dialog("open");
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

<!-- 다이어로그 -->
<div id="dialog-form" title="Check user">
	
	<p class="validateTips">${message}</p>
	<form name="indi" id="indi">
		
		<fieldset>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" placeholder ="아이디입력" class="text ui-widget-content ui-corner-all">
			<label for="pswd">비밀번호</label>
			<input type="password" name="pswd" id="pswd" placeholder ="비밀번호입력" class="text ui-widget-content ui-corner-all">
			<!-- 포커스 기능 정지 : 엔터키 활성 -->
			<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
		</fieldset>
	</form>
	
</div>
<!-- 다이어로그 끝 -->
<input type="button" value="로그인" id="login-user">
</div>

<div class="foot">
</div>

</body>
</html>