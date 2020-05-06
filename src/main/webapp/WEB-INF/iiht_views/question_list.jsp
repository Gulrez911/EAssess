<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.assessment.data.*, java.text.*, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IIHT</title>
<link href="https://fonts.googleapis.com/css?family=Segoe+UI"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link href="css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/responsive.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="css/pnotify.custom.min.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="scripts/pnotify.custom.min.js"></script>

<style>
.dropdown-menu {
	min-width: 387px !important;
	height: 300px !important;
	overflow: auto !important;
}
</style>

<script>
	/* When the user clicks on the button,
	 toggle between hiding and showing the dropdown content */
	function myFunction() {
		document.getElementById("myDropdown").classList.toggle("show");
	}

	function filterFunction() {
		var input, filter, ul, li, a, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		div = document.getElementById("myDropdown");
		a = div.getElementsByTagName("a");
		for (i = 0; i < a.length; i++) {
			txtValue = a[i].textContent || a[i].innerText;
			if (txtValue.toUpperCase().indexOf(filter) > -1) {
				a[i].style.display = "";
			} else {
				a[i].style.display = "none";
			}
		}
	}
</script>

</head>

<body>

	<div class="maincontainer">

		<div class="wrapper">

			<div class="row row-offcanvas row-offcanvas-left">
				<!-- sidebar -->
				<jsp:include page="side.jsp" />

				<!-- /sidebar -->

				<!-- main right col -->
				<div class="column col-sm-10 col-xs-11" id="main">

					<div class="dropdown">
						<div class="col-md-2">
							<div class="dropdown">
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-toggle="dropdown" onclick="myFunction()">
									<i class="material-icons fa fa-download"></i>Download
								</button>
								<div class="dropdown-menu" id="myDropdown">
									<input type="text" placeholder="Search.." id="myInput"
										onkeyup="filterFunction()">
									<c:forEach items="${qu}" var="qualifier1">

										<c:choose>
											<c:when test="${fn:contains(qualifier1, '-')}">
												<a style="padding-left: 5px;" class="dropdown-item"
													href="<%=request.getContextPath()%>/downloadQuestion?qualifier1=${qualifier1.replaceAll('-.+', '')}">${qualifier1.replaceAll("-.+", "").concat(" -")}</a>
												<a style="padding-left: 5px;" class="dropdown-item"
													href="<%=request.getContextPath()%>/downloadQuestion?qualifier1=${qualifier1}">${qualifier1.substring(qualifier1.indexOf("-")+1)}</a>
												<br />
											</c:when>
											<c:otherwise>
												<a style="padding-left: 5px;" class="dropdown-item"
													href="<%=request.getContextPath()%>/downloadQuestion?qualifier1=${qualifier1}">${qualifier1}</a>
												<br />
											</c:otherwise>
										</c:choose>
									</c:forEach>

								</div>
							</div>

						</div>
					</div>


					<div class="rightside">
						<div class="topmenu text-right">
							<a href="addQuestion">Add New</a> <a
								href="javascript:showFileDialog();" id="uploadQuestionsLink">Import</a>
							<a href="signoff">Sign Off</a>

							<form id="fileFormQuestions" method="POST"
								enctype="multipart/form-data">
								<input type="file" name="fileQuestions" id="fileQuestions"
									style="display: none" />
							</form>



							<div class="pagination">
								<%-- 								<c:if test="${showPreviousPage}"> --%>
								<%-- 									<a href="${callingMethod}?page=${previousPage}${queryParam}"><i --%>
								<!-- 										class="fa fa-arrow-left"></i></a> -->
								<%-- 								</c:if> --%>

								<%-- 								<c:if test="${selectedPage != null &&  selectedPage > 0}"> --%>
								<%-- 	                                    ${selectedPage} / ${totalNumberOfPages} --%>
								<%--                                     </c:if> --%>

								<%-- 								<c:if test="${showNextPage}"> --%>
								<%-- 									<a href="${callingMethod}?page=${nextPage}${queryParam}"><i --%>
								<!-- 										class="fa fa-arrow-right"></i></a> -->
								<%-- 								</c:if> --%>
								<c:if test="${showPreviousPage}">
									<a
										href="${callingMethod}?sort=${sortSearch}&page=${previousPage}${queryParam}"><i
										class="fa fa-arrow-left"></i></a>
								</c:if>

								<c:if test="${selectedPage != null &&  selectedPage > 0}">
                                    ${selectedPage} / ${totalNumberOfPages}
                                </c:if>

								<c:if test="${showNextPage}">
									<a
										href="${callingMethod}?sort=${sortSearch}&page=${nextPage}${queryParam}"><i
										class="fa fa-arrow-right"></i></a>
								</c:if>
							</div>

						</div>


						<div class="questiontable">
							<div class="questionheading">
								<div class="left">
									<h3>Question Bank</h3>
								</div>
								<div class="right">
									<div class="searchdata">
										<form action="searchQuestions" method="get">
											<input type="text" placeholder="Search a Q" name="searchText"
												id="searchText"> <i class="fa fa-search" id="search"></i>
										</form>
									</div>
									<div class="col-md-5 dropdown" style="padding: 0;">
										<div class="mt-10"></div>
										<div class="col-md-4"></div>
										<button class="btn btn-primary btn-sm dropdown-toggle"
											type="button" data-toggle="dropdown">
											Sort<span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="sortQuestions?sort=update">By
													UpdateDate</a></li>
											<li><a href="sortQuestions?sort=level">By Difficulty
													Level</a></li>
											<div class="col-md-5 dropdown" style="padding: 0;">
												<div class="mt-10"></div>
												<div class="col-md-4"></div>
												<button class="btn btn-primary btn-sm dropdown-toggle"
													type="button" data-toggle="dropdown">
													Filter<span class="caret"></span>
												</button>
												<ul class="dropdown-menu">
												</ul>
											</div>
									</div>
								</div>

								<div class="filter">
									<a
										href="javascript:notify('Information', 'Feature coming soon')"><img
										src="images/ic_sort.png">Sort</a> <a
										href="javascript:notify('Information', 'Feature coming soon')"><img
										src="images/ic_filter.png">Filter</a> &nbsp; <a
										href="question_list"
										title="Click to view all Question Categories"><i
										class="fa fa-mail-reply-all"></i> </a>
								</div>

							</div>
						</div>


						<div class="questiontablelist"
							style="overflow-x: scroll; height: 500px;">
							<table class="table">
								<thead>
									<tr>
										<th>No</th>
										<th>Question</th>
										<th style="white-space: nowrap;">Category</th>
										<th>Difficulty Level</th>
										<th style="white-space: nowrap;">Updated On</th>
										<th style="white-space: nowrap;">Update</th>
										<th style="white-space: nowrap;">Delete</th>
									</tr>
								</thead>
								<tbody>
								<tbody>

									<c:forEach items="${qs}" var="question" varStatus="loop">
										<tr>

											<td>${loop.count}</td>


											<td><c:out value="${question.questionText}"></c:out></td>

											<td>${question.category}</td>
											<td><c:out value="${question.difficultyLevel.level}"></c:out>
											</td>
											<td><c:out value="${question.updatedDate}"></c:out></td>
											<td><a href="addQuestion?qid=${question.id}">Click </a></td>
											<td><a href="javascript:confirm('${question.id}')">Click
											</a></td>
										</tr>
									</c:forEach>
								</tbody>

								</tbody>
							</table>
						</div>

					</div>

				</div>

			</div>
			<!-- /main -->
		</div>
	</div>

	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>



	<script>
		/* off-canvas sidebar toggle */
		$('[data-toggle=offcanvas]').click(
				function() {
					$('.row-offcanvas').toggleClass('active');
					$('.collapse').toggleClass('in').toggleClass('hidden-xs')
							.toggleClass('visible-xs');
				});

		$('#search').on('click', function() {
			var text = document.getElementById("searchText").value;
			if (text.length != 0) {
				window.location = "searchQuestions?searchText=" + text;
			}
		});

		var isXlsx = function(name) {
			return name.match(/xlsx$/i)
		};

		$("#btnfile").click(function() {
			$("#uploadfile").click();
		});

		function showFileDialog() {
			$("#fileQuestions").click();
		}

		$(document)
				.ready(
						function() {

							var file = $('[name="fileQuestions"]');
							var imgContainer = $('#imgContainer');

							$('#uploadLink').on('click', function() {
								// $("#file").click();

							});

							var fileU = document
									.getElementById('fileQuestions');
							fileU
									.addEventListener(
											"change",
											function() {
												if (fileU.files.length > 0) {
													var filename = $.trim(file
															.val());

													if (!(isXlsx(filename))) {
														notify('Error',
																'Please select an xlsx file to upload');
														return;
													}

													$
															.ajax(
																	{
																		xhr : function() {
																			var xhr = new window.XMLHttpRequest();

																			return xhr;
																		},
																		url : 'upload',
																		type : "POST",
																		data : new FormData(
																				document
																						.getElementById("fileFormQuestions")),
																		enctype : 'multipart/form-data',
																		processData : false,
																		contentType : false
																	})
															.done(
																	function(
																			data) {
																		notify(
																				'Success',
																				'File Upload Successful');

																	})
															.fail(
																	function(
																			jqXHR,
																			textStatus) {
																		notify(
																				'Failure',
																				'File Upload Failed. Please contact Administrator');
																	});
													document
															.getElementById('fileQuestions').value = null;
													return;
												}

											});

						});

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

		function confirm(id) {
			(new PNotify({
				title : 'Confirmation Needed',
				text : 'Are you sure? Do you really want to delete this Q?',
				icon : 'glyphicon glyphicon-question-sign',
				hide : false,
				confirm : {
					confirm : true
				},
				buttons : {
					closer : false,
					sticker : false
				},
				history : {
					history : false
				}
			})).get().on('pnotify.confirm', function() {
				window.location = "removeQuestionFromList?qid=" + id;
			}).on('pnotify.cancel', function() {

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