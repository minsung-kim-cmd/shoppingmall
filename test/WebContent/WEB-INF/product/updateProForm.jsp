<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품 수정</title>
<link rel="stylesheet" href="nav.css">
<link rel="stylesheet" href="join.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function() {
	var top=['티셔츠','맨투맨/후드','블라우스/셔츠','남녀공용'];
	var bot=['슬랙스','일자핏','스키니','트레이닝'];
	var out=['가디건','점퍼','자켓/코트'];
	var acc=['가방','신발','쥬얼리'];
	$('.cloth').change(function() {
		var sel = $(this).val();
		if(sel == 'T1000'){
			$('.op').remove();
			$('.cl').append('<option class="op" value="0">-- 소분류 선택 --</option>')
			$('.cl').append('<option class="op" value="T1100">티셔츠</option>');
			$('.cl').append('<option class="op" value="T1200">맨투맨/후드</option>');
			$('.cl').append('<option class="op" value="T1300">블라우스/셔츠</option>');
			$('.cl').append('<option class="op" value="T1400">남녀공용</option>');
		}else if(sel == 'B1000'){
			$('.op').remove();
			$('.cl').append('<option class="op" value="0">-- 소분류 선택 --</option>')
			$('.cl').append('<option class="op" value="B1100">슬랙스</option>');
			$('.cl').append('<option class="op" value="B1200">일자핏</option>');
			$('.cl').append('<option class="op" value="B1300">스키니</option>');
			$('.cl').append('<option class="op" value="B1400">스커트</option>');
		}else if(sel == 'O1000'){
			$('.op').remove();
			$('.cl').append('<option class="op" value="0">-- 소분류 선택 --</option>')
			$('.cl').append('<option class="op" value="O1100">가디건</option>');
			$('.cl').append('<option class="op" value="O1200">점퍼</option>');
			$('.cl').append('<option class="op" value="O1300">자켓/코트</option>');
		}else if(sel == 'A1000'){
			$('.op').remove();
			$('.cl').append('<option class="op " value="0">-- 소분류 선택 --</option>')
			$('.cl').append('<option class="op" value="A1100">가방</option>');
			$('.cl').append('<option class="op" value="A1200">신발</option>');
			$('.cl').append('<option class="op" value="A1300">쥬얼리</option>');
		}
	});
	$('#submit').click(function chk() {
		if($('.cloth > option:selected').val() == "0"){
			alert("대분류를 선택해주세요");
			return false;
		}
		if($('.cl > option:selected').val() == "0"){
			alert("소분류를 선택해주세요");
			return false;
		}
	});
});


</script>
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
	<form action="updatePro.pro" method="post" onSubmit="return chk()">
	<input type="hidden" id="pcode" name="pcode" value="${product.pcode}">
		<table align="center"><caption><h2>상품수정</h2></caption>
			<tr>
				<td align="right">상품코드&nbsp;</td>
				<td >${product.pcode}</td>
			</tr>
		<tr>
			<td align="right">대분류&nbsp;</td>
			<td>&nbsp;<select class="cloth" name="a_code" required="required">
					<option value="0">-- 대분류 선택 --</option>
					<option value="T1000">상의</option>
					<option value="B1000">하의</option>
					<option value="O1000">아우터</option>
					<option value="A1000">ACC</option>
			</select>
			
			<!-- 소분류 -->
			<select class="cl" name="b_code" required="required">
				<option class="op">-- 소분류 선택 --</option>
			</select></td>
		</tr>
			<tr>
				<td align="right">상품명&nbsp;</td>
				<td>&nbsp;<input type="text" name="pname" required="required" value="${product.pname}" autofocus="autofocus"/>
				</td>
			</tr>
			<tr>
				<td align="right">상품옵션&nbsp;</td>
				<td>&nbsp;<input type="text" name="poption" required="required" value="${product.poption}"/></td>
			</tr>
			<tr>
				<td align="right">상품가격&nbsp;</td>
				<td>&nbsp;<input type="number" name="pprice" required="required" value="${product.pprice}"/></td>
			</tr>
			<tr>
				<td align="right">상품수량&nbsp;</td>
				<td>&nbsp;<input type="number" name="pcount" required="required" value="${product.pcount}"/></td>
			</tr>
				<td align="right">상품설명&nbsp;</td>
				<td>&nbsp;<textarea rows="10" cols="30" name="pcon" required="required">${product.pcon}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input id="submit" type="submit" value="상품수정"></td>
			</tr>
		</table>
	</form>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>