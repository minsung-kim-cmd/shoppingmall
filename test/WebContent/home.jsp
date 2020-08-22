<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>쇼핑닷컴</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
      <link rel="stylesheet" href="home.css">
      <link rel="stylesheet" href="nav.css">
      <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
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
      
<script>
   window.onload = function(){
   var list_zone = document.getElementById("inner_list");
   var list_a = list_zone.getElementsByTagName("a");
   for (var i = 0; i < list_a.length; i++) {
      list_a[i].onclick = function(){
         document.pic.src = this.children[0].src;
         return false;
      }
   }
   var m_num = 0;
   var b_btn = document.getElementById("before_btn");
   b_btn.onclick = function name() {
      if(m_num <=0){
         return false;
      }
      m_num--;
      list_zone.style.marginLeft = -1800 * m_num + "px";
      return false;
   }
   var n_btn = document.getElementById("next_btn");
   n_btn.onclick = function() {
      if (m_num >= list_a.length -3) {      
         return false;
      }
      m_num++;
      list_zone.style.marginLeft = -1800 * m_num + "px";
      return false;
      }
   }
   
   $(function (){
		$('#img1').click(function() {
			var url = "detail.pro?pcode=124";
			$(location).attr('href',url);
		});
		$('#img2').click(function() {
			var url = "detail.pro?pcode=126";
			$(location).attr('href',url);
		});
		$('#img3').click(function() {
			var url = "detail.pro?pcode=125";
			$(location).attr('href',url);
		});
		$('#img4').click(function() {
			var url = "detail.pro?pcode=165";
			$(location).attr('href',url);
		});
		$('#img5').click(function() {
			var url = "detail.pro?pcode=121";
			$(location).attr('href',url);
		});
		$('#img6').click(function() {
			var url = "detail.pro?pcode=122";
			$(location).attr('href',url);	
		});
		$('#img7').click(function() {
			var url = "detail.pro?pcode=116";
			$(location).attr('href',url);		
		});
		$('#img8').click(function() {
			var url = "detail.pro?pcode=113";
			$(location).attr('href',url);		
		});
		$('#img9').click(function() {
			var url = "detail.pro?pcode=111";
			$(location).attr('href',url);	
		});
	});
</script>
<div style=margin-top:75px></div>
 <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
    <img id="img1" src="ProductImg?fname=shbla_mod2.PNG" class="d-block w-100" alt="..." height=650px style=max-width:33%;float:left;>
       <img id="img2" src="ProductImg?fname=shbla_st2.PNG" class="d-block w-100" alt="..." height=650px style=max-width:33%;float:left;>
       <img id="img3" src="ProductImg?fname=shbla_off3.PNG" class="d-block w-100" alt="..." height=650px style=max-width:34%;float:left;>
    </div>
    <div class="carousel-item">
       <img id="img4" src="ProductImg?fname=cd_teddy5.PNG" class="d-block w-100" alt="..." height=650px style=max-width:33%;float:left;>
       <img id="img5" src="ProductImg?fname=mh_ad5.PNG" class="d-block w-100" alt="..." height=650px style=max-width:33%;float:left;>
       <img id="img6" src="ProductImg?fname=mh_cara4.PNG" class="d-block w-100" alt="..." height=650px style=max-width:34%;float:left;>
    </div>
    <div class="carousel-item">
       <img id="img7" src="ProductImg?fname=sim5.PNG" class="d-block w-100" alt="..." height=650px style=max-width:33%;float:left;>
       <img id="img8" src="ProductImg?fname=wv1.PNG" class="d-block w-100" alt="..." height=650px style=max-width:33%;float:left;>
       <img id="img9" src="ProductImg?fname=ban5.PNG" class="d-block w-100" alt="..." height=650px style=max-width:34%;float:left;>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<footer class="card-group">
  <div class="card" style=max-width:33%;>
    <!-- <img src="..." class="card-img-top" alt="..."> -->
    <div class="card-body">
      <h5 class="card-title">CALL CENTER</h5>
      <p class="card-text"><pre><h4 style="font-weight: bold">1677-0000</h4>WEEK 10:00 ~ 17:00
LUNCH 12:00 ~ 13:00 

주말, 공휴일은 휴무입니다.
통화량 폭주로 전화연결이 안 될 경우, 
게시판에 문의 남겨주시면 빠른 처리 해드리겠습니다.</p></pre>
      <!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
    </div>
  </div>
  <div class="card" style=max-width:33%;>
    <!-- <img src="..." class="card-img-top" alt="..."> -->
    <div class="card-body">
      <h5 class="card-title">BANK INFO</h5>
      <p class="card-text"><pre>농협317-6677-6677-11
국민96677-667751
우체국400010-02-890732
우리1005-593-667788

예금주: ㈜쇼핑닷컴
      </p></pre>
      <!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
    </div>
  </div>
  <div class="card" style=max-width:34%;>
    <!-- <img src="..." class="card-img-top" alt="..."> -->
    <div class="card-body">
      <h5 class="card-title">COMPANY INFO</h5>
      <p class="card-text"><pre>상호명:(주)쇼핑닷컴 | 대표 : 홍길동
주소 : 55075 전라북도 전주시 완산구 호동길 24 (삼천동3가) 쇼핑닷컴
개인정보관리책임자 : 홍길동 | 이메일: shopping@nexon.com 

호스팅 :(주)우리나라인터넷
Copyright © 쇼핑닷컴 all rights reserved.</p></pre>
    <!--   <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
    </div>
  </div>
</footer>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>