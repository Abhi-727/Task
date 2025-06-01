<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Task List</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
</head>
<body class="bg-light">

<!-- Bootstrap Navbar with Logout -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">ToDo App</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link btn btn-outline-light px-3" href="/">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container py-5">
    <h2 class="mb-4 text-center">Your Task List</h2>

    <!-- Success/Info Message -->
    <c:if test="${not empty resultMsg}">
        <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
                ${resultMsg}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <!-- Task Table -->
    <c:choose>
        <c:when test="${not empty task}">
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped table-dark">
                    <thead class="text-center">
                    <tr>
                        <th>S.No</th>
                        <th>Task ID</th>
                        <th>Task Name</th>
                        <th>Due Date</th>
                        <th>Due Time</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="taskinfo" items="${task}" varStatus="status">
                        <tr class="text-center align-middle">
                            <td>${status.index + 1}</td>
                            <td>${taskinfo.taskId}</td>
                            <td>${taskinfo.taskName}</td>
                            <td>${taskinfo.taskDate}</td>
                            <td>${taskinfo.taskTime}</td>
                            <td>
                                <a href="delete?userId=${userId}&taskId=${taskinfo.taskId}"
                                   onclick="return confirm('Do you want to delete this task ?')"
                                   class="btn btn-danger btn-sm">
                                    <img src="images/delete.png" width="25" height="25" alt="Delete"/>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-warning text-center" role="alert">
                No tasks found.
            </div>
        </c:otherwise>
    </c:choose>

    <!-- Add Task Link -->
    <div class="text-center mt-5">
        <a href="/createtask?userId=${userId}" class="btn btn-success btn-lg">
            <img src="images/task.jpg" width="30" height="30" alt="Add"/> Add New Task
        </a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
