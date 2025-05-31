<%@page isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"/>

<div class="container">

    <c:choose>
        <c:when test="${!empty task}">
            <!--  <table border="1" class="table table-striped" bgcolor="lightgreen"> -->
            <!--     <table border="1" class="table table-striped"> -->
            <!--  <table border="1" class="table table-hover"> -->
            <table border="1" class="table table-hover table-dark">
                <tr>
                    <th>TaskId</th>
                    <th>TaskName</th>
                    <th>DueDate</th>
                    <th>DueTime</th>
                    <th>DeleteTask</th>
                </tr>
                <c:forEach var="taskinfo" items="${task}">
                    <tr>
                        <td>${taskinfo.taskId}</td>
                        <td>${taskinfo.taskName}</td>
                        <td>${taskinfo.taskDate}</td>
                        <td>${taskinfo.taskTime}</td>
                        <td><a onclick="return confirm('Do you want to delete ?')" href="delete?userId=${userId}&taskId=${taskinfo.taskId}"><img src="images/delete.png" width="50" height="50"></a> </td>
                    </tr>
                </c:forEach>
            </table>

        </c:when>
        <c:otherwise>
            <h1 style="color:red;text-align:center"> Records not found </h1>
        </c:otherwise>
    </c:choose>

    <c:if test="${!empty resultMsg}">
        <h3 style="color:green;text-align:center"> ${resultMsg }</h3>
    </c:if>

    <br><br>

    <hr>

    <h1 Style="text-align:center"><a href="/createtask?userId=${userId}"><img src="images/add.png" width="50" height="50" />Add Newtask</a></h1>

</div>


