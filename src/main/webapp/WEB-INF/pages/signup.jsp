<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>To Do List - Sign Up</title>

	<!-- Bootstrap 5 CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light" style="min-height: 100vh;">

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="/">ToDo App</a>
	</div>
</nav>

<!-- Main Content -->
<div class="container d-flex align-items-center" style="min-height: 90vh;">
	<div class="row justify-content-center w-100">
		<div class="col-md-6 col-lg-5 mx-auto">
			<div class="card shadow p-4 rounded-4">
				<h3 class="text-center mb-4">Sign Up</h3>

				<!-- Bootstrap alert for registration message -->
				<c:if test="${not empty reg}">
					<div class="alert alert-info alert-dismissible fade show" role="alert">
							${reg}
						<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
				</c:if>

				<!-- Sign-up form -->
				<form:form action="register" modelAttribute="UserBinding" method="POST">
					<div class="mb-3">
						<label for="userName" class="form-label">Name</label>
						<form:input path="userName" cssClass="form-control" id="userName"
									placeholder="Enter your name" required="required"/>
					</div>

					<div class="mb-3">
						<label for="userMail" class="form-label">Mail</label>
						<form:input path="userMail" cssClass="form-control" id="userMail" type="email"
									placeholder="Enter your email" required="required"/>
					</div>

					<div class="mb-3">
						<label for="userPhno" class="form-label">Phone</label>
						<form:input path="userPhno" cssClass="form-control" id="userPhno" type="tel"
									placeholder="Enter your phone number"
									pattern="[0-9]{10}" title="Enter a valid 10-digit number" required="required"/>
					</div>

					<div class="mb-3">
						<label for="userIdentity" class="form-label">Password</label>
						<form:input path="userIdentity" cssClass="form-control" id="userIdentity"
									placeholder="Enter your secret code" required="required"/>
					</div>

					<div class="mb-3">
						<label class="form-label">Gender</label><br/>
						<div class="form-check form-check-inline">
							<form:radiobutton path="userGender" value="male" cssClass="form-check-input"
											  id="genderMale" required="required"/>
							<label class="form-check-label" for="genderMale">Male</label>
						</div>
						<div class="form-check form-check-inline">
							<form:radiobutton path="userGender" value="Female" cssClass="form-check-input"
											  id="genderFemale"/>
							<label class="form-check-label" for="genderFemale">Female</label>
						</div>
					</div>

					<div class="d-grid mb-2">
						<button type="submit" class="btn btn-primary">Sign Up</button>
					</div>

					<!-- Back Button -->
					<div class="d-grid">
						<button type="button" class="btn btn-secondary" onclick="history.back();">
							&#8592; Back
						</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>

<!-- Bootstrap JS Bundle (for alert close, etc.) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
