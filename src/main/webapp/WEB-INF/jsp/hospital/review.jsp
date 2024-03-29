<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Green - 리뷰 작성</title>
</head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
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
				                <li class="nav-item"><a class="nav-link" href="/hospital/recommend/view">우리동네 추천병원</a></li>
				                <li class="nav-item"><a class="nav-link" href="#">가까운 병원찾기</a></li>
				                <li class="nav-item"><a class="nav-link" href="/hospital/register/view">병원 등록</a></li>
		              		  </ol>
              		 	</div>
	                   <li class="nav-item"><a class="nav-link" role="button" data-toggle="collapse" data-parent="#accParent" href="#review" aria-constrols="addEx1">Review</a></li>
	             	 	<div id="review" class="panel-collapse collapse in" role="tabpanel">
		             	 	<ol class="menu">
				                <li class="nav-item"><a class="nav-link" href="hospital/subject/select">진료과목 선택</a></li>
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
                
               </section>
               <div class="review">
               <c:forEach var="hospital" items="${searchList }" >
               		<h5 class="mt-4 ml-3"> ${hospital.subject} > ${hospital.hospitalName} > 리뷰쓰기</h5>
               	</c:forEach>
               		<div class="d-flex mt-4">
               			<label class="col-2"><b>제목 :</b> </label><input id="title" type="text" name="name" class="form-control col-8" placeholder="제목(한줄평)을 입력하세요.">
               		</div>
               		
               		<div class="evaluation form-control row-5 col-8 ml-4 mt-3">
               			<b>평가 항목 :</b>
               			<div class="d-flex mt-3">
               				<div class="ml-3">
	               				<label>의료진의 진료능력</label><br>
	               				<input id="evaluation1" class=" form-control col-10">
	               			</div>
	               			<div class="ml-3">
	               				<label>의료진의 친절도</label><br>
	               				<input id="evaluation2" class=" form-control col-10">
	               			</div>
               			</div>
               			<div class="d-flex mt-3">
	               			<div class="mr-3">
	               				<label>직원의 친절도</label><br>
               			  		<input id="evaluation3" class=" form-control col-10">
	               			</div>
	               			<div class="ml-3">
	               				<label>병원 내 위생</label><br>
		               			<input id="evaluation4" class=" form-control col-10">
               				</div>
               			</div>
               			
               	<div >		
					<textarea id="content" rows="7" minlength="100" class="mt-3 form-control" placeholder="리뷰 내용을 입력해주세요.(100자 이상)"></textarea>
				</div>
				<div  class="ml-4">
             		<i id="fileInput" class="bi bi-images"></i> 이미지파일 첨부하기(선택)
            	 </div>
            	 <div class="float-right mt-4">
	            	 <button class="btn sub-btn btn-small" id="tempBtn">임시저장</button>
	            	 <button class="btn save-btn btn-small" id="saveBtn">등록하기</button>
               	 </div>
               	 
               </div>
            </div>
		</div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</div>
			
	<script>
			   
		
		$(document).ready(function() {

			$("#saveBtn").on("click", function() {
				let title = $("#title").val();	
				let evaluation1 = $("#evaluation1").val();	
				let evaluation2 = $("#evaluation2").val();	
				let evaluation3 = $("#evaluation3").val();	
				let evaluation4 = $("#evaluation4").val();	
				let content = $("#content").val();
				
				if(title == "") {
					alert("제목을 입력해주세요.");
					return ;
				}
				
				if(evaluation1 == "") {
					alert("의료진의 진료능력 평가항목을 작성해주세요.");
					return ;
				}
				
				if(evaluation2 == "") {
					alert("의료진의 친절도 평가항목을 작성해주세요.");
					return ;
				}
				
				if(evaluation3 == "") {
					alert("직원의 진료능력 평가항목을 작성해주세요.");
					return ;
				}
				
				if(evaluation4 == "") {
					alert("병원 위생 평가항목을 작성해주세요.");
					return ;
				}
				
				if(content == "") {
					alert("리뷰 내용을 작성해주세요.")
					return ;
				}
				
				
			//	var formData = new FormData();
			//	formData.append("title", title);
			//	formData.append("content", content);
			//	formData.append("treat", evaluation1);
			//	formData.append("medicalStaff_kindness", evaluation2);
			//	formData.append("staff_kindness", evaluation3);
			//	formData.append("cleanliness", evaluation4);
			//	formData.append("imagePath", $("#fileInput")[0].files[0])
				
				 
				$.ajax({
					type:"post"
					, url:"/hospital/review"
					, data:{"title":title, "content":content, "treat":evaluation1, "medicalStaff_kindness":evaluation2, "staff_kindness":evaluation3, "cleanliness":evaluation4 }
				//	, enctype:"multipart/form-data" // 파일 업로드 필수 항목
				//	, processData:false // 파일 업로드 필수 항목
				//	, contentType:false // 파일 업로드 필수 항목
					, success:function(data) {
						
						if(data.result == "success") {
							location.href = "/hospital/review/list";
						} else {
							alert("리뷰 저장 실패");
						}
						
					}
					, error:function() {
						alert("리뷰 저장 에러");
					}
				});
				
			});	
		});
	
	</script>
</body>
</html>