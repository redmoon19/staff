<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Call-View</title>

<!-- 제이쿼리 -->
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.theme.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/jquery-ui.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">

/* $(document).ready(function() { 
	function coview(notno){
		var url = "CallServlet?command=call_com_list&notno=" + notno;
		
		$.ajax({
			url: url
			, data: {"notno" : notno}
			, type: 'post'
			, contentType: "application/x-www-form-urlencoded; charset=UTF-8"
			, success: function(json){
				data = JSON.parse(json);
				alert("dd");
			}
			, error: function(xhr, status, error) {
				alert(error);
			}
		});
		
	}; 

});*/

function show(notno){
	
	$("#indi notno").text(notno);
	
    $("#myModal").modal('show');
  
};


function coview(notno){
	var url = "CallServlet?command=call_com_list&notno=" + notno;
	
	$.ajax({
		url: url
		, data: {"notno" : notno}
		, type: 'post'
		, contentType: "application/x-www-form-urlencoded; charset=UTF-8"
		, success: function(jsonList){
			/* list = JSONArray.parse(jsonList); */
			list = jsonList;
			alert(list);
			$.each(JSON.jsonList, function(i, v) {
									
			});
			
			 /* $("#nocomment tbody").before(
				
				"<tr class='" + list.comno + "'>"
					+ "<td>" + list.empno + "</td>"
					+ "<td>" + list.comcon + "</td>"
					+ "<td>" + list.comdate + "</td>"
					+ "<td width='50px'><button id='update-com' onclick='updateCom(" + list.comno + ");'>수정</button></td>" 
					+ "<td width='50px'><button id='delete-com' onclick='deleteCom(" + list.comno + ");'>삭제</button></td>"
				+ "</tr>" 
			); */
		}
		, error: function(xhr, status, error) {
			alert(error);
		}
	});
	
};

function addcom(){
	
	var url = "CallServlet?command=call_com_write";
	var queryString = $("#indi").serialize();
	$.ajax({
		url:url
		, data: queryString
		, type:'post'
		, contentType: "application/x-www-form-urlencoded; charset=UTF-8"
		, success: function(json){
			data = JSON.parse(json);
			$("#nocomment tbody").before(
				"<tr class='" + data.comno + "'>" 
					+ "<td>" + data.empno + "</td>"
					+ "<td>" + data.comcon + "</td>"
					+ "<td>" + data.comdate + "</td>"
					+ "<td width='50px'><button id='update-com' onclick='updateCom(" + data.comno + ");'>수정</button></td>" 
					+ "<td width='50px'><button id='delete-com' onclick='deleteCom(" + data.comno + ");'>삭제</button></td>"
				+ "</tr>"
			);
		}
		, error: function(xhr, status, error) {
			alert(error);
		}
	});
	 $("#myModal").modal('hide');
	 $('#comcon').val('');

};

function reset(){
	 $('#comcon').val('');
}


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
<input type="button" value="목록" onclick="location.href='CallServlet?command=call_list'">
<input type="button" value="수정" onclick="location.href='CallServlet?command=call_update_form&notno=${call.notno }'">
<input type="button" value="삭제" onclick="location.href='CallServlet?command=call_delete&notno=${call.notno }'">

<button class="btn btn-warning" onclick="coview(${call.notno })">댓글 보기</button>
<button class="btn btn-warning" onclick="show(${call.notno })">댓글 달기</button>
</div>

<div class="con">

<!-- 모달 -->
<!-- first modal -->
<div class="modal" id="myModal" aria-hidden="true" style="display: none; z-index: 1050;">
	<div class="modal-dialog modal-md">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" id="close" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        </div><div class="container"></div>
        <div class="modal-body">
        	<form id="indi" name="indi">
        	<input type="text" name="notno" id="notno">
        	<!-- 세션 처리 후 정리 -->
        	<input type="hidden" name="empno" id="empno" value="2016090012">
        	<table class="table">
        		<tr>
        			<td><textarea name="comcon" id="comcon" rows="4" cols="85" maxlength="200"></textarea></td>
        		</tr>
        	</table>
        	</form>
        </div>
        <div class="modal-footer">
        	<button class="btn btn-warning" onclick="addcom()">등록</button>
          <!-- <a href="#" class="btn btn-warning">등록</a> -->
          <input type="button" class="btn btn-warning" onclick="reset()" value="취소">
          <!-- <a href="#" class="btn btn-warning">취소</a> -->
          <button class="btn btn-primary" data-dismiss="modal">돌아가기</button>
        </div>
      </div>
    </div>
</div>

	
	<form id="frm">
	
		<div class="ui-widget">
		
			<table class="ui-widget ui-widget-content">
				<tr>
					<th>공지사항 번호</th>
					<td>${call.notno }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${call.empno }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${call.notname }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${call.notdate }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${call.nothits }</td>
				</tr>
				<tr>
					<th>공지사항 내용</th>
					<td>${call.notcon }</td>
				</tr>
				<tr>
					<th>삭제 여부</th>
					<td>${call.notdel }</td>
				</tr>
				
			</table>
			<!-- 댓글테이블 -->
			<table id="nocomment" class="ui-widget ui-widget-content">
				<thead>
					<tr>
						<td></td>
						<td width="80"></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="calllist" items="${calllist }">
					<tr class="${calllist.comno }">
						<td>${calllist.empno }</td>
						<td>${calllist.comcon }</td>
						<td>${calllist.comdate }</td>
						<td width="50px"><button id="update-com" onclick='updateCom(${noco.comno});'>수정</button></td> 
						<td width="50px"><button id="delete-com" onclick='deleteCom(${noco.comno});'>삭제</button></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	
	</form>
	
</div>

<div class="foot">
</div>

</body>

</html>