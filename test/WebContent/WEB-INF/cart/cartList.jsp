<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link rel="stylesheet" href="home.css">
    <title>장바구니</title>
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
	<c:if test="${not empty cid}">
		<li><a class="nav-link" href="logout.do">로그아웃</a></li>
	</c:if>
        <c:if test="${empty cid}"><li>
        <a class="nav-link" href="loginForm.do">로그인</a></li>
        <li><a class="nav-link" href="joinForm.do">회원가입</a></li>
    </c:if>
      <li><a class="nav-link" href="viewForm.do?cid=${cid}">마이페이지</a></li>
      <li><a class="nav-link" href="cartList.cr?cid=${cid}">장바구니</a></li>
      <li><a class="nav-link" href="noticelist.no">공지사항</a></li>
      </ul>
  </div>
</nav>  

<c:if test="${empty list}">
		<div class="row justify-content-center">
   <div class="col-sm-10">
<form id="fomrs" action="ordering.cr" method="post" onsubmit="return chk()">
    <table class="table table-responsive my-auto" style="width:1500px;text-align:center;caption-side: top;">
    <caption class="cart"><h2>장바구니</h2></caption>
    <tr>
      <th scope="col" width=150px; class="text-center">
      <input type="checkbox" id="all_check" onclick="cAll();"></th>
     <th scope="col" width=300px; class="text-center">이미지</th>
      <th scope="col" width=450px; class="text-center">상품명</th>
      <th scope="col" width=150px; class="text-center">판매가</th>
      <th scope="col" width=150px; class="text-center">수량</th>
      <th scope="col" width=300px; class="text-center">선택</th>
    </tr>
    <tr><td colspan="6">장바구니에 담긴 물품이 없습니다.</td> </tr>
    <tr><td colspan="6">
<input type="button" class="pinkbtn" onclick="location.href='home.jsp'" value="쇼핑 계속">
    </td>
    </tr>
    </table></form></div></div>
</c:if>
<c:if test="${not empty list}">
<div class="row justify-content-center">
   <div class="col-sm-10">
<form id="fomrs" action="ordering.cr" method="post" onsubmit="return chk()">
    <table class="table table-responsive my-auto" style="width:1500px;">
    <caption class="cart"><h2>장바구니</h2></caption>
    <tr>
      <th scope="col" width=150px; class="text-center">
      <input type="checkbox" id="all_check" onclick="cAll();"></th>
     <th scope="col" width=300px; class="text-center">이미지</th>
      <th scope="col" width=250px; class="text-center">상품명</th>
      <th scope="col" width=150px; class="text-center">옵션</th>
      <th scope="col" width=150px; class="text-center">판매가</th>
      <th scope="col" width=150px; class="text-center">수량</th>
      <th scope="col" width=300px; class="text-center">선택</th>
    </tr>
<c:forEach var="cart" items="${list}" varStatus="a">
    <tr>
      <th scope="row" class="text-center"><input type="checkbox" name="pcode" value="${cart.pcode}" class="check" onclick="uncheck();"></th>
      <td class="text-center"><img alt="사진" src="ProductImg?fname=${cart.pimage}.PNG" width="150px" height="150px"></td>
      <td class="text-center">${cart.cname}</td>
      <td class="text-center">${cart.poption}</td><input type="hidden" name="poption" value="${cart.poption }">
      <td class="text-center">${cart.cprice}</td>
      <td class="text-center">
      <button type="button" class="minus pinkbtn-small" style="padding:0 3px;">-</button>
      <span class="numberUpDown a${a.index}" style="font-size:1.3em;margin-left: 3px;margin-right: 3px">${cart.pcount}<input type="hidden" class="numberUpDown" name="pcount" value="${cart.pcount}"></span>
      <button type="button" class="plus pinkbtn-small" style="padding:0 3px;">+</button>
      <p><button type="button" class="pinkbtn-middle" style="background: lightgray" onclick="change(${cart.ccode},${a.index})">변경</button></p></td>
      <th class="text-center">
      <button type="button" style="margin-bottom:3px;" class="pinkbtn-middle2"onclick="location.href='ordering.cr?pcode=${cart.pcode}&poption=${cart.poption }'">주문하기</button><br>
      <button type="button" class="pinkbtn-middle2" style="background: lightgray" onclick="location.href='cartDelete.cr?pcode=${cart.pcode}&poption=${cart.poption }'">삭제하기</button>
      </th>
    </tr>
    
  	<c:set var="price" value="${cart.cprice}"/>
  	<c:set var="count" value="${cart.pcount}"/>
  	<c:set var="total" value="${total+(price*count)}"/>
</c:forEach>
    <tr>
     <th colspan="7" class="bggray">상품구매금액 : ${total}원</th>    
    </tr>
    <tr><td colspan="7">
<div class="text-right">
<button type="submit" class=" pinkbtn" >선택 상품 주문</button>
<button type="button" id="all_order" class=" pinkbtn" >전체 상품 주문</button>
</div>
    </td>
    </tr>
</table>
</form>
</div>
</div>
</c:if>
<script type="text/javascript">
function cAll() {
    if ($("#all_check").is(':checked')) {
        $("input[type=checkbox]").prop("checked", true);
    } else {
        $("input[type=checkbox]").prop("checked", false);
    }
}

function uncheck() {
    if ($(".check").is(':checked')) {
        $("input[id='all_check']").prop("checked", false);
    }
}

$(function() {
	$('#all_order').click(function() {
		$("input[type=checkbox]").prop("checked", true);
		$('#fomrs').submit(); 
	});
});
$(function() {
    $(".plus").click(function() {   	
        var $this = $(this);
        var target = $this.prev();
        var num = parseInt(target.text());
        num++;
        target.text(num);
    });
	$(".minus").click(function() {
		var $this = $(this);
		var target = $this.next();
		var num = parseInt(target.text());
		num -= ((num == 1) ? 0 : 1); //1이하로는 못내려가게 한다 
		target.text(num);
	});
});
function change(code, a) {
	var cl = $('.a'+a).text();
	location.href='pntUpdate.cr?ccode='+code+'&pcount='+cl;
}
function chk() {
	if(!$(".check").is(':checked')){
		alert("주문할 상품을 선택해주세요");
		return false;
	}
}
</script>


    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>