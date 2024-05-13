<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
    <head>
        <title>Quiz Page</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            .admin_backgroud{
                background-image: linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)),url("img/admin_bg.jpeg");
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
            form{
                width: 1400px;
                padding: 20px;
                background: linear-gradient(to right, transparent, rgba(200,200, 200, 0.1), transparent);
                color: #fff;
                background-color: transparent;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
                text-align: left;
                max-width: 100%;
                max-height: 90%;
                margin: auto;
                overflow: auto;
            }

            h1 {
                text-align: center;
                margin-bottom: 30px;
            }

            .button-group {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px;
            }

            label {
                display: block;
                margin-bottom: 10px;
            }

            input[type="text"], select {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            #quesNo{
                width: 10%;
            }

            #optionInput{
                width: 30%;
            }

            #answer{
                width:30%;
            }

            .email{
                width: 40%
            }

            table {
                border-collapse: collapse;
                width: 100%;

            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
                color: white;
            }


            tr:hover {
                background-color: black;

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
        <div class="admin_backgroud">

            <form action='AdminPanelServlet' method="post">
                <h1 class="heading" style="font-size: 50px">Admin Panel<i class="fa fa-cogs" style="font-size:30px;"></i></h1>
                <div class="button-group">
                    <button class="button" type="button" id='addQue' name="addQuestion">Add Question</button>
                    <button class="button" type="button" id='updtQue' name="updateQuestion">Update Question</button>
                    <button class="button" type="button" id='showQue' name="showQuestions">Show Questions</button>
                    <button class="button" type="button" id='showRes' name="showResponse">Show Response</button>
                </div>
                <div class="admform" id='form'>

                </div>
                <div class="button-group">
                    <button class="button" type="submit" name="submit">Submit</button>
                    <button class="button" type="button" name="exit" onclick="loadAnotherForm()">Exit</button>
                </div>
            </form>
        </div>
        <p><c:out value="${message}" /></p>


        <script>
            $(document).ready(function () {
                $("#addQue").click(function () {
                    $("#form").load("AddQue.jsp");
                });
                $("#updtQue").click(function () {
                    $("#form").load("UpdateQue.jsp");
                });
                $("#showQue").click(function () {
                    $("#form").load("ShowQuestions.jsp");
                });
                $("#showRes").click(function () {
                    $("#form").load("ShowResponse.jsp");
                });

            });


            function loadAnotherForm() {
                // code to load another JSP form
                window.location.href = "index.html";
            }

        </script>


    </body>
</html>
