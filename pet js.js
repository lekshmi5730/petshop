<script>
    $(function(){
        // Email validation regex
        function validateEmail(email) {
            var re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            return re.test(String(email).toLowerCase());
        }

        // Contact validation (only digits and reasonable length)
        function validateContact(contact) {
            var re = /^[0-9]{10,15}$/; // Adjust the length as necessary
            return re.test(String(contact));
        }

        // Validate form fields
        function validateForm() {
            var valid = true;
            var firstname = $('[name="firstname"]').val().trim();
            var lastname = $('[name="lastname"]').val().trim();
            var email = $('[name="email"]').val().trim();
            var contact = $('[name="contact"]').val().trim();
            var password = $('[name="password"]').val().trim();

            $('.err-msg').remove(); // Clear previous error messages

            // Validate firstname
            if (!firstname || /[0-9]/.test(firstname)) {
                var _err_el = $('<div>').addClass("alert alert-danger err-msg").text("Please enter a valid first name.");
                $('[name="firstname"]').after(_err_el);
                valid = false;
            }

            // Validate lastname
            if (!lastname || /[0-9]/.test(lastname)) {
                var _err_el = $('<div>').addClass("alert alert-danger err-msg").text("Please enter a valid last name.");
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
                var _err_el = $('<div>').addClass("alert alert-danger err-msg").text("Please enter a valid contact number.");
                $('[name="contact"]').after(_err_el);
                valid = false;
            }

            // Validate password
            if (password.length < 6) {
                var _err_el = $('<div>').addClass("alert alert-danger err-msg").text("Password must be at least 6 characters long.");
                $('[name="password"]').after(_err_el);
                valid = false;
            }

            return valid;
        }

        $('#login-show').click(function(){
            uni_modal("","login.php")
        });

        // Validate and submit the form
        $('#registration').submit(function(e){
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
                    success: function(resp){
                        if (typeof resp == 'object' && resp.status == 'success') {
                            alert_toast("Account successfully registered", 'success');
                            setTimeout(function(){
                                location.reload();
                            }, 2000);
                        } else if (resp.status == 'failed' && !!resp.msg) {
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
