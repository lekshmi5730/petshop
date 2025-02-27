<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<style>
    #uni_modal .modal-content>.modal-footer, #uni_modal .modal-content>.modal-header {
        display: none;
    }
</style>

<div class="container-fluid">
    <div class="row">
        <h3 class="float-right">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </h3>
        <div class="col-lg-12">
            <h3 class="text-center">Login</h3>
            <hr>
            <form action="" id="login-form">
                <div class="form-group">
                    <label class="control-label">Email</label>
                    <input type="email" class="form-control form" name="email" required>
                </div>
                <div class="form-group">
                    <label class="control-label">Password</label>
                    <input type="password" class="form-control form" name="password" required>
                </div>
                <div class="form-group d-flex justify-content-between">
                    <a href="javascript:void()" id="create_account">Create Account</a>
                    <button class="btn btn-primary btn-flat">Login</button>
                </div>
            </form>
        </div>
    </div> 
</div>

<script>
    $(function() {
        // Email validation regex
        function validateEmail(email) {
            var re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            return re.test(String(email).toLowerCase());
        }

        // Validate login form fields
        function validateLoginForm() {
            let valid = true;
            let email = $('[name="email"]').val().trim();
            let password = $('[name="password"]').val().trim();

            $('.err-msg').remove(); // Clear previous error messages

            // Validate email
            if (!validateEmail(email)) {
                let _err_el = $('<div>')
                    .addClass("alert alert-danger err-msg")
                    .text("Please enter a valid email address.");
                $('[name="email"]').after(_err_el);
                valid = false;
            }

            // Validate password
            if (password === "") {
                let _err_el = $('<div>')
                    .addClass("alert alert-danger err-msg")
                    .text("Password cannot be empty.");
                $('[name="password"]').after(_err_el);
                valid = false;
            }

            return valid;
        }

        // Handle create account link click
        $('#create_account').click(function() {
            uni_modal("", "registration.php", "mid-large");
        });

        // Validate and submit the login form
        $('#login-form').submit(function(e) {
            e.preventDefault(); // Prevent default form submission

            if (validateLoginForm()) { // If form is valid
                start_loader();
                $.ajax({
                    url: _base_url_ + "classes/Login.php?f=login_user",
                    method: "POST",
                    data: $(this).serialize(),
                    dataType: "json",
                    error: function(err) {
                        console.log(err);
                        alert_toast("An error occurred", 'error');
                        end_loader();
                    },
                    success: function(resp) {
                        if (typeof resp === 'object' && resp.status === 'success') {
                            alert_toast("Login Successfully", 'success');
                            setTimeout(function() {
                                location.reload();
                            }, 2000);
                        } else if (resp.status === 'incorrect') {
                            let _err_el = $('<div>')
                                .addClass("alert alert-danger err-msg")
                                .text("Incorrect Credentials.");
                            $('#login-form').prepend(_err_el);
                            end_loader();
                        } else {
                            console.log(resp);
                            alert_toast("An error occurred", 'error');
                            end_loader();
                        }
                    }
                });
            }
        });
    });
</script>

</body>
</html>
