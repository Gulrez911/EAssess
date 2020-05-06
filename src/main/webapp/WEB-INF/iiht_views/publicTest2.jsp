<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
h1 {
	text-align: center;
	font-family: Tahoma, Arial, sans-serif;
	color: #06D85F;
	margin: 80px 0;
}

.box {
	width: 40%;
	margin: 0 auto;
	background: rgba(255, 255, 255, 0.2);
	padding: 35px;
	border: 2px solid #fff;
	border-radius: 20px/50px;
	background-clip: padding-box;
	text-align: center;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 8px 19px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button1 {
	background-color: #ffffff9e;
	color: black;
	border: 2px solid #6b696982;
	border-radius: 6px;
}

.button1:hover {
	background-color: #ffcf009e;
	color: white;
}

/* .button { */
/* 	font-size: 1em; */
/* 	padding: 10px; */
/* 	color: #fff; */
/* 	border: 2px solid #06D85F; */
/* 	border-radius: 20px/50px; */
/* 	text-decoration: none; */
/* 	cursor: pointer; */
/* 	transition: all 0.3s ease-out; */
/* } */

/* .button:hover { */
/* background-color: #ff9900; */
/* 	background: #06D85F; */
/* } */
.overlay {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.7);
	transition: opacity 500ms;
	visibility: hidden;
	opacity: 0;
}

.overlay:target {
	visibility: visible;
	opacity: 1;
}

.popup {
	margin: 335px auto;
	padding: 20px;
	background-color: rgb(255, 255, 162);
	/* 	background: #fff; */
	border-radius: 5px;
	width: 30%;
	position: relative;
	transition: all 5s ease-in-out;
}

.popup h2 {
	margin-top: 0;
	color: #333;
	font-family: Tahoma, Arial, sans-serif;
}

.popup .close {
	position: absolute;
	top: 20px;
	right: 30px;
	transition: all 200ms;
	font-size: 30px;
	font-weight: bold;
	text-decoration: none;
	color: #333;
}

.popup .close:hover {
	color: #06D85F;
}

.popup .content {
	max-height: 30%;
	overflow: auto;
}

@media screen and (max-width: 700px) {
	.box {
		width: 70%;
	}
	.popup {
		width: 70%;
	}
}
</style>
<script>
 $(document).ready(function(){
//  	showConfirm();
// 		console.log("TTT   ")
     var pageURL = $(location).attr("href");
//      console.log("222:   "+pageURL)
     pageURL = pageURL.replace("publicTest2", "publicTest");
//      console.log(pageURL)
     $('#ur').attr( 'src',pageURL);
//      $('#url').html(pageURL);
 });
 </script>
</head>
<body style="text-align: center;">
	<!--     <iframe src="http://localhost:8080/Yaksha/publicTest2?&testId=49&companyId=IH&startTime=MTU3OTcxNzgwMDAwMA%3D%3D&endTime=MTU4MzQzMzAwMDAwMA%3D%3D"  height="700px" width="1400px" id="ur"> -->
	<iframe src="" id="ur" height="850px" width="1300px"></iframe>

	<div class="box">
		<a class="button" href="#popup1" id="clc" style="display: none;">Let
			me Pop up</a>
	</div>

	<div id="popup1" class="overlay">
		<div class="popup">
			<!-- <a id="cls"  href="#11">&times;</a> -->
			<div class="content">Yaksha work's on full screen mode. Please
				click full screen below and resume the test.</div>
			<br> <a onclick="fullScreen()" href="#" class="button button1">Full
				Screen</a>
		</div>
	</div>
	<script>
        function sleep(ms) {
         return new Promise(resolve => setTimeout(resolve, ms));
        }
					var count = 0;
					var fullscreenheight;
        			$(window).on('resize',  function () {
					console.log(screen.width+" : "+window.innerWidth);
          				setTimeout(() => {
//const windowWidth = window.innerWidth * window.devicePixelRatio;
						const windowHeight = window.innerHeight * window.devicePixelRatio;
						count++;
						if(count == 1){
							fullscreenheight = windowHeight;
							}
							
							if(windowHeight < fullscreenheight ){
							console.log('open popup');
							$("#clc")[0].click();
						}
							
				}, 100);
           	
        		});


       
       
       
//             $(document).ready(function () {
//                 $("#myModal").modal({
//                     show: false,
//                     backdrop: 'static'
//                 });
//             });

            function fullScreen(){
            $("#cls").click()
            var elem = document.documentElement;
            if (elem.requestFullscreen) {
               elem.requestFullscreen();
             } else if (elem.mozRequestFullScreen) { /* Firefox */
               elem.mozRequestFullScreen();
             } else if (elem.webkitRequestFullscreen) { /* Chrome, Safari and Opera */
              elem.webkitRequestFullscreen();
             } else if (elem.msRequestFullscreen) { /* IE/Edge */
               elem.msRequestFullscreen();
             }
 
 console.log(" in fullscreen "+_fullscreenEnabled());
            }
        </script>
</body>
</html>