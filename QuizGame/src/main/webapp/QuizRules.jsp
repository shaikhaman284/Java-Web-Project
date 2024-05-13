
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <title>Quiz Game</title>

        <style>
            .rule_background{
                background-image: linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)),url("img/rulebg.jpg");
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
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
        <% 
        int count = 1;
        %>
        <div class="rule_background">
            <div class="container">
                <h1 class="heading">Quiz Game</h1>

                <h2 class="user">Hello <c:out value="${user}" /> <i class="fa fa-smile"></i></h2>
                <h2>Welcome to the Quiz Game! </h2>
                <p> Here are the Rules:</p>
                <ul>
                    <li>You will be asked a series of questions.</li>
                    <li>Each question has four possible answers.</li>
                    <li>Choose the correct answer to score points.</li>
                    <li>You have 30 seconds to answer each question.</li>
                    <li>The game ends after 10 questions.</li>
                </ul>
                <div class="buttons">
                    <form id="myForm">
                        <c:set var="user" value="${user}"/>
                        <input type="hidden" id="user" name="user" value="${user}" />
                        <c:set var="email" value="${email}"/>
                        <input type="hidden" id="email" name="email" value="${email}" />
                        <input class="button" type="button" value="start" onclick="checkButtonClicked(this);" />
                        <input class="button" type="button" value="exit" onclick="checkButtonClicked(this);" />
                        <input type="hidden" name="count" value="<%= count %>" />
                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function checkButtonClicked(button) {
                if (button.value === "exit") {
                    window.location.href = "StudentLogin.jsp";
                } else if (button.value === "start") {
                    document.getElementById("myForm").action = "QRuleServlet";
                    document.getElementById("myForm").submit();
                }
            }
        </script>

    </body>


</html>