<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="jakarta.servlet.http.HttpServlet"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%@page import="DatabaseDAO.QuestionDAO"%>
<%@page import="DatabaseDAO.Question"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css" />
        <title>Quiz Page</title>
        <style>
            .quiz_background{
                background-image: linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)),url("img/quizbg.png");
                background-size: cover;
                height: 100vh;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                text-align: center;
                color: white;
            }

            .quiz-container {
                background-color:  transparent;

                border-radius: 5px;
                box-shadow: 0 3px 10px rgba(255, 255, 255, 255);
                padding: 30px;
                max-width: 1200px;
                margin: 0 auto;
                text-align: left;
            }

            .question {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 20px;
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

        <script type="text/javascript">
            var timeLeft = 30;
            var timerInterval;

            function startTimer() {
                let isEnabled = document.getElementById("submit").disabled;
                timerInterval = setInterval(function () {
                    timeLeft--;
                    document.getElementById("timer").innerHTML = formatTime(timeLeft);
                    if (timeLeft <= 0 && isEnabled) {
                        clearInterval(timerInterval);
                        document.getElementById("next").click();
                    } else if (timeLeft <= 0 && !isEnabled) {
                        document.getElementById("submit").click();
                    }
                }, 1000);
            }

            function formatTime(time) {
                var minutes = Math.floor(time / 60);
                var seconds = time % 60;
                return minutes + ":" + (seconds < 10 ? "0" + seconds : seconds);
            }
        </script>
    </head>


    <body onload="startTimer(); disableBack();">
        <%! int count = 2; %>
        <div class="quiz_background">
            <h1>Time Left</h1>
            <h1 id="timer">30:00</h1>
            <form id="myForm" action="QuizServlet" method="get">
                <div class="quiz-container">
                    <c:set var="user" value="${user}"/>
                    <input type="hidden" id="user" name="user" value="${user}" />
                    <c:set var="email" value="${email}"/>
                    <input type="hidden" id="email" name="email" value="${email}" />

                    <h2 class="question">Que. No:  <c:out value="${count}" /></h2>

                    <c:set var="question" value="${question}"/>
                    <input type="hidden" id="question" name="question" value="${question}" />
                    <h2 class="question" name="question" value="${question}"><c:out value="${question}" /></h2>

                    <c:set var="opt1" value="${option1}"/>
                    <input type="radio" class="option" name="option" value="${opt1}"/><c:out value="${option1}" /><br />
                    <c:set var="opt2" value="${option2}"/>
                    <input type="radio" class="option" name="option" value="${opt2}"/><c:out value="${option2}" /> <br />
                    <c:set var="opt3" value="${option3}"/>
                    <input type="radio" class="option" name="option" value="${opt3}"/><c:out value="${option3}" /> <br />
                    <c:set var="opt4" value="${option4}"/>
                    <input type="radio" class="option" name="option" value="${opt4}"/><c:out value="${option4}" /> <br />

                    <c:set var="answer" value="${answer}"/>
                    <input type="hidden" id="answer" name="answer" value="${answer}" />


                    <div class="button-container">
                        <button class="button" type="submit" id="submit" value="Submit" name="submit" onclick="checkButtonClicked(this);" disabled>Submit</button>
                        <input type="hidden" id="count" name="count" value="<%= count %>" />
                        <button class="button" type="submit" id="next" value ="Next" name="next" onclick="checkButtonClicked(this);">Next</button> 
                    </div>
                </div>
            </form>
        </div>
        <c:set var="score" value="${score}"/>
        <input type="hidden" id="score" name="score" value="${score}" />

        <%! QuestionDAO rowsDAO = new QuestionDAO();
                   Question rows = null; %>
        <%    rows = rowsDAO.GetRowno();
                    int rowno = rows.getRowno(); %>
        <% if(count==rowno+1){%>
        <script>
            document.getElementById("next").disabled = true;
            document.getElementById("submit").disabled = false;
        </script>
        <% } %>




        <script>

            function checkButtonClicked(button) {

                if (button.value === "Submit") {
                    document.getElementById("myForm").action = "QuizServlet";
                    document.getElementById("myForm").submit();
                } else if (button.value === "Next") {
            <% count=count+1; 
             if(count<11){ %>
                    document.getElementById("count").innerHTML = <%= count %>;
                    document.getElementById("myForm").action = "QuizServlet";
                    document.getElementById("myForm").submit();
            <% } %>
                }
            }

        </script>



    </body>
</html>