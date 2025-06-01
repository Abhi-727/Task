<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Login</title>

	<!-- Bootstrap CSS (v5 CDN) -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="/">ToDo App</a>
	</div>
</nav>

<div class="container mt-5">
	<div class="row justify-content-center">
		<div class="col-md-6 col-lg-5">
			<div class="card shadow rounded-4">
				<div class="card-body">
					<h3 class="card-title text-center mb-4">Login</h3>

					<c:if test="${not empty errMsg}">
						<div class="alert alert-danger" role="alert">
								${errMsg}
						</div>
					</c:if>

					<form:form action="login" modelAttribute="UserLogin" method="POST">
						<div class="mb-3">
							<label for="userMail" class="form-label">Username</label>
							<form:input path="userMail" cssClass="form-control" id="userMail"/>
						</div>

						<div class="mb-3">
							<label for="userIdentity" class="form-label">Password</label>
							<form:input path="userIdentity" cssClass="form-control" id="userIdentity"/>
						</div>

						<div class="d-grid">
							<button type="submit" class="btn btn-primary">Login</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Bootstrap JS (Optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
