<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${b_name }</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
      <link rel="stylesheet" href="home.css">
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
        <c:if test="${not empty cid}"><li><a class="nav-link" href="logout.do">로그아웃</a></li></c:if>
        <c:if test="${empty cid}"><li><a class="nav-link" href="loginForm.do">로그인</a></li><li><a class="nav-link" href="joinForm.do">회원가입</a></li></c:if>
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

 <div class="container"><div style=margin-top:150px></div>
 <center class="container-head">${b_name }</center>
        <div class="row">
            <div class="col-md-4">
            <c:set var="count" value="0"/>
			<table width="700">
			<c:forEach var="product" items="${list }">
				<c:if test="${count == 0 }"><tr></c:if>
				<c:set var="count" value="${count+1 }"/>
				<td align="left""><a href="detail.pro?pcode=${product.pcode}"><img src="ProductImg?fname=${product.pimage}.PNG" width="350" height="280" /></a>
				<div style="height:220px; overflow:auto;"><p>${product.pname }</p><p>${product.pprice }원</p><p>${product.pcon }</td></div>
				<c:if test="${count%3 ==0}">
					</tr><c:set var="count" value="0"/>	
				</c:if>
			</c:forEach>
			<tr>
			</table>
            </div>
          </div>
      </div>
      
      
      
      
      <script>
        var products = [
        { 
        id: 1,
        price: 299,
        img: 'img2.jpg',
        title: 'Blossom Dress',
        text: "Do you like some random yellow stuff? Here's one for you."
}, 
{ 
        id: 2,
        price: 199,
        img: 'img3.jpg',
        title: 'Springfield Shirt',
        text: "Stole it from my dad."
}, 
{ 
        id: 3,
        price: 399,
        img: 'img4.jpg',
        title: 'Black Monastery',
        text: "The best beer comes from the monastery."
},
{ 
    id: 4,
    price: 299,
    img: 'img2.jpg',
    title: 'Blossom Dress',
    text: "Do you like some random yellow stuff? Here's one for you."
}, 
{ 
    id: 5,
    price: 199,
    img: 'img3.jpg',
    title: 'Springfield Shirt',
    text: "Stole it from my dad."
}, 
{ 
    id: 6,
    price: 399,
    img: 'img4.jpg',
    title: 'Black Monastery',
    text: "The best beer comes from the monastery."
}
];
          document.getElementById('pro1').innerHTML = products[0].title;
          document.getElementById('pro2').innerHTML = products[1].title;
          document.getElementById('pro3').innerHTML = products[2].title;
          document.getElementById('pro4').innerHTML = products[3].title;
          document.getElementById('pro5').innerHTML = products[4].title;
          document.getElementById('pro6').innerHTML = products[5].title;
          /*document.querySelector('.mt-2').innerHTML = ??;
          document.querySelector('#title').innerHTML = ??;*/

          products.sort(function(a,b){return a.price - b.price});
      </script>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>