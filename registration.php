<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container-fluid">
    <form action="" id="registration">
        <div class="row">
            <h3 class="text-center">Create New Account
                <span class="float-right">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </span>
            </h3>
            <hr>
        </div>
        <div class="row align-items-center h-100">
            <div class="col-lg-5 border-right">
                <div class="form-group">
                    <label class="control-label">Firstname</label>
                    <input type="text" class="form-control form-control-sm form" name="firstname" required>
                </div>
                <div class="form-group">
                    <label class="control-label">Lastname</label>
                    <input type="text" class="form-control form-control-sm form" name="lastname" required>
                </div>
                <div class="form-group">
                    <label class="control-label">Contact</label>
                    <input type="text" class="form-control form-control-sm form" name="contact" required>
                </div>
                <div class="form-group">
                    <label class="control-label">Gender</label>
                    <select name="gender" class="custom-select select" required>
                        <option>Male</option>
                        <option>Female</option>
                    </select>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="form-group">
                    <label class="control-label">Default Delivery Address</label>
                    <textarea class="form-control form" rows="3" name="default_delivery_address" required></textarea>
                </div>
                <div class="form-group">
                    <label class="control-label">Email</label>
                    <input type="text" class="form-control form-control-sm form" name="email" required>
                </div>
                <div class="form-group">
                    <label class="control-label">Password</label>
                    <input type="password" class="form-control form-control-sm form" name="password" required>
                </div>
                <div class="form-group d-flex justify-content-between">
                    <a href="javascript:void()" id="login-show">Already have an Account</a>
                    <button class="btn btn-primary btn-flat">Register</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
$(function() {
    // Email validation regex (RFC 5322 compliant)
    function validateEmail(email) {
        var re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        return re.test(String(email).toLowerCase());
    }

    // Contact validation (only digits and specific length)
    function validateContact(contact) {
        var re = /^[0-9]{10,15}$/;
        return re.test(String(contact));
    }

    // Password validation (strong password rules)
    function validatePassword(password) {
        var re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        return re.test(password);
    }

    // Validate form fields
    function validateForm() {
        var valid = true;
        var firstname = $('[name="firstname"]').val().trim();
        var lastname = $('[name="lastname"]').val().trim();
        var email = $('[name="email"]').val().trim();
        var contact = $('[name="contact"]').val().trim();
        var password = $('[name="password"]').val().trim();
        var address = $('[name="default_delivery_address"]').val().trim();

        $('.err-msg').remove(); // Clear previous error messages

        // Validate firstname
        if (!firstname || !/^[a-zA-Z\s-]{2,50}$/.test(firstname)) {
            var _err_el = $('<div>').addClass("alert alert-danger err-msg").text("Please enter a valid first name (2-50 alphabetic characters).");
            $('[name="firstname"]').after(_err_el);
            valid = false;
        }

        // Validate lastname
        if (!lastname || !/^[a-zA-Z\s-]{2,50}$/.test(lastname)) {
            var _err_el = $('<div>').addClass("alert alert-danger err-msg").text("Please enter a valid last name (2-50 alphabetic characters).");
            $('[name="lastname"]').after(_err_el);
            valid = false;
        }

        // Validate email
        if (!validateEmail(email)) {
            var _err_el = $('<div>').addClass("alert alert-danger err-msg").text("Please enter a valid email address.");
            $('[name="email"]').after(_err_el);
            valid = false;
        }

        // Validate contact
        if (!validateContact(contact)) {
            var _err_el = $('<div>').addClass("alert alert-danger err-msg").text("Please enter a valid contact number (10-15 digits).");
            $('[name="contact"]').after(_err_el);
            valid = false;
        }

        // Validate password
        if (!validatePassword(password)) {
            var _err_el = $('<div>').addClass("alert alert-danger err-msg").text("Password must be at least 8 characters long, including an uppercase letter, a lowercase letter, a number, and a special character.");
            $('[name="password"]').after(_err_el);
            valid = false;
        }

        // Validate address
if (address.length < 10) {
    var _err_el = $('<div>').addClass("alert alert-danger err-msg").text("Delivery address must be at least 10 characters long.");
    $('[name="default_delivery_address"]').after(_err_el);
    valid = false;
} else if (!/^[a-zA-Z0-9\s,.-]*$/.test(address)) {  // Only alphanumeric characters, spaces, commas, periods, and dashes allowed
    var _err_el = $('<div>').addClass("alert alert-danger err-msg").text("Delivery address can only contain letters, numbers, spaces, commas, periods, and dashes.");
    $('[name="default_delivery_address"]').after(_err_el);
    valid = false;
}


        return valid;
    }

    // Validate and submit the form
    $('#registration').submit(function(e) {
        e.preventDefault(); // Prevent form submission

        if (validateForm()) {
            start_loader();
            $.ajax({
                url: _base_url_ + "classes/Master.php?f=register",
                method: "POST",
                data: $(this).serialize(),
                dataType: "json",
                error: err => {
                    console.log(err);
                    alert_toast("An error occurred", 'error');
                    end_loader();
                },
                success: function(resp) {
                    if (typeof resp === 'object' && resp.status === 'success') {
                        alert_toast("Account successfully registered", 'success');
                        setTimeout(function() {
                            location.reload();
                        }, 2000);
                    } else if (resp.status === 'failed' && !!resp.msg) {
                        var _err_el = $('<div>').addClass("alert alert-danger err-msg").text(resp.msg);
                        $('[name="password"]').after(_err_el);
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
