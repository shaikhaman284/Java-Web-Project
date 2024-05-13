
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource var="dataSource" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/quizdb" user="root" password="6967" />


<c:set var="email" value="${param.email}" />

<sql:query dataSource="${dataSource}" var="result">
    SELECT * FROM user_answer WHERE email = ?
    <sql:param value="${email}" />
</sql:query>
<% int serialNo = 0; %>

<table border="1">
    <tr>
        <th>Sr. No.</th>
        <th>Attempted Q.No.</th>
        <th>Question</th>
        <th>Selected Answer</th>
        <th>Correct Answer</th>
        <th>Marks</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><%= ++serialNo %></td>
            <td><c:out value="${row.quesno}"/></td>
            <td><c:out value="${row.question}"/></td>
            <td><c:out value="${row.user_answer}"/></td>
            <td><c:out value="${row.correct_answer}"/></td>
            <td><c:out value="${row.marks}"/></td>
        </tr>
    </c:forEach>
</table>