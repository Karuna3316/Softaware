<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="#" />
    <meta name="keywords"
        content="Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app" />
    <meta name="author" content="#" />
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="files/bower_components/bootstrap/dist/css/bootstrap.min.css" />
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="files/assets/icon/themify-icons/themify-icons.css" />
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="files/assets/icon/icofont/css/icofont.css" />
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="files/assets/css/style.css" />
    <link rel="stylesheet" type="text/css" href="css/custom.css" />
    <link rel="stylesheet" type="text/css" href="css/NewCustom.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/css/newStyleSheet.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/bootstrap/dist/css/edited-bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/j-pro/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/j-pro/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/j-pro/css/j-pro-modern.css" />
    <link rel="stylesheet" href="files/assets/css/style.css" />
    <link rel="stylesheet" href="files/bower_components/bootstrap/dist/css/edited-bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/icofont/css/icofont.css" />
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="files/assets/css/style.css" />
    <link rel="stylesheet" type="text/css" href="css/NewCustom.css" />


    <!-- jpro forms css -->
    <link rel="stylesheet" type="text/css" href="files/assets/pages/j-pro/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/j-pro/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/j-pro/css/j-pro-modern.css" />

    <link rel="stylesheet" type="text/css" href="files/assets/css/sweetalert.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.brighttheme.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.buttons.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.history.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.mobile.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/pnotify/notify.css" />
    <!-- Required Jquery -->
    <script type="text/javascript" src="files/bower_components/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="files/bower_components/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="files/bower_components/popper.js/dist/umd/popper.min.js"></script>
    <script type="text/javascript" src="files/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="files/bower_components/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="files/bower_components/modernizr/modernizr.js"></script>
    <script type="text/javascript" src="files/bower_components/modernizr/feature-detects/css-scrollbars.js"></script>
    <!-- i18next.min.js -->
    <script type="text/javascript" src="files/bower_components/i18next/i18next.min.js"></script>
    <script type="text/javascript"
        src="files/bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
    <script type="text/javascript"
        src="files/bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
    <script type="text/javascript" src="files/bower_components/jquery-i18next/jquery-i18next.min.js"></script>
    <script type="text/javascript" src="files/assets/js/common-pages.js"></script>

    <!-- sweet alert js -->
    <script type="text/javascript" src="files/assets/js/sweetalert.js"></script>
    <script type="text/javascript" src="files/assets/js/modal.js"></script>
    <!-- sweet alert modal.js intialize js -->

    <script src="js/knockout-3.3.0.js" type="text/javascript"></script>
    <script src="js/knockout.mapping-latest.js" type="text/javascript"></script>
    <script src="js/knockout.validation.js" type="text/javascript"></script>

    <!-- pnotify js -->
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.js"></script>
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.desktop.js"></script>
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.buttons.js"></script>
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.confirm.js"></script>
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.callbacks.js"></script>
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.animate.js"></script>
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.history.js"></script>
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.mobile.js"></script>
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.nonblock.js"></script>
    <script type="text/javascript" src="files/assets/pages/pnotify/notify.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            var objUrlParams = new URLSearchParams(window.location.search);
            var ToMailId = objUrlParams.get('ToMailId');
            if (ToMailId != null) {

                var decodedData = atob(ToMailId); // Decodes the base64 encoded string

                // Create a Uint8Array from the decoded data
                var byteArray = new Uint8Array(decodedData.length);
                for (var i = 0; i < decodedData.length; i++) {
                    byteArray[i] = decodedData.charCodeAt(i);
                }

                // Decode the UTF-8 byte array to a string
                var decoder = new TextDecoder('utf-8');
                var result = decoder.decode(byteArray);

                $('#EmailId').val(result);

            } else {
                $('#EmailId').val('');

            }

            $(".toggle-password").click(function () {
                $(this).toggleClass("fa-eye fa-eye-slash");
                input = $(this).parent().find("input");
                if (input.attr("type") == "password") {
                    input.attr("type", "text");
                } else {
                    input.attr("type", "password");
                }
            });
        });

        function sendRequest() {
            var isValid = false;

            var txtPassword = $('#txtPassword').val();
            var txtConfirmPassword = $('#txtConfirmPassword').val();


            if (hasValue("#EmailId", "#spanForgotEmail", "Cannot Update without Email ID") &&
                hasValue("#txtPassword", "#spanPassword", "Enter the Password") &&
                validatePassword(txtPassword) &&
                hasValue("#txtConfirmPassword", "#spanRetypePassword", "Enter the Retype Password") && (txtPassword == txtConfirmPassword))
                isValid = true;
            {
                isValid = isValid && validatePassword(txtPassword);

                if (isValid) {
                    var lsupObj = new ResetPassword();
                    lsupObj.NewPassword = $('#txtConfirmPassword').val();
                    lsupObj.EmailId = $('#EmailId').val();
                    $("#btnChangePWD").attr("disabled", true);

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "ForgetPassword.aspx/ResetPasswprd",
                        data: "{SupportObj : " + ko.toJSON(lsupObj) + "}",
                        dataType: "json",
                        success: function (data) {
                            if (data.d >= 0) {
                                var inserted = data.d;
                                if (inserted != null) {
                                    location.href = "Login.aspx?flagId=" + data.d;
                                }
                                else
                                    alert('failed to update');

                            }
                        },

                        error: function (response) {
                            alert(response.responseText);
                        },
                        failure: function (response) {
                            alert(response.responseText);
                        }
                    });
                } else {
                    validatePasswordOnKeyup();
                }
            }
            return isValid;
        }

        function hasValue(ctrlId, errDisplayCtrlId, errMsg) {

            var hasIt = true;
            if ($(ctrlId).val() == "") {
                hasIt = false;
                $(errDisplayCtrlId).text(errMsg);
                //$(ctrlId).focus();
            }
            else {
                $(errDisplayCtrlId).text('');

            }

            return hasIt;
        }

        function BackToList() {
            window.location = 'Login.aspx';
        }
    </script>

    <style>
        .btn {
            background: #009933;
        }

        .panel-info {
            border-color: #0ac282;
        }

            .panel-info > .panel-heading {
                color: #fff;
                background-color: #0ac282;
                border: 1px solid #0ac282;
            }

        .collapse.in {
            display: block;
        }

        form {
            padding: 35px;
        }

        .panel panel-info {
            background-color: #0ac282;
            border: 1px solid #0ac282;
        }

        .panel-body form-horizontal {
            padding: 60px;
        }

        .toggle-password {
            float: right;
            cursor: pointer;
            margin-right: 10px;
            margin-top: -30px;
            font-size: 22px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title" style="font-size: 20px;">FORGOT PASSWORD</h3>
            </div>
            <div id="panel-collapse-4" class="collapse in">
                <div class="panel-body form-horizontal" style="padding: 60px;">
                    <div class="col-sm-12">
                        <asp:Label ID="lblAlertPassword" runat="server" CssClass="label label-danger" EnableViewState="false" Visible="false"></asp:Label>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 control-label">Email ID</label>
                        <div class="col-sm-6">
                            <input type="text" id="EmailId" class="form-control" disabled />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 control-label">Password</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" ToolTip="Password" placeholder="Password" TextMode="Password" TabIndex="1" MaxLength="16" autocomplete="off"></asp:TextBox>
                            <i class="toggle-password fa fa-eye-slash"></i>
                            <p><span class="messages" id="passwordStrengthMsg" style="color: red; font-size: medium"></span></p>

                        </div>
                        <p class="help-block" id="passwordValidationMsg" style="color: red; font-size: 18px;"></p>

                        <div class="col-sm-3"><span class="messages" id="spanPassword" style="color: red; font-size: medium"></span></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3 control-label">Retype Password</div>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" ToolTip="Retype Password" placeholder="Retype Password" TextMode="Password" TabIndex="2" MaxLength="16" autocomplete="off"></asp:TextBox>
                            <i class="toggle-password fa fa-eye-slash" ></i>
                            <p class="help-block">
                                <asp:CompareValidator ForeColor="Red" ID="cmptxtConfirmPassword" runat="server" ErrorMessage="Retype Password not same as the Password." Display="Dynamic" SetFocusOnError="true" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ValidationGroup="valChangePassword" Type="String"></asp:CompareValidator>
                            </p>


                        </div>
                        <div class="col-sm-3"><span class="messages" id="spanRetypePassword" style="color: red; font-size: medium"></span></div>
                    </div>
                    <div class="col-sm-12" align="center">
                        <input type="button" class="btn btn-success f-w-100" style="width: 85px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnChangePWD" value="Submit" onclick="sendRequest()" />
                        <input type="button" class="btn btn-success f-w-100" style="width: 85px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnBack" value="Cancel" onclick="BackToList()" />
                    </div>
                </div>
            </div>
            <div class="col-sm-2"><span class="messages" id="spanForgotEmail" style="color: red; font-size: 15px;"></span></div>

        </div>
    </form>

  <script type="text/javascript">
      $(document).ready(function () {
          var passwordField = $('#txtPassword');
          var passwordValidationMsg = $('#passwordValidationMsg');
          var passwordStrengthMsg = $('#passwordStrengthMsg');
          $("#txtConfirmPassword").prop('disabled', true);
          passwordField.on('input', function () {
              var password = passwordField.val().trim();

              if (password.length === 0) {

                  passwordStrengthMsg.empty(); // Clear password strength message when password is empty
              }

              else {
                  passwordValidationMsg.empty(); // Clear password required error message
                  validatePassword(password);

              }

          });

      });

      function validatePassword(password) {
          var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&*()!+=_\-])[A-Za-z\d@#$%^&*()!+=_\-]{6,}$/;
          var isValid = passwordRegex.test(password);

          var passwordStrengthMsg = $('#passwordStrengthMsg');

          if (isValid) {
              passwordStrengthMsg.text('Password strength: Strong');
              passwordStrengthMsg.css('color', 'green');

          } else {
              passwordStrengthMsg.text('Password strength: Weak');
              passwordStrengthMsg.css('color', 'red');
          }
          var txtPassword = $('#txtPassword').val();
          if (txtPassword == null || txtPassword.trim() === "") {
              $('#passwordStrengthMsg').text('');
          }
          return isValid;
      }

      // Function to validate password on keyup
      function validatePasswordOnKeyup() {
          var password = document.getElementById("txtPassword").value;
          var spanPassword = document.getElementById("spanPassword");
          var confirmPasswordField = document.getElementById("txtConfirmPassword");

          // Enable the "Retype Password" field if the "Password" field has a value
          if (password.trim() !== "") {
              confirmPasswordField.disabled = false;
          } else {
              confirmPasswordField.disabled = true;
          }
          if (password.length === 0) {
              spanPassword.innerHTML = "Password is required";
              spanRetypePassword.innerHTML = "";

              return;
          }


          if (password.length < 6) {
              spanPassword.innerHTML = "Password must be atleast 6 characters long";
              spanRetypePassword.innerHTML = "";

          } else {
              spanPassword.innerHTML = "";
          }
          if (!/[A-Z]/.test(password)) {
              spanPassword.innerHTML += "<br>At least one uppercase letter";
              spanRetypePassword.innerHTML = "";

          }
          if (!/[a-z]/.test(password)) {
              spanPassword.innerHTML += "<br>At least one lowercase letter";
              spanRetypePassword.innerHTML = "";

          }
          if (!/[^A-Za-z0-9]/.test(password)) {
              spanPassword.innerHTML += "<br>At least one special character";
              spanRetypePassword.innerHTML = "";

          }
          if (!/\d/.test(password)) {
              spanPassword.innerHTML += "<br>At least one digit";
              spanRetypePassword.innerHTML = "";

          }

      }

      function validateRetypePasswordOnKeyup() {
          var ConfirmPassword = document.getElementById("txtConfirmPassword").value;
          var spanRetypePassword = document.getElementById("spanRetypePassword");

          if (ConfirmPassword.length === 0) {
              spanRetypePassword.innerHTML = "Retype Password Required";
              return;
          } else {
              spanRetypePassword.innerHTML = "";
          }


      }

      function toggleRetypePasswordField() {
          var password = document.getElementById("txtPassword").value;
          var confirmPasswordField = document.getElementById("txtConfirmPassword");

          // Enable the "Retype Password" field only when the "Password" field has a value
          if (password.trim() !== "") {
              confirmPasswordField.disabled = false;
          } else {
              confirmPasswordField.disabled = true;
          }
      }



      // Attach the validation function to the input field's "onkeyup" event

      document.getElementById("txtPassword").addEventListener("keyup", function () {
          validatePasswordOnKeyup();
      });

      document.getElementById("txtConfirmPassword").addEventListener("keyup", function () {
          validateRetypePasswordOnKeyup();
      });


  </script>

    
     <script type="text/javascript">
         var ResetPassword = function () {
             var self = this;
             self.NewPassword = ko.observable('');
             self.EmailId = ko.observable('');
         };
     </script>

</body>
</html>
