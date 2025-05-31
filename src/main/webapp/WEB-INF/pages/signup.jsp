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
<body class="bg-light d-flex align-items-center" style="min-height: 100vh;">

<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6 col-lg-5">
			<div class="card shadow p-4 rounded-4">
				<h3 class="text-center mb-4">Sign Up</h3>

				<!-- Bootstrap alert for registration message -->
				<c:if test="${not empty reg}">
					<div class="alert alert-info alert-dismissible fade show" role="alert">
							${reg}
						<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
				</c:if>

				<form:form action="register" modelAttribute="UserBinding" method="POST">
					<div class="mb-3">
						<label for="userName" class="form-label">Name</label>
						<form:input path="userName" cssClass="form-control" id="userName"/>
					</div>

					<div class="mb-3">
						<label for="userMail" class="form-label">Mail</label>
						<form:input path="userMail" cssClass="form-control" id="userMail"/>
					</div>

					<div class="mb-3">
						<label for="userPhno" class="form-label">Phone</label>
						<form:input path="userPhno" cssClass="form-control" id="userPhno"/>
					</div>

					<div class="mb-3">
						<label for="userIdentity" class="form-label">User Code</label>
						<form:input path="userIdentity" cssClass="form-control" id="userIdentity"/>
					</div>

					<div class="mb-3">
						<label class="form-label">Gender</label><br/>
						<div class="form-check form-check-inline">
							<form:radiobutton path="userGender" value="male" cssClass="form-check-input" id="genderMale"/>
							<label class="form-check-label" for="genderMale">Male</label>
						</div>
						<div class="form-check form-check-inline">
							<form:radiobutton path="userGender" value="Female" cssClass="form-check-input" id="genderFemale"/>
							<label class="form-check-label" for="genderFemale">Female</label>
						</div>
					</div>

					<div class="d-grid mb-2">
						<button type="submit" class="btn btn-primary">Sign Up</button>
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
