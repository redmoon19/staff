<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript"></script>
<script>
$(function() {
var availableTags = [ "ActionScript", "AppleScript", "Asp", "BASIC",
"C", "C++", "Clojure", "COBOL", "ColdFusion", "Erlang",
"Fortran", "Groovy", "Haskell", "Java", "JavaScript", "Lisp", "Perl", "PHP", "Python", "Ruby", "Scala", "Scheme" ];
$( "#tags" ).autocomplete({
source: availableTags
});
});
</script>

<title>Insert title here</title>
</head>
<body>

<div class="ui-widget">
<label for="tags">Tags: </label>
<input id="tags">
</div>

</body>
</html>