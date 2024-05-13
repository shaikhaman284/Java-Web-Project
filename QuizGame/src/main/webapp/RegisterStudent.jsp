

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css"/>
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
            <div class="form">
                <form id="myForm">

                    <input type="text" id="name" placeholder="Name" name="name" required>

                    <input type="text" id="clgname" placeholder="College Name" name="clgname" required>

                    <input type="tel" id="monum" placeholder="Mobile No." name="monum" maxlength="11" required>

                    <input type="email" id="email" placeholder="Email Id" name="email" required>

                    <label>Select Gender: </label>
                    <input class="gender" type="radio" id="male" name="gender" value="Male" required><label for="male">Male</label>
                    <input class="gender" type="radio" id="female" name="gender" value="Female" required><label for="female">Female</label>

                    <input type="password" id="password" placeholder="Password" name="password" maxlength="10" required>

                    <input type="password" id="confirm-password" placeholder="Confirm Password" name="confirm-password" required>

                    <input class="button" type="submit" value="Register"><br>

                    <label>Already have an Account</label><br>
                    <input class="button" type="button" value="Log In" onclick="loadAnotherForm()">
                </form>
            </div>
        </div>

        <script>
            document.getElementById("myForm").addEventListener("submit", function (event) {
                event.preventDefault();
                var password = document.getElementById("password").value;
                var confpassword = document.getElementById("confirm-password").value;
                var number = document.getElementById("monum").value;

                if (password !== confpassword) {
                    alert("Passwords not matched!");
                    return;
                }
                if (number.length < 10) {
                    alert("Enter a valid number");
                    return;
                }

                document.getElementById("myForm").action = "RegServlet";
                document.getElementById("myForm").submit();
            });


            function loadAnotherForm() {
                // code to load another JSP form
                window.location.href = "StudentLogin.jsp";
            }

            const input = document.getElementById("monum");
            input.addEventListener("input", function () {
                input.value = input.value.replace(/[^0-9.]/g, "");
            });

            const input2 = document.getElementById("name");
            input2.addEventListener("input", function () {
                input2.value = input2.value.replace(/[^a-zA-Z\s]/g, "");
            });
        </script>

    </body>
</html>
