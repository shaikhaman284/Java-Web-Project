   
<label for="title" class='title'>User Response</label>

<form id="emailForm">
    <input class="email" type="email" id="emailInput" name="email" style="width: 40%" required>
    <button class="button" type="button" id="loadInfoButton">Load User Response</button>
</form>
<div class="userInfo" id="userInfo"></div>

<script>
    $(document).ready(function () {
        $("#loadInfoButton").click(function () {
            const email = $("#emailInput").val();

            // Make an AJAX request to retrieve user-specific information
            $.ajax({
                type: "GET",
                url: "UserResponse.jsp",
                data: {email: email},
                success: function (response) {
                    // Display the email-specific information in the 'userInfo' div
                    $("#userInfo").html(response);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error("Error occurred: " + textStatus, errorThrown);
                }
            });
        });
    });
</script>


