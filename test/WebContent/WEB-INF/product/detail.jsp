<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="reservice.ImageViewer"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" href="home.css">
<title>${product.pname }</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

</head>
<body>
<script type="text/javascript">
$(function (){
	$('#img').click(function() {
		var chimg = $(this).attr('src');
		$('#proimg').attr('src',chimg);
		return false;
	});
	$('#img1').click(function() {
		var chimg = $(this).attr('src');
		$('#proimg').attr('src',chimg);
		return false;
	});
	$('#img2').click(function() {
		var chimg = $(this).attr('src');
		$('#proimg').attr('src',chimg);
		return false;
	});
	$('#img3').click(function() {
		var chimg = $(this).attr('src');
		$('#proimg').attr('src',chimg);
		return false;
	});
	$('#img4').click(function() {
		var chimg = $(this).attr('src');
		$('#proimg').attr('src',chimg);
		return false;
	});
	$('#img5').click(function() {
		var chimg = $(this).attr('src');
		$('#proimg').attr('src',chimg);
		return false;
	});
});

	$(function () {$('#cart').click(function() {
		if(($('#cid').val()) == ""){
			alert("로그인 먼저 해주세요");
			var login = "loginForm.do";
			$(location).attr('href',login);
		}else if(($('#cid').val()) == "master"){
			
		}else{		
			var ordercnt = $('#ordercnt').val();
			var pcode = $('#pcode').val();
			var poption = $('#color > option:selected').val();
			var pname =$('#pname').val();
			var pprice =$('#pprice').val();
			var pimage = $('#pimage').val();
			var url = "cartInsert.cr?pcode="+pcode+"&pcount="+ordercnt+"&poption="+poption+"&pname="+pname+"&pprice="+pprice+"&pimage="+pimage;
			$(location).attr('href',url);	
		}
		});	
	});
	
	$(function () {$('#order').click(function() {
		if(($('#cid').val()) == ""){
		alert("로그인 먼저 해주세요");
		var login = "loginForm.do";
		$(location).attr('href',login);
		
		}else if(($('#cid').val()) == "master"){
			
		}
		else {
			var ordercnt = $('#ordercnt').val();
			var pcode = $('#pcode').val();
			var poption = $('#color > option:selected').val();
			var url = "buynow.or?pcode="+pcode+"&ordercnt="+ordercnt+"&poption="+poption;
			$(location).attr('href',url);
		}});
	});
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
      list_zone.style.marginLeft = -510 * m_num + "px";
      return false;
   }
   var n_btn = document.getElementById("next_btn");
   n_btn.onclick = function() {
      if (m_num >= list_a.length -3) {      
         return false;
      }
      m_num++;
      list_zone.style.marginLeft = -510 * m_num + "px";
      return false;
      }
   } 
</script>
	<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
		<a class="navbar-brand" href="home.jsp"><img src="ProductImg?fname=Logo.PNG"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 상의 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="mainList.pro?b_code=T1100&b_name=티셔츠">티셔츠</a> <a class="dropdown-item"
							href="mainList.pro?b_code=T1200&b_name=맨투맨/후드">맨투맨/후드</a> <a class="dropdown-item" href="mainList.pro?b_code=T1300&b_name=블라우스/셔츠">블라우스/셔츠</a>
						<a class="dropdown-item" href="mainList.pro?b_code=T1400&b_name=남녀공용">남녀공용</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 하의 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="mainList.pro?b_code=B1100&b_name=슬랙스">슬랙스</a> <a class="dropdown-item"
							href="mainList.pro?b_code=B1200&b_name=일자핏">일자핏</a> <a class="dropdown-item" href="mainList.pro?b_code=B1300&b_name=스키니">스키니</a> <a
							class="dropdown-item" href="mainList.pro?b_code=B1400&b_name=스커트">스커트</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 아우터 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="mainList.pro?b_code=O1100&b_name=가디건">가디건</a> <a class="dropdown-item"
							href="mainList.pro?b_code=O1200&b_name=점퍼">점퍼</a> <a class="dropdown-item" href="mainList.pro?b_code=O1300&b_name=자켓/코트">자켓/코트</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> ACC </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="mainList.pro?b_code=A1100&b_name=가방">가방</a> <a class="dropdown-item"
							href="mainList.pro?b_code=A1200&b_name=신발">신발</a> <a class="dropdown-item" href="mainList.pro?b_code=A1300&b_name=쥬얼리">쥬얼리</a>
					</div>
					</ul>
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

	<div style="margin-top: 100px"></div>
	<div class="text-center my-3">
		<h4>상품상세</h4>
	</div>
	<div class="container" style="min-width:1100px;">
		<div class="row">
			<div class="col-md-6" style="max-width:550px;">
				<img id="proimg"  src="ProductImg?fname=${product.pimage }.PNG" width="525px" height="525px;"/>
			</div>
			<div class="col-md-6" style="max-width:550px;">
				<h4>${product.pname }</h4>
				<p>${product.pprice }원</p>
				<form>
				<input type="hidden"  value="${product.pcode }" id="pcode">
				<input type="hidden"  value="${sessionScope.cid}" id="cid">
				<input type="hidden"  value="${product.pprice}" id="pprice">
				<input type="hidden"  value="${product.pname}" id="pname">
				<input type="hidden"  value="${product.pimage}" id="pimage">
					<div class="form-row">
						<div class="col">
							<input type="text" class="form-control" value="1" id="ordercnt">
						</div>
						<div class="col">
							<select class="form-control" id="color">
								<c:forTokens items="${product.poption }" delims="," var="option">
								<option>${option }</option>
								</c:forTokens>
							</select>
						</div>
						<div class="col">
							<select class="form-control" id="size">
								<option>Free</option>
							</select>
						</div>
					</div>
					<div><input type="button" id="cart" class="btn btn-danger my-4" 
					style="width : 100%; padding:8px; background: #FFB4B4; border: 0;" value="장바구니 추가"></div>
					<div style="margin-top: -37px"><input type="button" id="order" class="btn btn-danger my-4" 
						style="width : 100%; padding:8px; background: #FFB4B4; border: 0" value="바로 구매하기"></div>
				</form>

 <div style=margin-top:100px></div>
