<%@page isELIgnored="false" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tasks page</title>
</head>
<body>
    <h3>Tasks page</h3>
    <form:form action="viewtask" modelAttribute="UserBinding" method="POST">
    <%-- <input type="hidden" name="userId" value="${userId}" /> --%>
    <table border="1">
        <thead>
            <tr>
                <th>TaskId</th>
                <th>TaskName</th>
                <th>DueDate</th>
                <th>DueTime</th>
                <th>DeleteTask</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${task}" var="taskinfo">
                <tr>
                    <td>${taskinfo.taskId}</td>
                    <td>${taskinfo.taskName}</td>
                    <td>${taskinfo.taskDate}</td>
                    <td>${taskinfo.taskTime}</td>
                    <td>${taskinfo.deleteTask}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="createtask?userId=${userId}">CreateTask</a>

   </form:form>
</body>
</html>