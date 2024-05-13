<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>



<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/quizdb" user="root" password="6967"/>

<sql:query var="ques" dataSource="${ds}">
    SELECT * FROM questionsopt;
</sql:query>

<table border="1">
    <tr>
        <th>No.</th>
        <th>Question</th>
        <th>Opt1</th>
        <th>Opt2</th>
        <th>Opt3</th>
        <th>Opt4</th>
        <th>Answer</th>
    </tr>
    <c:forEach var="question" items="${ques.rows}">
        <tr>
            <td><c:out value="${question.quesno}"/></td>
            <td><c:out value="${question.questions}"/></td>
            <td><c:out value="${question.opt1}"/></td>
            <td><c:out value="${question.opt2}"/></td>
            <td><c:out value="${question.opt3}"/></td>
            <td><c:out value="${question.opt4}"/></td>
            <td><c:out value="${question.answers}"/></td>
        </tr>
    </c:forEach>
</table>
