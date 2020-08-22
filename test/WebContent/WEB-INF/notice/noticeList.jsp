
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>공지사항</title>
 <link rel="stylesheet" href="notice.css">
 <style type="text/css">
 th{padding : 8px;}
 td{padding : 5px;
 border-top:1px solid black;}
 </style>
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
        <ul class="nav navbar-nav ml-auto">
        <c:set var="cid" value="${sessionScope.cid}" />
        <c:if test="${not empty cid}"><li><a class="nav-link" href="logout.do">로그아웃</a></li></c:if>
        <c:if test="${empty cid}"><li><a class="nav-link" href="loginForm.do">로그인</a></li>  <li><a class="nav-link" href="joinForm.do">회원가입</a></li></c:if>
        <c:if test ="${cid eq 'master' }">
         <li><a class="nav-link" href="cusList.do">회원조회</a></li>
   		 <li><a class="nav-link" href="productList.pro">상품리스트</a></li>
        </c:if>
        <c:if test="${cid ne 'master' }">
    
      <li><a class="nav-link" href="view.do">마이페이지</a></li>
      <li><a class="nav-link" href="loginchk.cr">장바구니</a></li>
      </c:if>
      <li><a class="nav-link" href="noticelist.no">공지사항</a></li>
      </ul>
  </div>
</nav>
</nav>

<table style="width:1200px;"><caption><h2>공지사항</h2></caption>
	<tr><th>번호</th><th>작성일</th><th style="width:40%">제목</th><th>작성자</th><th>조회수</th>
	<c:if test="${'master' ne cid}"></tr></c:if>
	<c:if test="${'master' eq cid}"><th>수정</th><th>삭제</th></tr></c:if>
	<c:if test="${empty list }">
		<tr><th colspan="7">게시글이 없습니다</th></tr>
	</c:if>
	<c:if test="${not empty list }">
		<c:forEach var="notice" items="${list }">
		<tr><td>${tot}<c:set var="tot" value="${tot - 1}" /></td><td>${notice.ndate }</td>
			<td><a href="contentForm.no?ncode=${notice.ncode }" style="color:black;">${notice.nsubject }</a></td>
			<td>${notice.nwriter }</td><td>${notice.nview }</td>
			<c:if test="${'master' eq cid}">
				<td><a href="updateForm.no?ncode=${notice.ncode }" style="color:blue; font-weight:bold;">수정</a></td>
				<td><a href="delete.no?ncode=${notice.ncode }" style="color:red; font-weight:bold;">삭제</a></td></tr>
			</c:if>
			<c:if test="${'master' ne cid}">
			</tr></c:if>
		</c:forEach>
	</c:if>
</table>
	<div style="width:1200px;margin:0 auto;text-align:center;margin-top:10px;">
<c:if test="${startPage > pagePerBlock}">
		<button onclick="location.href='noticeolist.no?pageNum=${startPage-1}'">이전</button>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}"> 
		<c:if test="${i == currentPage}">
			<button onclick="location.href='noticelist.no?pageNum=${i}'" disabled="disabled">${i}</button>
		</c:if>
		<c:if test="${i != currentPage}">
			<button onclick="location.href='noticelist.no?pageNum=${i}'">${i}</button>
		</c:if>
	</c:forEach>
	<c:if test="${endPage < totalPage}">
		<button onclick="location.href='noticelist.no?pageNum=${endPage+1}'">다음</button>
	</c:if>
	<c:if test="${'master' eq cid}"><br><button onclick="location.href='insertForm.no'" style="float:right;padding:6px;">게시글 등록</button></c:if>
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