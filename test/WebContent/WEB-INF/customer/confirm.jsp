<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function cl() {
		opener.frm.cid.value="${cid}";
		window.close();
	}
</script>
</head>
<body>
<c:if test="${result>0}">
	<h2>사용중인 아이디</h2>
<form action=""><!-- action에 데이터가 없으면 자신을 다시 호출 -->
	<table>
		<tr><th>아이디</th><td><input type="text" name="cid"
		required="required" autofocus="autofocus"></td></tr>
		<tr><th colspan="2"><input type="submit"></th></tr>
	</table>
</form>
</c:if>

<c:if test="${result ==0 }">
	<h2>사용 가능한 아이디입니다.</h2>
	<button onclick="cl()">닫기</button>
</c:if>
</body>
</html>