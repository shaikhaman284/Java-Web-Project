
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .score_background{
                background-image: linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)),url("img/scorebg.jpg");
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                height: 100vh;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                text-align: center;
                color: white;
            }
        </style>

        <script type="text/javascript">
            function disableBack() {
                window.history.forward();
            }
            setTimeout("disableBack()", 0);
            window.onunload = function () {
                null;
            };
        </script>

    </head>
    <body onload="disableBack()">
        <div class="score_background">
            <form>  
                <c:set var="user" value="${user}"/>
                <input type="hidden" id="user" name="user" value="${user}" />
                <c:set var="email" value="${email}"/>
                <input type="hidden" id="email" name="email" value="${email}" />
                <h1 class="heading"><c:out value="${user}" /> Your Score is : <c:out value="${score}" /></h1>
                <button class="button" type="button" value="exit" onclick="checkButtonClicked(this);">Exit</button>
            </form>
        </div>

        <script type="text/javascript">
            function checkButtonClicked(button) {
                if (button.value === "exit") {
                    window.location.href = "index.html";
                }
            }
        </script>
    </body>

</html>