<div style=margin-top:100px></div>
 <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img id="img" src="ProductImg?fname=${product.pimage }.PNG" class="d-block w-100"  height=170px style="max-width:33%;float:left;cursor:pointer;"/>
      <img id="img1" src="ProductImg?fname=${product.pimage }1.PNG" class="d-block w-100"  height=170px style="max-width:33%;float:left;cursor:pointer;"/>
      <img id="img2" src="ProductImg?fname=${product.pimage }2.PNG" class="d-block w-100"  height=170px style="max-width:33%;float:left;cursor:pointer;"/>
      </div>
     <div class="carousel-item">
      <img id="img3" src="ProductImg?fname=${product.pimage }3.PNG" class="d-block w-100" height=170px style=max-width:33%;float:left;cursor:pointer;/>
      <img id="img4" src="ProductImg?fname=${product.pimage }4.PNG" class="d-block w-100"  height=170px style=max-width:33%;float:left;cursor:pointer;/>
      <img id="img5" src="ProductImg?fname=${product.pimage }5.PNG" class="d-block w-100"  height=170px style=max-width:33%;float:left;cursor:pointer;/>      
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
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>

	<br>
	<!--orange라는 클래스는 버튼 하이라이트해주는 클래스, show는 탭 내용 보여주는 클래스-->
	<!--document.getElementById(a태그).dataset.id : 아이디 찾기-->
	<div class="container mt-5" style="margin-bottom: 500px;">
		<ul class="list">
			<li><a class="tab-button" data-id="0">Review</a></li>
			<li><a class="tab-button orange" data-id="1">Info</a></li>
			<div style="clear: both;"></div>
		</ul>

		<!-- data-id= "작명" : html에 몰래 저장 -->

		<div class="tab-content">
			<c:if test="${empty list }">
			등록된 리뷰가 없습니다.<br>
			</c:if>
			<c:if test="${not empty list }">
			<c:forEach var="review" items="${list}">
				<c:set var="length" value="${fn:length(review.rwriter)}"/>
				<c:set var="id" value="${fn:substring(review.rwriter,0,length-2) }"/>
				<table style="width:100%;">
				<tr><th></th><td align="right" style="color: gray;text-align: right;">작성자</td></tr>
				<tr><th>${review.rsubject }</th><td style="text-align: right;">${id}**</td></tr>
				<tr><th>${review.rcontent }</th><td align="right"><img src="ImageViewer?fname=${review.rimg }" width="150" height="200"></img></td></tr>
							</table><hr style="width:100%; color:gray;" >
			</c:forEach>
</c:if>
			<c:if test="${not empty cid && cid ne 'master'}">
			<br><button onclick="location.href='reviewChk.re?pcode=${product.pcode}'">리뷰작성</button>
			</c:if>
		</div>
		
		<div class="tab-content show">
			<p>${product.pcon }</p>
		</div>
	</div>

	<script>
		document.querySelector('ul.list').addEventListener('click',
				function(e) {
					tabview(e.target.dataset.id);

				});

		function tabview(gm) {
			document.querySelector('.show').classList.remove('show');
			document.querySelectorAll('.tab-content')[gm].classList.add('show');

			document.querySelector('.orange').classList.remove('orange');
			document.querySelectorAll('.tab-button')[gm].classList
					.add('orange');
		}
	</script>	

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