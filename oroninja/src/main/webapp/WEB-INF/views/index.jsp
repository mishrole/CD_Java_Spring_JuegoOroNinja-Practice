<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ninja Gold Game</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<!-- Locale CSS -->
	<link rel="stylesheet" href="/css/style.css" />
</head>
<body>
	
	<div class="container py-5">    	
		<div class="d-flex justify-content-center">
			<div class="container">
				<h3 class="text-center">Your Gold: <span class="fw-bold"><c:out value="${balance}"></c:out></span></h3>
				
				<div class="row pt-3">

					<div class="col-6 col-lg-3 p-2">
						<div class="card">
							<div class="card-body">
								<form action="/game?q=farm" method="POST">
									<div class="row mx-auto">
										<div class="col-12">
											<p class="fw-bold">Farm</p>
											<p>Type: Earns</p>
											<p>Amount: 10-20 gold</p>
											<div class="d-flex align-items-center justify-content-end">
												<button class="btn btn-warning" type="submit">Find Gold!</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					
					<div class="col-6 col-lg-3 p-2">
						<div class="card">
							<div class="card-body">
								<form action="/game?q=cave" method="POST">
									<div class="row mx-auto">
										<div class="col-12">
											<p class="fw-bold">Cave</p>
											<p>Type: Earns</p>
											<p>Amount: 5-10 gold</p>
											<div class="d-flex align-items-center justify-content-end">
												<button class="btn btn-warning" type="submit">Find Gold!</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					
					<div class="col-6 col-lg-3 p-2">
						<div class="card">
							<div class="card-body">
								<form action="/game?q=house" method="POST">
									<div class="row mx-auto">
										<div class="col-12">
											<p class="fw-bold">House</p>
											<p>Type: Earns</p>
											<p>Amount: 2-5 gold</p>
											<div class="d-flex align-items-center justify-content-end">
												<button class="btn btn-warning" type="submit">Find Gold!</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					
					<div class="col-6 col-lg-3 p-2">
						<div class="card">
							<div class="card-body">
								<form action="/game?q=casino" method="POST">
									<div class="row mx-auto">
										<div class="col-12">
											<p class="fw-bold">Casino</p>
											<p>Type: Earns/Takes</p>
											<p>Amount: 0-50 gold</p>
											<div class="d-flex align-items-center justify-content-end">
												<button class="btn btn-warning" type="submit">Find Gold!</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					
				</div>
			
				<div class="row">
					<div class="col-12 pt-5">
						<p class="fw-bold">Activities</p>
						<div class="card">
							<div class="card-body activities" id="activities">
								<c:forEach var="activity" items="${activities}">
					                <c:if test="${activity.type == 'earned'}">
					                	<p class="text-success">You entered a ${activity.game} and ${activity.type} ${activity.amount} gold. (<fmt:formatDate pattern = "E dd-MM-yyy HH:mm:ss" value = "${activity.createdAt}" />)</p>
					                </c:if>
					                <c:if test="${activity.type == 'lost'}">
					                	<p class="text-danger">You entered a ${activity.game} and ${activity.type} ${activity.amount} gold. Ouch. (<fmt:formatDate pattern = "E dd-MM-yyy HH:mm:ss" value = "${activity.createdAt}" />)</p>
					                </c:if>
					            </c:forEach>
							</div>
						</div>
					</div>
					
					<div class="col-12 pt-5">
						<div class="d-flex justify-content-center align-items-center">
							<a href="/reset" class="btn btn-danger">Reset</a>
						</div>
					</div>
				</div>
				
			</div>

		</div>
	</div>
	
	<!-- jQuery (No necesario en Bootstrap 5) -->
	<!-- <script src="/webjars/jquery/jquery.min.js"></script> -->
	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- Locale JS -->
	<script src="/js/app.js"></script>
</body>
</html>