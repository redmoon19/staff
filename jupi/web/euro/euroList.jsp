<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Euro-List</title>

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

<script>
//버튼
  $( function() {
    $( ".widget input[type=submit], .widget a, .widget button" ).button();
    $( "button, input, a" ).click( function( event ) {
      event.preventDefault();
    } );
  } );
  
function show(prono){
	var url = "EuroServlet?command=euro_view&prono=" + prono;
	$.ajax({
		url:url
		, data: {"prono" : prono}
		, type:'post'
		, contentType: "application/x-www-form-urlencoded; charset=UTF-8"
		, success: function(json){
			data = JSON.parse(json);
			$("#prono").text(data.prono);
			$("#pname").text(data.pname);
			$("#prosta").text(data.prosta);
			$("#penddate").text(data.penddate);
			$("#pregdate").text(data.pregdate);
			$("#pcontent").text(data.pcontent);
		}
		, error: function(xhr, status, error) {
			alert(error);
		}
	});
	  
   $("#myModal").modal('show');
  
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
<a data-toggle="modal" href="#myModal" class="btn btn-success">First modal</a>
</div>

<div class="con">
<!-- 본문 영역 -->

<!-- 모달 -->
<!-- first modal -->
<div class="modal" id="myModal" aria-hidden="true" style="display: none; z-index: 1050;">
	<div class="modal-dialog modal-md">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h4 class="modal-title" id="prono"></h4>
        </div><div class="container"></div>
        <div class="modal-body">
        	<table class="table">
        		<tr>
        			<th>프로젝트 이름</th>
        			<td id="pname"></td>
        		</tr>
        		<tr>
        			<th>프로젝트 시작일</th>
        			<td id="prosta"></td>
        		</tr>
        		<tr>
        			<th>프로젝트 종료일</th>
        			<td id="penddate"></td>
        		</tr>
        		<tr>
        			<th>프로젝트 상세내용</th>
        			<td id="pcontent" ></td>
        		</tr>
        		<tr>
        			<th>프로젝트 등록일</th>
        			<td id="pregdate"></td>
        		</tr>
        	</table>
          <a data-toggle="modal" href="#myModal2" class="btn btn-info">수정</a>
        </div>
        <div class="modal-footer">
          
          <a href="#" class="btn btn-warning">삭제</a>
          <a href="#" data-dismiss="modal" class="btn btn-primary">닫기</a>
        </div>
      </div>
    </div>
</div>
	
<!-- second modal -->
<div class="modal" id="myModal2" aria-hidden="true" style="display: none; z-index: 1060;">
	<div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h4 class="modal-title">Modal 2</h4>
        </div><div class="container"></div>
        <div class="modal-body">
         <table class="table">
        		<tr>
        			<th>프로젝트 이름</th>
        			<td id="pname"></td>
        		</tr>
        		<tr>
        			<th>프로젝트 시작일</th>
        			<td id="prosta"></td>
        		</tr>
        		<tr>
        			<th>프로젝트 종료일</th>
        			<td id="penddate"></td>
        		</tr>
        		<tr>
        			<th>프로젝트 상세내용</th>
        			<td id="pcontent" ></td>
        		</tr>
        		<tr>
        			<th>프로젝트 등록일</th>
        			<td id="pregdate"></td>
        		</tr>
        	</table>
          <a data-toggle="modal" href="#myModal3" class="btn btn-primary">Launch modal</a>
        </div>
        <div class="modal-footer">
          <a href="#" data-dismiss="modal" class="btn">Close</a>
          <a href="#" class="btn btn-primary">Save changes</a>
        </div>
      </div>
    </div>
</div>

<div class="container">
  <h2>회사 프로젝트</h2>
  <table class="table table-striped">
    <thead>
      <tr>
        <th>프로젝트 번호</th>
        <th>프로젝트 이름</th>
        <th>시작일</th>
        <th>종료일</th>
        <th>등록일</th>
      </tr>
    </thead>
    <tbody>
      	<c:forEach var="euro" items="${euroList }">
			<tr class="${euro.prono }">
				<td>${euro.prono }</td>
				<td>
					<button class="btn btn-warning" onclick="show(${euro.prono })">${euro.pname }</button>
				</td>
				<td>${euro.prosta }</td>
				<td>${euro.penddate }</td>
				<td>${euro.pregdate }</td>
			</tr>
		</c:forEach>
    </tbody>
  </table>
</div>

</div>

<div class="foot">
</div>

</body>
</html>