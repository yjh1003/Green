<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Green - 리뷰작성_진료과목 선택_병원검색</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<div class="d-flex align-items-center">
		   <section class="d-flex">
               <nav>
                   <ul class="nav flex-column">
                   <li class="nav-item"><a class="nav-link" role="button" data-toggle="collapse" data-parent="#accParent" href="#hospital">Hospital</a></li>
             	 	<div id="hospital" class="panel-collapse collapse in" role="tabpanel">
	             	 	<ol class="menu">
			                <li class="nav-item"><a class="nav-link" href="#">우리동네 추천병원</a></li>
			                <li class="nav-item"><a class="nav-link" href="#">가까운 병원찾기</a></li>
			                <li class="nav-item"><a class="nav-link" href="#">병원 등록</a></li>
	              		  </ol>
             		 	</div>
                   <li class="nav-item"><a class="nav-link" role="button" data-toggle="collapse" data-parent="#accParent" href="#review" aria-constrols="addEx1">Review</a></li>
             	 	<div id="review" class="panel-collapse collapse in" role="tabpanel">
	             	 	<ol class="menu">
			                <li class="nav-item"><a class="nav-link" href="#">진료과목 선택</a></li>
			                <li class="nav-item"><a class="nav-link" href="#">병원 리뷰 작성</a></li>
			                <li class="nav-item"><a class="nav-link" href="#">모두의 리뷰</a></li>
	              		  </ol>
             		 	</div>
                   <li class="nav-item"><a class="nav-link" role="button" data-toggle="collapse" data-parent="#accParent" href="#health" aria-constrols="addEx1">Health</a></li>
             	 	<div id="health" class="panel-collapse collapse in" role="tabpanel">
	             	 	<ol class="menu">
			                <li class="nav-item"><a class="nav-link" href="#">건강정보</a></li>
			                <li class="nav-item"><a class="nav-link" href="#">건강정보 포스팅하기</a></li>
	              		  </ol>
             		 	</div>
                   <li class="nav-item"><a class="nav-link" role="button" data-toggle="collapse" data-parent="#accParent" href="#community" aria-constrols="addEx1">Community</a></li>
             	 	<div id="community" class="panel-collapse collapse in" role="tabpanel">
	             	 	<ol class="menu">
			                <li class="nav-item"><a class="nav-link" href="#">인기글 목록</a></li>
			                <li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
	              		  </ol>
             		  
                  	   </ul>
               	</nav>
               	</section>
               	<div class="container">
	               	<div class="d-flex ">
						<form action="/hospital/search" method="GET" class="form-inline p-2 bd-highlight" role="search">
		               	<select name="searchType" title="검색 유형 선택">
						      <option value="">전체 검색</option>
						      <option value="subject">진료과목</option>
						      <option value="hospitalName">병원이름</option>
						      <option value="address">위치정보</option>
		  				</select>
					        <input type="text" name="keyword" class="form-control" id="search" placeholder="검색">
					        <button class="btn btn-success bi bi-search"></button>
   						</form>
					</div>
					
               		<br>
               		<table class="table text-center">
               			<thead>
							<tr>
	               				<th>No.</th>
	               				<th>병원명</th>
	               				<th>진료과목</th>
	               				<th>위치정보</th>
	               				<th>의료진 정보</th>
	               				<th>선택</th>
               				</tr>
               			</thead>
               			<tbody id="row">
               			<c:forEach var="hospital" items="${searchList }">
               				<tr>
               					<td>${hospital.id}</td>
               					<td>${hospital.hospitalName}</td>
               					<td>${hospital.subject}</td>
               					<td>${hospital.address}</td>
               					<td>${hospital.medicalStaff}</td>
               					<td><button class="btn btn-success" id="selectBtn" data-hospital-id="${hospital.id }">선택</button></td>
               				</tr>
               			</c:forEach>
               			</tbody>
               		</table>
				</div>
				
         	</div>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
       	</div>
               	
	<script>
	$(document).ready(function() {
		
			
			
		
		
			$("#selectBtn").on("click", function() {
				
				location.href ="/hospital/review/create";
				
			});
		
	});
	</script>
</body>
</html>