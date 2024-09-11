<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Style.css Start -->

    <link rel="stylesheet" href="files/assets/pages/chart/radial/css/radial.css" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/custom.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/css/style.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/css/jquery.mCustomScrollbar.css" />
    <!-- feather Awesome -->
    <link rel="stylesheet" type="text/css" href="files/assets/icon/feather/css/feather.css " />

    <script type="text/javascript" src="files/bower_components/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="files/bower_components/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="files/bower_components/popper.js/dist/umd/popper.min.js"></script>
    <script type="text/javascript" src="files/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!--Knockout Script-->
    <script src="js/knockout-3.3.0.js" type="text/javascript"></script>
    <script src="js/knockout.mapping-latest.js" type="text/javascript"></script>
    <script src="js/knockout.validation.js" type="text/javascript"></script>

    <!-- feather Awesome -->
    <link rel="stylesheet" type="text/css" href="files/assets/icon/feather/css/feather.css " />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/ion-icon/css/ionicons.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/icofont/css/icofont.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/simple-line-icons/css/simple-line-icons.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/css/sweetalert.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/material-design/css/material-design-iconic-font.min.css" />

    <style>
        .toggle-password {
            float: right;
            cursor: pointer;
            margin-right: 10px;
            margin-top: -30px;
            font-size: 22px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row the-box transparent">
        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">CHANGE PASSWORD</h3>
            </div>
            <div id="panel-collapse-4" class="collapse in">
                <div class="panel-body form-horizontal" style="padding: 60px;">
                    <div class="col-sm-12">
                        <asp:Label ID="lblAlertPassword" runat="server" CssClass="label label-danger" EnableViewState="false" Visible="false"></asp:Label>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3 control-label" style="font-size: 16px;">Password</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" ToolTip="Password" placeholder="Password" TextMode="Password" TabIndex="1" MaxLength="16" autocomplete="off"></asp:TextBox>
                            <i class="toggle-password fa fa-eye-slash"></i>
                            <p><span class="messages" id="passwordStrengthMsg" style="color: red; font-size: medium"></span></p>

                        </div>
                        <p class="help-block" id="passwordValidationMsg" style="color: red; font-size: 18px;"></p>

                        <div class="col-sm-3"><span class="messages" id="spanPassword" style="color: red; font-size: medium"></span></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3 control-label" style="font-size: 16px;">Retype Password</div>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" ToolTip="Retype Password" placeholder="Retype Password" TextMode="Password" TabIndex="2" MaxLength="16" autocomplete="off"></asp:TextBox>
                            <i class="toggle-password fa fa-eye-slash"></i>
                            <p class="help-block">
                                <asp:CompareValidator ForeColor="Red" ID="cmptxtConfirmPassword" runat="server" ErrorMessage="Retype Password not same as the Password." Display="Dynamic" SetFocusOnError="true" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ValidationGroup="valChangePassword" Type="String"></asp:CompareValidator>
                            </p>


                        </div>
                        <div class="col-sm-3"><span class="messages" id="spanRetypePassword" style="color: red; font-size: medium"></span></div>
                    </div>
                    <div class="col-sm-12" align="center">
                        <input type="button" class="btn btn-success f-w-100" style="width: 85px; height: auto; margin-top: -3px; background: #009933; border-radius: 2px; cursor: pointer; padding: 4px 11px;" id="btnChangePWD" value="Submit" onclick="sendRequest()" />
                        <input type="button" class="btn btn-success f-w-100" style="width: 85px; height: auto; margin-top: -3px; background: #009933; border-radius: 2px; cursor: pointer; padding: 4px 11px;" id="btnBack" value="Cancel" onclick="BackToList()" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            var passwordField = $('#<%= txtPassword.ClientID %>');
            var passwordValidationMsg = $('#passwordValidationMsg');
            var passwordStrengthMsg = $('#passwordStrengthMsg');
            var confirmPasswordField = $('#<%= txtConfirmPassword.ClientID %>');

            confirmPasswordField.prop('disabled', true);

            passwordField.on('input', function () {
                var password = passwordField.val().trim();

                if (password.length === 0) {
                    passwordStrengthMsg.empty(); // Clear password strength message when password is empty
                } else {
                    passwordValidationMsg.empty(); // Clear password required error message
                    validatePassword(password);
                }
            });

            // Attach the validation function to the input field's "keyup" event
            $("#<%= txtPassword.ClientID %>").on("keyup", function () {
                validatePasswordOnKeyup();
            });

            // Attach the validation function to the input field's "keyup" event
            $("#<%= txtConfirmPassword.ClientID %>").on("keyup", function () {
                validateRetypePasswordOnKeyup();
            });

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

        function validatePassword(password) {
            var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&*()!+=_\-])[A-Za-z\d@#$%^&*()!+=_\-]{6,}$/;
            var isValid = passwordRegex.test(password);
            var passwordStrengthMsg = $('#passwordStrengthMsg');

            if (isValid) {
                passwordStrengthMsg.text('Password strength: Strong').css('color', 'green');
            } else {
                passwordStrengthMsg.text('Password strength: Weak').css('color', 'red');
            }

            var txtPassword = $('#<%= txtPassword.ClientID %>').val();
            if (txtPassword == null || txtPassword.trim() === "") {
                passwordStrengthMsg.text('');
            }
            return isValid;
        }

        function validatePasswordOnKeyup() {
            var password = $("#<%= txtPassword.ClientID %>").val();
            var spanPassword = $("#spanPassword");
            var spanRetypePassword = $("#spanRetypePassword");
            var confirmPasswordField = $("#<%= txtConfirmPassword.ClientID %>");

            confirmPasswordField.prop('disabled', password.trim() === "");

            if (password.length === 0) {
                spanPassword.text("Password is required");
                spanRetypePassword.text("");
                return;
            }

            spanPassword.text(password.length < 6 ? "Password must be at least 6 characters long" : "");

            if (!/[A-Z]/.test(password)) {
                spanPassword.append("<br>At least one uppercase letter");
            }
            if (!/[a-z]/.test(password)) {
                spanPassword.append("<br>At least one lowercase letter");
            }
            if (!/[^A-Za-z0-9]/.test(password)) {
                spanPassword.append("<br>At least one special character");
            }
            if (!/\d/.test(password)) {
                spanPassword.append("<br>At least one digit");
            }
            spanRetypePassword.text("");
        }

        function validateRetypePasswordOnKeyup() {
            var confirmPassword = $("#<%= txtConfirmPassword.ClientID %>").val();
            var spanRetypePassword = $("#spanRetypePassword");

            if (confirmPassword.length === 0) {
                spanRetypePassword.text("Retype Password Required");
            } else {
                spanRetypePassword.text("");
            }
        }

        function sendRequest() {
            var isValid = true;

            var txtPassword = $('#<%= txtPassword.ClientID %>').val();
            var txtConfirmPassword = $('#<%= txtConfirmPassword.ClientID %>').val();

            isValid = hasValue("#<%= txtPassword.ClientID %>", "#spanPassword", "Enter the Password") &&
                validatePassword(txtPassword) &&
                hasValue("#<%= txtConfirmPassword.ClientID %>", "#spanRetypePassword", "Enter the Retype Password") &&
                (txtPassword == txtConfirmPassword);

            if (isValid) {
                var NewPassword = $('#<%= txtConfirmPassword.ClientID %>').val();

                var dataToSend = {
                    newPwd: NewPassword
                };
                $("#btnChangePWD").attr("disabled", true);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "ChangePassword.aspx/ChangeCurrentPassword",
                    data: JSON.stringify(dataToSend),
                    dataType: "json",
                    success: function (data) {
                        if (data.d >= 0) {
                            var inserted = data.d;
                            if (inserted != null) {
                                location.href = "Login.aspx?flagId=3";
                            } else {
                                alert('failed to update');
                            }
                        }
                    },
                    error: function (response) {
                        alert(response.responseText);
                    }
                });
            } else {
                validatePasswordOnKeyup();
            }

            return isValid;
        }

        function hasValue(ctrlId, errDisplayCtrlId, errMsg) {
            var hasIt = true;
            var ctrlValue = $(ctrlId).val();

            if (ctrlValue === "") {
                hasIt = false;
                $(errDisplayCtrlId).text(errMsg);
            } else {
                $(errDisplayCtrlId).text('');
            }

            return hasIt;
        }

        function BackToList() {
            window.location = 'Dashboard.aspx';
        }
    </script>

</asp:Content>

