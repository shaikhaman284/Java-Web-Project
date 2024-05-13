

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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

            function loadAnotherForm2() {
                // code to load another JSP form
                window.location.href = "index.html";
            }
        </script>
    </head>
    <body onload="disableBack()">
        <div class="login_background">
            <h1 class="heading" style="font-size: 50px">Admin Login<i class="fa fa-cogs" style="font-size:30px;"></i></h1>
            <div class="form">
                <form action="AdmLogServlet" method="post">
                    <div class="button-container">
                        <input type="text" id="fname" placeholder="Admin Id" name="id" value="" required><br><br>

                        <input type="password" id="lname" placeholder="Password" name="pass" value="" required><br><br>

                        <input class="button" type="submit" value="Login">
                    </div>
                </form> 

            </div>
            <input class="button" type="button" name="exit" value="Exit" onclick="loadAnotherForm2()">    

        </div>
    </body>
</html>
