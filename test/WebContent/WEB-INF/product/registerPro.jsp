<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품 등록</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("상품등록 완료");
		location.href="productList.pro";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("상품등록 실패");
		history.go(-1);
	</script>
</c:if> 
</body>
</html>