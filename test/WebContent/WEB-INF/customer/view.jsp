<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<c:set var="cid" value="${sessionScope.cid}" />
<c:if test="${empty cid}">
	<script type="text/javascript">
		alert("로그인 먼저 해주세요");
		location.href="loginForm.do";
	</script>
</c:if>
<c:if test="${not empty cid }">
<script type="text/javascript">
	location.href="viewForm.do";
</script>
</c:if>
</body>
</html>