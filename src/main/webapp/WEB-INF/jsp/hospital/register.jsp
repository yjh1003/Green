<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Green - 병원 등록</title>

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
             		 	</div>
             		  
                  	   </ul>
               	</nav>
               
       			<section class="register">
              	<div class="d-flex justify-content-center">
                    <div class="container">
                    	<div class="d-flex mt-5">
                        	<label class="col-3">병원명 : </label><input id="hospitalName" type="text" name="name" class="form-control">
                        </div>
                        <div class="d-flex mt-2">
	                        <label class="col-3">진료과목 : </label>
							  <select id="subjectSelect" class="form-control">
							    <option value="진료과목을 선택하세요">진료과목을 선택하세요</option>
							    <option value="내과">내과</option>
							    <option value="치과">치과</option>
							    <option value="안과">안과</option>
							    <option value="피부과">피부과</option>
							    <option value="이비인후과">이비인후과</option>
							    <option value="정형외과">정형외과</option>
							    <option value="성형외과">성형외과</option>
							    <option value="외과">외과</option>
							    <option value="산부인과">산부인과</option>
							    <option value="비뇨기과">비뇨기과</option>
							    <option value="정신건강의학과">정신건강의학과</option>
							    <option value="한의원">한의원</option>
							  </select>
							
						</div>
						<div class="d-flex mt-2">
                        	<label class="col-3">위치정보 : </label><input id="address" type="text" name="name" class="form-control">
                        </div>
                        <div class="d-flex mt-2">
                        	<label class="col-3">전화번호 : </label><input id="telNumber" type="text" name="name" class="form-control">
                        </div>
                        <div class="d-flex mt-2">
                        	<label class="col-3">의료진 정보 : </label><input id="medicalStaff" type="text" name="name" class="form-control">
                        </div>
                        <div class="d-flex mt-2">
                        	<label class="col-3">홈페이지 주소 : </label><input id="hompage" type="text" name="name" class="form-control">            		
              			</div>
              			<button class="btn text-white float-right mt-2" id="registerBtn">등록</button>
              		</div>
              	</div>
           	  </section>
              </section>
           </div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
	$(document).ready(function() {
		
		$("#registerBtn").on("click", function() {
			let hospitalName = $("#hospitalName").val();
			let subject = $("#subjectSelect").val();
			let address = $("#address").val();
			let telNumber = $("#telNumber").val();
			let medicalStaff = $("#medicalStaff").val();
			let hompage = $("#hompage").val();
			
			if(hospitalName == "") {
				alert("병원명을 입력하세요");
				return ;
			}
			
			if(subject == "") {
				alert("진료과목을 선택하세요")
				return ;
			}
			
			if(address == "") {
				alert("병원 주소를 입력하세요")
				return ;
			}
			
			if(telNumber == "") {
				alert("전화번호를 입력하세요")
				return ;
			}
			
			if(medicalStaff == "") {
				alert("의료진 정보를 입력하세요")
				return ;
			}
			
			$.ajax({
				type:"post"
				, url:"/hospital/register"
				, data:{"hospitalName":hospitalName, "subject":subject, "address":address, "telnumber":telNumber, "medicalStaff":medicalStaff, "hompage":hompage}
				, success:function(data) {
					if(data.result == "success") {
						location.href = "/hospital/register/list";
					} else {
						alert("병원정보 저장 실패");
					}
					
				}
				, error:function() {
					alert("병원정보 저장 에러");
				}
			});
			
		});
	
	});
	
	
	</script>
</body>
</html>