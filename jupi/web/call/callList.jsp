<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.kedu.util.DBManager" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 사항</title>

<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.theme.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.3/css/bootstrap.min.css" integrity="sha384-MIwDKRSSImVFAZCVLtU0LMDdON6KVCrZHyVQQj6e8wIEJkW4tvwqXrbMIya1vriY" crossorigin="anonymous">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/jquery-ui.js"></script>

<script>

function deleteNoti(notno) {
	url="CallServlet?command=call_delete&notno=" + notno;
	delno="." + notno;
	
	$.ajax({
		  type:"get"
		, url: url
		, success: function(msg){
			$("tr").remove(delno);
			alert("삭제되었습니다.");
		}
		, error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   }
	});
};

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
<input type="button" value="공지사항 작성" onclick="location.href='CallServlet?command=call_write_form'">
</div>

<div class="con">
<!-- 본문 영역 -->
<div id="user-contain" class="ui-widget">
		<h3>공지사항</h3>
		
<%
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String sql = null;
	
	//1. 총레코드 수를 구한다.
	int totalRecord = 0; //총레코드 수
	try {
		con = DBManager.getConnection();
		sql = "select count(*) from notice";
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
	int numPerPage = 5; //한 페이지에서 보일 레코드 수
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
		sql = "SELECT notno, empno, notname, notdate, nothits	"
			+ ", notcon, notdel	FROM (							"
				+ "SELECT ROWNUM R, A.* FROM (					" 
					+ "SELECT notno, empno, notname, notdate	"
					+ ", nothits, notcon, notdel				"
					+ "FROM notice ORDER BY notno DESC) A)		"
					+ "WHERE R BETWEEN ? AND ?					";
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, start);
		stmt.setInt(2, end);
		rs = stmt.executeQuery();
%>
		<table id="users" class="ui-widget ui-widget-content" width=80% style="table-layout: fixed" >
			<thead>
				<tr class="ui-widget-header">
					<td>번호</td>
					<td>제목</td>
					<td>조회</td>
					<td>작성일</td>
					<td>삭제</td>
				</tr>
			</thead>
			
			<tbody>
			
<%
	while (rs.next()) {
		String notno = rs.getString("notno");
		String empno = rs.getString("empno");
		String notname = rs.getString("notname");
		String notdate = rs.getString("notdate");
		int nothits = rs.getInt("nothits");
		String notcon = rs.getString("notcon");
		String notdel = rs.getString("notdel");
%>
			
			<tr class=<%=notno %>>
			
				<td><%=notno %></td>
				<td>
					<a href="CallServlet?command=call_view&notno=<%=notno %>">
					<%=notname %>
					</a>
				</td>
				<td><%=nothits %></td>
				<td><%=notdate %></td>
				<td width="50px"><button id="delete-noti" onclick='deleteNoti(<%=notno %>);'>삭제</button></td>
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
			<a class="page-link" href="CallServlet?command=call_list&curPage=<%=prevPage %>"
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
      <a class="page-link" href="CallServlet?command=call_list&curPage=<%=i %>"><%=i %> 
      <span class="sr-only">(current)</span></a>
    </li>
<%	
	}
	
	/* 다음 페이지 이동 표시 */
	if(block < totalBlock){
		int nextPage = lastPage + 1;
%>
	<li class="page-item">
		<a class="page-link" href="CallServlet?command=call_list&curPage=<%=nextPage %>" aria-label="Next">
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


</div>

<div class="foot">
</div>

</body>
</html>