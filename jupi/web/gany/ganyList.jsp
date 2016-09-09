<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.kedu.util.DBManager" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원 정보 관리</title>

<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.theme.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.3/css/bootstrap.min.css" integrity="sha384-MIwDKRSSImVFAZCVLtU0LMDdON6KVCrZHyVQQj6e8wIEJkW4tvwqXrbMIya1vriY" crossorigin="anonymous">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/jquery-ui.js"></script>

<script type="text/javascript">

$(function(){
	/* 탭 처리 */
	$( "#tabs" ).tabs();
	
	/* 날자입력 */
	$(".datepicker").datepicker({
			 changeYear: true,
			 changeMonth: true,
			 dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			 dayNamesMin: ['일','월','화','수','목','금','토'],
			 monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
			 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			 dateFormat: "yymmdd"
	});
	
	/* 셀렉트메뉴 */
	
    $( "#number" )
      .selectmenu()
      .selectmenu( "menuWidget" )
        .addClass( "overflow" );
	
	$( ".salutation" ).selectmenu();
	
	/* 다이어로그 */
	var dialog,
		form,
		emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/, 
		id = $("#id"),
		pswd = $("#pswd"),
		ename = $("#ename"),
		email = $("#email"),
		allFields = $([]).add(id).add(pswd).add(ename).add(email),
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
					+ min + "에서 " + max + "자 까지만 입력해 주세요.");
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
	
	function addUser() {
		var url = "GanyServlet?command=gany_write";
		var valid = true;
		allFields.removeClass("ui-state-error");
		
		valid = valid && checkLength(id, "아이디", 3, 16);
		valid = valid && checkRegexp(id, /^[가-힣a-z]([가-힣0-9a-z_\s])+$/i, "아이디는 한글과 영어, 숫자만 입력 가능 합니다");
		
		valid = valid && checkLength(pswd, "비밀번호", 5, 15);
		valid = valid && checkRegexp(pswd,  /^[a-z]([0-9a-z_\s])+$/, "비밀번호는 영문 소문자, 숫자만 입력 가능합니다");
		
		valid = valid && checkLength(ename, "이름", 3, 16);
		valid = valid && checkRegexp(ename, /^[가-힣a-z]([가-힣a-z_\s])+$/i, "이름은 한글과 영어 소문자만 입력 가능 합니다");
		
		valid = valid && checkLength(email, "이메일", 6, 50);
		valid = valid && checkRegexp(email, emailRegex, "이메일 형식으로 작성해주세요");
		var queryString = $("form[name=indi]").serialize();
		
		if (valid) {
			$.ajax({
				  url:url
				, data: queryString
				, type:'post'
				, contentType: "application/x-www-form-urlencoded; charset=UTF-8" 
					/* 'multipart/form-data'  */
					
				, success: function(json){
					data = JSON.parse(json);
					alert(data.empno);
					$("#users tbody").before(
						"<tr class='" + data.empno + "'>" 
							+ "<td>" + data.empno + "</td>"
							+ "<td>" + data.deptno + "</td>"
							+ "<td>" + data.jobno + "</td>"
							+ "<td>" + data.id + "</td>"
							+ "<td>" + data.pswd + "</td>"
							+ "<td>" + data.ename + "</td>"
							+ "<td>" + data.fjumin + "-" + data.bjumin +  "</td>"
							+ "<td>" + data.hiredate + "</td>"
							+ "<td>" + data.resigndate + "</td>"
							+ "<td>" + data.email + "</td>"
							+ "<td>" + data.zipcode + "</td>"
							+ "<td>" + data.sal + "</td>"
							+ "<td>" + data.etc + "</td>"
							+ "<td>" + data.eregdate + "</td>"
							+ "<td>" + data.epic + "</td>"
							+ "<td>" + data.admin + "</td>"
							+ "<td width='50px'><button id='delete-user' onclick='deleteUser("
									 + data.empno + ");'>삭제</button></td>"
						+ "</tr>");
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
		autoOpen: false,
		height: 650,
		width: 450,
		modal: true,
		buttons: {
			"사원등록" : addUser,
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
		addUser();
	});
	
	$("#create-user").button().on("click", function(){
		dialog.dialog("open");
	});
});

function deleteUser(empno) {
	url="GanyServlet?command=gany_delete&empno=" + empno;
	delempno="." + empno;
	
	$.ajax({
		  type:"get"
		, url: url
		, success: function(json){
			$("tr").remove(delempno);
		}
		, error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   }
	});
};


</script>

</head>
<body>

<!-- 다이어로그 -->
<div id="dialog-form" title="Create new user">
	<div id="tabs">
	
	<p class="validateTips">입력 해주세요.</p>
	
	<form name="indi" id="indi" method="post" enctype="multipart/form-data">
	
	<ul>
	    <li><a href="#tabs-1">기본</a></li>
	    <li><a href="#tabs-2">상세</a></li>
	    <li><a href="#tabs-3">개인</a></li>
  	</ul>
		
		<fieldset>
		<div id="tabs-1">
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" placeholder ="아이디입력" class="text ui-widget-content ui-corner-all">
			<label for="pswd">비밀번호</label>
			<input type="password" name="pswd" id="pswd" placeholder ="비밀번호입력" class="text ui-widget-content ui-corner-all">
			<label for="ename">이름</label>
			<input type="text" name="ename" id="ename" placeholder="이름 입력" class="text ui-widget-content ui-corner-all">
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" placeholder="이메일 입력" class="text ui-widget-content ui-corner-all">
		</div>
		
		<div id="tabs-2">
			<!-- 2번째 -->
			<label for="deptno">부서번호</label><br>
			<!-- <input type="text" name="deptno" id="deptno" placeholder="부서 번호 입력" class="text ui-widget-content ui-corner-all"> -->
			<select name="deptno" id="deptno" >
		      <option disabled selected>부서 선택</option>
		      <option value="1">부서 1</option>
		      <option value="2">부서 2</option>
		      <option value="3">부서 3</option>
		    </select><br>
			<label for="jobno">직급번호</label><br>
			<!-- <input type="text" name="jobno" id="jobno" placeholder="직급번호 입력" class="text ui-widget-content ui-corner-all"> -->
			<select name="jobno" id="jobno" >
		      <option disabled selected>직급 선택</option>
		      <option value="1">직급 1</option>
		      <option value="2">직급  2</option>
		      <option value="3">직급 3</option>
		    </select><br>
			<label for="hiredate">입사일</label>
			<input type="text" name="hiredate" id="hiredate" placeholder="입사일 입력" class="datepicker">
			<label for="resigndate">퇴사일</label>
			<input type="text" name="resigndate" id="resigndate" placeholder="퇴사일 입력" class="datepicker">
			<label for="sal">급여</label>
			<input type="text" name="sal" id="sal" placeholder="급여입력" value="0000" class="text ui-widget-content ui-corner-all">
			<label for="etc">비고</label>
			<input type="text" name="etc" id="etc" placeholder="비고 입력" class="text ui-widget-content ui-corner-all">
			<label for="eregdate">사원등록일</label>
			<input type="text" name="eregdate" id="eregdate" placeholder="사원등록일 입력" class="datepicker">
			<label for="admin">관리자여부</label><br>
			<!-- <input type="text" name="admin" id="admin" placeholder="관리자여부 입력" class="text ui-widget-content ui-corner-all"> -->
		    <select name="admin" id="admin">
		      <option selected="selected" value="0">사원</option>
		      <option value="1">관리자</option>
		    </select>
		</div>
		
		<div id="tabs-3">
			<!-- 3번째 -->
			<label for="fjumin">주민번호 앞</label>
			<input type="text" name="fjumin" id="fjumin" placeholder="주민번호 앞 입력" class="text ui-widget-content ui-corner-all">
			<label for="bjumin">주민번호 뒤</label>
			<input type="text" name="bjumin" id="bjumin" placeholder="주민번호 뒤 입력" class="text ui-widget-content ui-corner-all">
			
			<label for="zipcode">우편번호</label>
			<input type="text" name="zipcode" id="zipcode" placeholder="우편번호 입력" class="text ui-widget-content ui-corner-all">
			<label for="addr">주소</label>
			<input type="text" name="addr" id="addr" placeholder="주소 입력" class="text ui-widget-content ui-corner-all">
			<label for="deaddr">상세주소</label>
			<input type="text" name="deaddr" id="deaddr" placeholder="상세주소 입력" class="text ui-widget-content ui-corner-all">
			
			<label for="epic">사진</label>
			<input type="file" name="epic" id="epic" placeholder="사진 입력" class="text ui-widget-content ui-corner-all">
		</div>	
			<!-- 포커스 기능 정지 : 엔터키 활성 -->
			<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
		</fieldset>
	</form>
	
	</div>
</div>
<!-- 다이어로그 끝 -->

<div>
	<div id="user-contain" class="ui-widget">
		<h1>사원 리스트</h1>
		
<%
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String sql = null;
	
	//1. 총레코드 수를 구한다.
	int totalRecord = 0; //총레코드 수
	try {
		con = DBManager.getConnection();
		sql = "select count(*) from emp";
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		rs.next();
		totalRecord = rs.getInt(1);
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		DBManager.close(con, stmt, rs);
	}
	
	
	//2. 페이지당 보일 레코드 수를 결정하고 총 페이지 수를 구한다.
	int numPerPage = 10; //한 페이지에서 보일 레코드 수
	int totalPage = 0; // 총 페이지 수
	if (totalRecord != 0) {
		if (totalRecord % numPerPage == 0) {
			totalPage = totalRecord / numPerPage;
		} else {
			totalPage = totalRecord / numPerPage + 1;
		}
	}
	
	//3.첫번째 레코드 번호와 마지막 레코드 번호를 구한다
	int curPage = request.getParameter("curPage") == null
		? 1 : Integer.parseInt(request.getParameter("curPage"));
	//시작 레코드 계산
	int start = (curPage -1) * numPerPage + 1;
	//마지막 레코드 계산
	int end = start + numPerPage -1 ;
	//해당 페이지의 레코드 셋을 구한 후 출력 한다.
	
	try {
		con = DBManager.getConnection();
		sql = "SELECT empno, deptno, jobno, id, pswd, ename		"
			+ ", fjumin, bjumin, hiredate, resigndate, email	"
			+ ", zipcode, addr, deaddr, sal, etc, eregdate		"
			+ ", epic, admin FROM (								"
				+ "SELECT ROWNUM R, A.* FROM (					" 
					+ "SELECT empno, deptno, jobno, id, pswd, ename		"
					+ ", fjumin, bjumin, hiredate, resigndate, email	"
					+ ", zipcode, addr, deaddr, sal, etc, eregdate		"
					+ ", epic, admin									" 
					+ "FROM emp ORDER BY empno DESC) A)					"
					+ "WHERE R BETWEEN ? AND ?							";
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, start);
		stmt.setInt(2, end);
		rs = stmt.executeQuery();
%>
		
		<table id="users" class="ui-widget ui-widget-content">
			<thead>
				<tr class="ui-widget-header">
					<td>사번</td>
					<td>부서</td>
					<td>직급</td>
					<td>아이디</td>
					<td>암호</td>
					<td>이름</td>
					<td>주민번호</td>
					<td>입사일</td>
					<td>퇴사일</td>
					<td>이메일</td>
					<td>주소</td>
					<td>급여</td>
					<td>비고</td>
					<td>사원등록일</td>
					<td>사진</td>
					<td>관리자</td>
					<td>삭제</td>
				</tr>
			</thead>
			<tbody>
			
<%
	while (rs.next()) {
		String empno = rs.getString("empno");
		String deptno = rs.getString("deptno");
		String jobno = rs.getString("jobno");
		String id = rs.getString("id");
		String pswd = rs.getString("pswd");
		String ename = rs.getString("ename");
		String fjumin = rs.getString("fjumin");
		String bjumin = rs.getString("bjumin");
		String hiredate = rs.getString("hiredate");
		String resigndate = rs.getString("resigndate");
		String email = rs.getString("email");
		String zipcode = rs.getString("zipcode");
		String addr = rs.getString("addr");
		String deaddr = rs.getString("deaddr");
		int sal = rs.getInt("sal");
		String etc = rs.getString("etc");
		String eregdate = rs.getString("eregdate");
		String epic = rs.getString("epic");
		String admin = rs.getString("admin");
%>
			
			<tr class=<%=empno %>>
				<td>
					<a href="GanyServlet?command=gany_view&empno=<%=empno %>">
					<%=empno %>
					</a>
				</td>
				<td><%=deptno %></td>
				<td><%=jobno %></td>
				<td><%=id %></td>
				<td><%=pswd %></td>
				<td><%=ename %></td>
				<td><%=fjumin %></td>
				<td><%=hiredate %></td>
				<td><%=resigndate %></td>
				<td><%=email %></td>
				<td><%=addr %></td>
				<td><%=sal %></td>
				<td><%=etc %></td>
				<td><%=eregdate %></td>
				<td><%=epic %></td>
				<td><%=admin %></td>
				<td width="50px"><button id="delete-user" onclick='deleteUser(<%=empno%>);'>삭제</button></td>
			</tr>	
			
<%
		}
%>
			
			</tbody>
		</table>
		
<%
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		DBManager.close(con, stmt, rs);
	}
	
%>

<nav aria-label="Page navigation" align="center">
  <ul class="pagination">

<%	
	//4. 각 페이지에 대한 직접 이동 링크를 만든다.
	int pagePerBlock 	= 5;//블록당 페이지수를 저장할 변수와 초기화
	int block			= 1;//현재 블록 저장 변수와 초기화
	
	if(curPage % pagePerBlock == 0) {
		block = curPage / pagePerBlock;
	} else {
		block = curPage / pagePerBlock + 1;
	}
	
	int firstPage = (block - 1) * pagePerBlock + 1;
	int lastPage = block * pagePerBlock;
	
	int totalBlock = 0;
	
	if(totalPage > 0) {
		if(totalPage % pagePerBlock == 0) {
			totalBlock = totalPage / pagePerBlock;
		}else {
			totalBlock = totalPage / pagePerBlock + 1;
		}
	}

	/* 이전으로 */
	int prevPage = 0;
	if(block > 1){
		prevPage = firstPage -1; 
%>
		 <li class="page-item">
			<a class="page-link" href="GanyServlet?command=gany_list&curPage=<%=prevPage %>"
					 aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
				<span class="sr-only">이전</span>
     		 </a>
    	</li>
<%
	}
	
	if(block >= totalBlock){
		lastPage = totalPage;
	}
	
	/* 페이지 표시  */
	for(int i = firstPage; i <= lastPage; i++) {
%>
	<li class="page-item">
      <a class="page-link" href="GanyServlet?command=gany_list&curPage=<%=i %>"><%=i %> 
      <span class="sr-only">(current)</span></a>
    </li>
<%	
	}
	
	/* 다음 페이지 이동 표시 */
	if(block < totalBlock){
		int nextPage = lastPage + 1;
%>
	<li class="page-item">
		<a class="page-link" href="GanyServlet?command=gany_list&curPage=<%=nextPage %>" aria-label="Next">
			<span aria-hidden="true">&raquo;</span>
			<span class="sr-only">다음</span>
		</a>
		
	</li>	
<%
	}
%>
		
	
	</ul>
</nav>
		
	</div>
<input type="button" value="자료 입력" id="create-user">

</div>

</body>
</html>