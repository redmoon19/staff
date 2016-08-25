<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GanyList</title>

<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.theme.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/jquery-ui.js"></script>

<script type="text/javascript">

$( function(){
/* 탭 설정 */
   $( "#tabs" ).tabs();
   
/* 셀렉트메뉴 */
   $( "#number" )
   .selectmenu()
   .selectmenu( "menuWidget" )
     .addClass( "overflow" );
   
/* 입력 다이어로그 */
   var dialog,
		form,
		empno = $("#empno"),
		deptno = $("#deptno"),
		jobno = $("#jobno"),
		ename = $("#ename"),
		allFields = $([]).add(empno).add(deptno).add(jobno).add(ename),
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
	function checkLength(o, n, min, max) {
		if(o.val().length > max || o.val().length < min) {
			o.addClass("ui-state-error");
			updateTips(n + "은(는) "
					+ min + "에서 " + max + "자까지 입력해 주세요.");
			return false;
		} else {
			return true;
		}
	}
	
	/* 정규 표현식 체크 */
	function checkRegexp(o, regexp, n) {
		if( !(regexp.test(o.val()))) { //테스트
			o.addClass("ui-state-error");
			updateTips(n);
			return false;
		}else {
			return true;
		}
	}
	
	function addUser() {
		var url = "GanyServlet?command=gany_write";
		var valid = true;
		allFields.removeClass("ui-state-error");
		
		valid = valid && checkLength(empno, "사원번호", 1, 10);
		valid = valid && checkRegexp(empno, /^[0-9]([0-9_\s])+$/,	"사원번호를 확인해 주세요");
		
		valid = valid && checkLength(ename, "사원이름", 3, 12);
		valid = valid && checkRegexp(ename,  /^[가-힣a-z]([가-힣0-9a-z_\s])+$/i,	"성명은 3자에서 12자 이내로 작성해 주세요.");
		
		var queryString = $("form[name=indi]").serialize();
		
		if (valid) {
			$.ajax({
				  url:url // 요청할 곳
				, data: queryString
					/* 'name='+name.val()+'&email='+email.val()
					  +'&password='+password.val() */ 
					  //요청할 정보
				, type:'post' //타입
				, contentType: "application/x-www-form-urlencoded; charset=UTF-8"
				//request 부분 끝
				, success: function(json){
					data = JSON.parse(json);
					alert(data.name);
					$("#users tbody").append(
						"<tr class='" + data.empno + "'>" 
							+ "<td>" + data.empno + "</td>"
							+ "<td>" + data.deptno + "</td>"
							+ "<td>" + data.jobno + "</td>"
							+ "<td>" + data.ename + "</td>"
							+ "<td width='50px'><button id='delete-user' onclick='deleteUser("
									 + data.empno + ");'>삭제</button></td>"
						+ "</tr>");
				}
				, error: function(xhr, status, error) {
					alert(error);
				}
			});
			
			/* ajax error message
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   } */
			
			dialog.dialog("close");
		}
		return valid;
	}
	
	dialog = $("#dialog-form").dialog({
		autoOpen: false,
		height: 450,
		width: 400,
		modal: true,
		buttons: {
			"사원등록" : addUser,
			"취소" : function(){
				dialog.dialog("close");
			}
		},
		//화면 바깥으로 이동(닫기 X) >> 입력자료 초기화 필요~
		close: function() {
			form[0].reset(); //모든 자료 초기화~!!
			allFields.removeClass("ui-state-error");
		} //close 는 컴파일 시 자바엔진이 자동으로 위로 올린다( + 언디파일드 건다) >> 에러 X
	});
	
	// 동적 처리 위해 on메서드를 먼저 등록해야한다 >> ? 생각~
	form = dialog.find("form").on("submit", function(event){
		/* event.preventDefault(); //이전 기능 막음 */
		addUser();
	});
	
	$("#create-user").button().on("click", function(){
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

</div>

<div class="con">
	
<!-- 사원 등록 다이어로그 -->
	<div id="dialog-form" title="Create new user">
	<p class="validateTips">입력 해주세요.</p>
	
	<form name="indi" id="indi">
	
	<div id="tabs">
	  <ul>
	    <li><a href="#tabs-1">사원 정보</a></li>
	    <li><a href="#tabs-2">입력 2</a></li>
	    <li><a href="#tabs-3">입력 3</a></li>
	  </ul>
	  <div id="tabs-1">
	    
		<fieldset>
			<label for="empno">사원번호</label>
			<input type="text" name="empno" id="empno" placeholder="사원 번호 입력" class="text ui-widget-content ui-corner-all">
			<label for="deptno">부서</label>
			<select name="deptno" id="deptno" class="text ui-widget-content ui-corner-all">
      			<option value="1">부서 1</option>
      			<option value="2">부서2</option>
      		</select>
			<label for="jobno">직급</label>
			<select name="jobno" id="jobno" class="text ui-widget-content ui-corner-all">
      			<option value="1">직급 1</option>
      			<option value="2">직급2</option>
      		</select>
			<label for="ename">이름</label>
			<input type="text" name="ename" id="ename" placeholder="이름 입력" class="text ui-widget-content ui-corner-all">
			<!-- 포커스 기능 정지 : 엔터키 활성 -->
			<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
		</fieldset>
<!-- 
	<label for="number">Select a number</label>
    <select name="number" id="number">
      <option>1</option>
      <option selected="selected">2</option>
 -->	
	  </div>
	  <div id="tabs-2">
	    <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
	  </div>
	  <div id="tabs-3">
	    <p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
	    <p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p>
	  </div>
	</div>
	
	</form>
	
</div>


	<div class="ui-widget">
		<table class="ui-widget ui-widget-content">
			<thead>
				<tr class="ui-widget-herder">
					<td>사원번호</td>
					<td>부서명</td>
					<td>직급</td>
					<td>사원이름</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ga" items="${gaList }">
					<tr class="${ga.empno }">
						<td>${ga.empno }</td>
						<td>${ga.deptno }</td>
						<td>${ga.jobno }</td>
						<td>${ga.ename }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<input type="button" value="사원 등록" id="create-user">
</div>

<div class="foot">
</div>

</body>
</html>