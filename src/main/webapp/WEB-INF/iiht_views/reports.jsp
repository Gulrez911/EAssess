<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.assessment.data.*, java.text.*, java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Assess</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link href="css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/responsive.css" rel="stylesheet" type="text/css">
<link href="css/pnotify.custom.min.css" rel="stylesheet" type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="scripts/pnotify.custom.min.js"></script>
<script type="text/javascript" src="scripts/custom.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>

<link href="css/font-awesome.css" rel="stylesheet" type="text/css">
<script>
$("#mydate").datepicker().datepicker("setDate", new Date());
</script>
</head>

<body>

	<div class="maincontainer">

		<div class="wrapper">
			<div class="row row-offcanvas row-offcanvas-left">
				<!-- sidebar -->
				<jsp:include page="side.jsp" />

				<!-- /sidebar -->

				<div class="column col-sm-10 col-xs-11" id="main">
					<div class="rightside">
						<div class="topmenu text-left">
							<a href="downloadTestReport"><img
								src="images/testsReport.png"> All Tests Report</a> <a
								href="downloadUserReport"><img src="images/usersReport.png">All
								User Sessions Report</a> <a onclick="javascript:openDownload()"><img
								src="images/usersReport.png">Download Report</a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="signoff">Sign Off</a>
						</div>


						<div class="questiontable">
							<div class="questionheading">
								<div class="left">
									<h3>${reportType}</h3>
								</div>
								<div class="right">

									<div class="filter"></div>
									<div class="filter"></div>
								</div>
							</div>
							<div class="questiontablelist"
								style="overflow-x: scroll; overflow-y: auto;">
								<table class="table">
									<thead>
										<tr>
											<th><b>No</b></th>
											<th><b>Test Title</b></th>

											<th><b>Sections</b></th>
											<th><b>Sessions</b></th>
											<th><b>Passed </b></th>
											<th><b>Average Score</b></th>
											<th><b>Highest Score</b></th>
											<th><b>Top Candidates</b></th>
											<th><b>Contact</b></th>
											<th><b>Download Users Report</b></th>
											<th><b>Download Users Report With Extra Attrs</b></th>

										</tr>
									</thead>
									<tbody>
									<tbody>

										<c:forEach items="${testsessions}" var="session"
											varStatus="loop">
											<tr>
												<td>${loop.count}</td>

												<td>${session.testName}</td>

												<td>${session.sectionsInfo}</td>
												<td>${session.noOfSessions}</td>
												<td>${session.noOfPassResults}</td>

												<td>${session.averageScore}</td>
												<td>${session.highestScore}</td>
												<td>${session.topCandidates}</td>
												<td>${session.topCandidatesEmail}</td>
												<!--<td> <a  href="downloadUserReportsForTest?testName=${session.testName}">Click </a>  </td> -->
												<td><a href="javascript:void(0);"
													onclick="encodeAndSend('downloadUserReportsForTest','testName','${session.testName}');">Click
												</a></td>
												<!--<td> <a  href="downloadUserReportsForTestWithExtraAttrs?testName=${session.testName}">Click </a>  </td> -->
												<td><a href="javascript:void(0);"
													onclick="encodeAndSend('downloadUserReportsForTestWithExtraAttrs','testName','${session.testName}');">Click
												</a></td>

											</tr>
										</c:forEach>
									</tbody>

									</tbody>
								</table>
							</div>
							<div>&nbsp;</div>
							<div>&nbsp;</div>
							<div>&nbsp;</div>
							<div>&nbsp;</div>
							<div>&nbsp;</div>
						</div>
					</div>
				</div>
				<!-- /main -->
			</div>
		</div>
	</div>

	<div id="modalshare" class="modal fade modalcopy" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Share Test</h4>
				</div>
				<div class="modal-body">
					<form method="GET" action="downloadReportFilters">
						<label>Test Name:</label>
						<form:select path="test.testName" class="form-control"
							onchange="Change()" id="name">
							<option value="ALL">ALL</option>
							<form:options items="${listTest}" itemValue="testName"
								itemLabel="testName" />
						</form:select>
						<label>User Name</label> <select id="slct" class="form-control"
							name="userName">
							<option>ALL</option>
						</select> <label style="width: 30%;"> Start Date:</label> <label
							style="width: 70%;"> End Date:</label><input type="date"
							name="startDate" required/> 
							
							<input type="date" id="mydate"  name="endDate" required /> 
							
							<label>Result:</label>
						<select class="form-control" name="result">
							<option value="ALL">All</option>
							<option value="true">Pass</option>
							<option value="false">Fail</option>
						</select> <label>Percentage</label><input type="text" name="min"
							placeholder="Minimum percentage" value="0" required/> <input type="text"
							name="max" placeholder="Maximum percentage" value="100" required/>
						<div class="buttons" style="padding-top: 20px;">
							<input type="submit" value="Download"
								style="align-content: center;" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script>
		function encodeAndSend(method, key, value) {
			val = encodeURIComponent(value);
			url = '' + method + '?' + key + '=' + val;
			window.location = url;

		}
		function notify(messageType, message) {
			var notification = 'Information';
			$(function() {
				new PNotify({
					title : notification,
					text : message,
					type : messageType,
					styling : 'bootstrap3',
					hide : true
				});
			});
		}
		function openDownload() {
			console.log("test");
			$('#modalshare').modal('show');
		}
		function Change() {
			var testN = $('#name').val();
			console.log(testN)
			$.ajax({
				url : "fetchEmail?testN=" + testN,
				type : 'GET',
				success : function(response) {
					console.log(response.listEmail.length)
					$('.opt').remove();
					for (i = 0; i < response.listEmail.length; i++) {
						console.log(response.listEmail[i]);
						$("#slct").append(
								"<option class='opt'>" + response.listEmail[i]
										+ "</option>");
					}
				},
			});
		}
	</script>


	<c:if test="${msgtype != null}">
		<script>
			var notification = 'Information';
			$(function() {
				new PNotify({
					title : notification,
					text : '${message}',
					type : '${msgtype}',
					styling : 'bootstrap3',
					hide : true
				});
			});
		</script>
	</c:if>
</body>
</html>
