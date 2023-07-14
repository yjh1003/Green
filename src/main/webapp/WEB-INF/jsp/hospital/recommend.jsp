<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Green - 우리동네 추천병원</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dfznifg2na&amp;submodules=geocoder"></script>
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
                
               	<section>
               		<div class="recommend ml-3">
               			우리동네 추천병원
               		</div>
               		<div id="map" class=ml-3></div>
               
	            </section>
               </div>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</div>
</body>
	<script>
			$(document).ready(function(){
				
				//지도를 삽입할 HTML 요소 또는 HTML 요소의 id를 지정합니다.
				var mapDiv = document.getElementById('map'); // 'map'으로 선언해도 동일

				//옵션 없이 지도 객체를 생성하면 서울 시청을 중심으로 하는 16 레벨의 지도가 생성됩니다.
				var map = new naver.maps.Map(mapDiv);
				
				var map = new naver.maps.Map('map', {
				    center: new naver.maps.LatLng(37.5666805, 126.9784147),
				    zoom: 10,
				    mapTypeId: naver.maps.MapTypeId.NORMAL
				});

				var infowindow = new naver.maps.InfoWindow();

				function onSuccessGeolocation(position) {
				    var location = new naver.maps.LatLng(position.coords.latitude,
				                                         position.coords.longitude);

				    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
				    map.setZoom(10); // 지도의 줌 레벨을 변경합니다.

				    infowindow.setContent('<div style="padding:20px;">' + 'geolocation.getCurrentPosition() 위치' + '</div>');

				    infowindow.open(map, location);
				    console.log('Coordinates: ' + location.toString());
				}

				function onErrorGeolocation() {
				    var center = map.getCenter();

				    infowindow.setContent('<div style="padding:20px;">' +
				        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');

				    infowindow.open(map, center);
				}

				$(window).on("load", function() {
				    if (navigator.geolocation) {
				        /**
				         * navigator.geolocation 은 Chrome 50 버젼 이후로 HTTP 환경에서 사용이 Deprecate 되어 HTTPS 환경에서만 사용 가능 합니다.
				         * http://localhost 에서는 사용이 가능하며, 테스트 목적으로, Chrome 의 바로가기를 만들어서 아래와 같이 설정하면 접속은 가능합니다.
				         * chrome.exe --unsafely-treat-insecure-origin-as-secure="http://example.com"
				         */
				        navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
				    } else {
				        var center = map.getCenter();
				        infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
				        infowindow.open(map, center);
				    }
				});
			});			
			
			
	</script>
</html>