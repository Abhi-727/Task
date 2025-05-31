<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Create Task</title>

	<!-- Bootstrap 5 CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- Navbar with Logout -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">ToDo App</a>
		<div class="collapse navbar-collapse justify-content-end">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link btn btn-outline-light px-3" href="logout">Logout</a>
				</li>
			</ul>
		</div>
	</div>
</nav>

<!-- Main Form Content -->
<div class="container mt-5">
	<div class="row justify-content-center">
		<div class="col-md-6 col-lg-5">
			<div class="card shadow rounded-4">
				<div class="card-body">
					<h3 class="card-title text-center mb-4">Create Task</h3>

					<!-- Success Alert -->
					<c:if test="${not empty task}">
						<div class="alert alert-success alert-dismissible fade show" role="alert">
								${task}
							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					</c:if>

					<!-- Task Form -->
					<form:form action="createtask" modelAttribute="TaskBinding" method="POST">
						<div class="mb-3">
							<label for="taskName" class="form-label">Task Name</label>
							<form:input path="taskName" cssClass="form-control" id="taskName" />
						</div>

						<div class="mb-3">
							<label for="taskDate" class="form-label">Task Date</label>
							<form:input path="taskDate" type="date" cssClass="form-control" id="taskDate" />
						</div>

						<div class="mb-3">
							<label for="taskTime" class="form-label">Task Time</label>
							<form:input path="taskTime" type="time" cssClass="form-control" id="taskTime" />
						</div>

						<div class="d-grid mb-2">
							<button type="submit" class="btn btn-primary">Create</button>
						</div>
					</form:form>

					<div class="text-center">
						<a href="viewtask?userId=${userId}" class="btn btn-link">View Tasks</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
