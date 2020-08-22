<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 주문</title>
<link rel="stylesheet" href="nav.css">
<link rel="stylesheet" href="join.css">
<style type="text/css">
td{text-align:left;}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
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
        <c:if test="${not empty cid}"><li><a class="nav-link" href="logout.do">로그아웃</a></li></c:if>
        <c:if test ="${cid eq 'master' }">
         <li><a class="nav-link" href="cusList.do">회원조회</a></li>
          <li><a class="nav-link" href="productList.pro">상품리스트</a></li>
        </c:if>
        <c:if test="${cid ne 'master' }">
      <li><a class="nav-link" href="view.do">마이페이지</a></li>
      <li><a class="nav-link" href="cartList.cr">장바구니</a></li>
      </c:if>
      <li><a class="nav-link" href="noticelist.no">공지사항</a></li>
      </ul>
  </div>
</nav>


<div class="row justify-content-center">
	<div class="col-sm-6">
    <table class="table table-responsive" style="width:700px;"><caption><h2>주문/결제</h2></caption>
    <tr>
      <th colspan="2" scope="col" width=500px; class="text-center">상품정보</th>     
      <th scope="col" width=100px; class="text-center">옵션</th>
      <th scope="col" width=100px; class="text-center">수량</th>
      <th scope="col" width=100px; class="text-center">금액</th>
    </tr>
    <tr>
      <td class="text-center" width="200px;"><img src="ProductImg?fname=${product.pimage }.PNG" width="130px"></td>
      <td class="text-left" width="300px;">${product.pname }</td>
      <td class="text-center">${poption }</td>
      <td class="text-center">${ordercnt }</td>
      <td class="text-center">${product.pprice }</td>
    </tr>
    <tr>
     <th colspan="6" class="bggray" style="text-align:right;"> 합계 : ${product.pprice*ordercnt}원</th>    
    </tr>
    <tr><td colspan="6">
    </td>
    </tr>
</table>

<hr>
	<form action="orderComfirm.or" method="post" name="frm">
	<input type="hidden" name="pcode" value="${product.pcode }">
	<input type="hidden" name="pname" value="${product.pname}">
	<input type="hidden" name="poption" value="${poption}">
	<input type="hidden" name="pprice" value="${product.pprice}">
	<input type="hidden" name="pimage" value="${product.pimage}">
	<input type="hidden" name="pcount" value="${product.pcount}">
	<input type="hidden" name="ocount" value="${ordercnt }">
	<input type="hidden" name="oprice" value="${product.pprice*ordercnt }">
	<table style="margin-top:0"><caption style="color:black;"><h3>배송지 정보</h3></caption>
		<tr><th>수령인 이름</th><td colspan="2"><input type="text" name="oname" value="${customer.cname }"required="required" autocomplete="off"></td></tr>
		<!-- <tr><th>주소</th><td><input type="text" name="caddr" required="required"></td></tr> -->
		<tr><th>수령인 번호</th><td colspan="2"><input type="tel" name="otel" required="required" value="${customer.ctel }"
		pattern="\d{3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxx" 
		title="전화번호 형식 xxx-xxxx-xxxx" autocomplete="off"></td></tr>
		<tr><th rowspan="3">배송지 주소</th><td colspan="2">
		<input type="text" id="postcode" name="postcode"required="required"  placeholder="우편번호" autocomplete="off" value="${customer.cpostcode }">
		<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="width:120pt; float:right;"></td></tr>
		<tr><td colspan="2" style="border-top:0;"><input type="text" id="address" name="address" placeholder="주소" autocomplete="off" value="${customer.caddr }" width="80"required="required" ></td></tr>	
		<tr><td colspan="2" style="border-top:0;"><input type="text" id="detailAddress" name="detailAddress" required="required" placeholder="상세주소" autocomplete="off" value="${customer.cdetailaddr }">
		<div style="display: none;"><input type="text" id="extraAddress" name="extraAddress"  placeholder="참고항목" autocomplete="off"></div></td></tr>
		<tr><th>배송 메모</th><td colspan="2"><pre><textarea name="omemo"rows="10" style="border:1px solid black;width:100%;"></textarea></pre></td></tr>
		<tr><th>결제정보</th><td colspan="2">
		은행명 : <span style="font-weight:bold;">농협317-6677-6677-11</span>
		<br>예금주 : <span style="font-weight:bold;">(주)쇼핑닷컴</span>
		<br>입금액 : <span style="font-weight:bold;">${product.pprice*ordercnt}</span>원</td></tr>
		<tr><td colspan="3" style="text-align:center; border-right:0"><input type="submit" value="결제하기"></td></tr>
	</table>
</form>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>