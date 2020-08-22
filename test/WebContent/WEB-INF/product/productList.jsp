<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"> -->
<link rel="stylesheet" href="nav.css">
<!-- <link rel="stylesheet" href="join.css"> -->
 <link rel="stylesheet" href="notice.css">
</head>
<body>
<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
  <a class="navbar-brand" href="home.jsp"><img alt="" src="ProductImg?fname=Logo.PNG"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          상의
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="mainList.pro?b_code=T1100&b_name=티셔츠">티셔츠</a>
          <a class="dropdown-item" href="mainList.pro?b_code=T1200&b_name=맨투맨/후드">맨투맨/후드</a>
          <a class="dropdown-item" href="mainList.pro?b_code=T1300&b_name=블라우스/셔츠">블라우스/셔츠</a>
          <a class="dropdown-item" href="mainList.pro?b_code=T1400&b_name=남녀공용">남녀공용</a>
        </div>
      </li>
     <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          하의
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="mainList.pro?b_code=B1100&b_name=슬랙스">슬랙스</a>
          <a class="dropdown-item" href="mainList.pro?b_code=B1200&b_name=일자핏">일자핏</a>
          <a class="dropdown-item" href="mainList.pro?b_code=B1300&b_name=스키니">스키니</a>
          <a class="dropdown-item" href="mainList.pro?b_code=B1400&b_name=스커트">스커트</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          아우터
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="mainList.pro?b_code=O1100&b_name=가디건">가디건</a>
          <a class="dropdown-item" href="mainList.pro?b_code=O1200&b_name=점퍼">점퍼</a>
          <a class="dropdown-item" href="mainList.pro?b_code=O1300&b_name=자켓/코트">자켓/코트</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          ACC
        </a>
         <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="mainList.pro?b_code=A1100&b_name=가방">가방</a>
          <a class="dropdown-item" href="mainList.pro?b_code=A1200&b_name=신발">신발</a>
          <a class="dropdown-item" href="mainList.pro?b_code=A1300&b_name=쥬얼리">쥬얼리</a>
        </div>
        </ul>
         <c:set var="cid" value="${sessionScope.cid}" />
        <ul class="nav navbar-nav ml-auto">
        <li><a class="nav-link" href="logout.do">로그아웃</a></li>
         <li><a class="nav-link" href="cusList.do">회원조회</a></li>
   		 <li><a class="nav-link" href="productList.pro">상품리스트</a></li>
      <li><a class="nav-link" href="noticelist.no">공지사항</a></li>
      </ul>
  </div>
</nav>

<table style="width:1200px;">
<caption><h2>상품목록</h2></caption>
	<tr>
		<th >상품코드</th><th>상품명</th>
		<th >상품가격</th><th>상품수량</th>
		<th >수정</th><th>삭제</th>
	</tr>
<c:if test="${empty list }">
	<tr><th colspan="4">데이터가 없습니다 </th></tr>
</c:if>
<c:if test="${not empty list}">
	<c:forEach var="product" items="${list}">
	<c:if test="${product.pdel =='n' }">
		<tr>
			<td align="center"><a href="detail.pro?pcode=${product.pcode}&pageNum=${currentPage}">${product.pcode}</a></td>
			<td align="center">${product.pname}</td>
			<td align="center">${product.pprice}</td>
			<td align="center">${product.pcount}</td>
			<td align="center"><a href="updateProForm.pro?pcode=${product.pcode}" style="color:blue; font-weight:bold;">수정</a></td>
			<td align="center" ><a href="deletePro.pro?pcode=${product.pcode}" style="color:red; font-weight:bold;">삭제</a></td>
		</tr>
	</c:if>
		</c:forEach>
	</c:if>
</table>

	<div style="width:1200px;margin:0 auto;text-align:center;">
		<c:if test="${startPage>pagePerBlock}">
			<button onclick="location.href='productList.pro?pageNum=${startPage-1}'">[이전]</button>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:if test="${i==currentPage}">
				<button onclick="location.href='productList.pro?pageNum=${i}'"
					disabled="disabled">[${i}]</button>
			</c:if>
			<c:if test="${i!=currentPage }">
				<button onclick="location.href='productList.pro?pageNum=${i}'">[${i}]</button>
			</c:if>
		</c:forEach>
		<c:if test="${endPage < totalPage }">
			<button onclick="location.href='productList.pro?pageNum=${endPage+1}'">[다음]</button>
		</c:if><button onclick="location.href='register_Form.pro'" style="float: right;padding:6px;">상품등록</button>
	</div>

 <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
</body>
</html>