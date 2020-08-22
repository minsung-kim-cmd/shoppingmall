<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
</head>
<body>
<c:if test="${result >0}">
<script type="text/javascript">
	location.href="rinsertForm.re?pcode=${product.pcode}";
</script></c:if>
<c:if test="${result == 0}">
<script type="text/javascript">
	alert("상품 구매 후 리뷰 작성해주세요");
	history.go(-1);
</script></c:if>
</body>
</html>