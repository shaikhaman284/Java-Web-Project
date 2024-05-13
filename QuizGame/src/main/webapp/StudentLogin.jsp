
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="style.css"/>

        <style>
            .login_background{
                background-image: linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)),url("img/login_bg.png");
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
        <title>JSP Page</title>
    </head>
    <body onload="disableBack()">


        <div class="login_background">

            <h1 class="heading" style='font-size: 50px'> Student Login <i class="fa fa-graduation-cap" style="font-size:30px;"></i></h1>

            <div class="form">
                <form action="StdLogServlet" method="post">        
                    <input type="text" id="email" placeholder="Email Id" name="email" value="" required><br>
                    <input type="password" id="password" placeholder="Password" name="password" value="" required ><br><br>
                    <div class="button-container">
                        <input class="button" type="submit" name = "Login" value="Login"><br> 
                        <a href="RegisterStudent.jsp" target="target">Not have an Account? Register Here!!!</a><br>
                        <input class="button" type="button" name="Register" value="Register Here" onclick="loadAnotherForm()"> 
                        <input class="button" type="button" name="exit" value="Exit" onclick="loadAnotherForm2()">
                    </div>
                </form> 

                <script>
                    function loadAnotherForm() {
                        // code to load another JSP form
                        window.location.href = "RegisterStudent.jsp";
                    }

                    function loadAnotherForm2() {
                        // code to load another JSP form
                        window.location.href = "index.html";
                    }
                </script>
                </body>
                </html>
