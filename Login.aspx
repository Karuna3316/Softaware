<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>LOGIN | FDSS</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="#" />
    <meta name="keywords" content="Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app" />
    <meta name="author" content="#" />
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="files/bower_components/bootstrap/dist/css/bootstrap.min.css" />
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="files/assets/icon/themify-icons/themify-icons.css" />
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="files/assets/icon/icofont/css/icofont.css" />
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="files/assets/css/style.css" />
    <link rel="icon" href="files/assets/images/FDSS_FAV.png" type="image/x-icon" />
    <!-- jpro forms css -->
    <link rel="stylesheet" type="text/css" href="files/assets/pages/j-pro/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/j-pro/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/j-pro/css/j-pro-modern.css" />

    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.brighttheme.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.buttons.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.history.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.mobile.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/pnotify/notify.css" />

    <link rel="stylesheet" type="text/css" href="files/assets/css/sweetalert.css" />
    <link href="css1/dist/css/util.css" rel="stylesheet" />
    <link href="css1/dist/css/main.css" rel="stylesheet" />



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

    <!-- sweet alert js -->
    <script type="text/javascript" src="files/assets/js/sweetalert.js"></script>
    <script type="text/javascript" src="files/assets/js/modal.js"></script>
    <!-- sweet alert modal.js intialize js -->

    <script src="js/knockout-3.3.0.js" type="text/javascript"></script>
    <script src="js/knockout.mapping-latest.js" type="text/javascript"></script>
    <script src="js/knockout.validation.js" type="text/javascript"></script>
    <script src="css1/dist/js/main.js"></script>


    <script type="text/javascript">

        $(document).ready(function () {
            var objUrlParams = new URLSearchParams(window.location.search);
            var flagId = objUrlParams.get('flagId');
            if (flagId == 2) {
                new PNotify({
                    title: 'Updated',
                    text: 'Password Updated Successfully...',
                    icon: 'icofont icofont-info-circle',
                    type: 'success'
                });
            }
            if (flagId == 3) {
                new PNotify({
                    title: 'Password Changed',
                    text: 'Password Changed Successfully...',
                    icon: 'icofont icofont-info-circle',
                    type: 'success'
                });
            }
            $("#Text1").keyup(function () {
                var txtUN = $(this).val();
                if (txtUN != '') {
                    $("#error").text("");

                }

            });

            $("#password1").keyup(function () {
                var txtPwd = $(this).val();
                if (txtPwd != '') {
                    $("#error1").text("");

                }

            });

            $('#password1').on("cut copy paste", function (e) {
                e.preventDefault();
            });

            $('#password1').bind("contextmenu", function (e) {
                return false;
            });
        });

        function chkFrDates() {
            var isV = false;
            var fD = $('#Text1');
            var eD = $('#password1');
            if (fD.val() == "" && eD.val() == "") {
                $('#error')[0].innerText = "Enter the Email ID";
                $('#error2')[0].innerText = "";
            }
            else if (fD.val() == "" && eD.val() != "") {
                $('#error')[0].innerText = "Enter the Email ID";
                $('#error2')[0].innerText = "";
            }
            else
                $('#error')[0].innerText = "";
            if (fD.val() != "" && eD.val() == "") {
                $('#error1')[0].innerText = "Enter the Password";
                $('#error2')[0].innerText = "";
            }
            else
                $('#error1')[0].innerText = "";
            if (fD.val() != "" && eD.val() != "")
                isV = true;
            if (isV)

                BindAccessTimings(fD.val(), eD.val());

            return isV;
        }
        function BindAccessTimings(username, password) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Login.aspx/BindAccessTimeValue",
                data: "{'username':'" + username + "','password':'" + password + "'}",
                dataType: "json",
                success: function (data) {
                    if (data.d.url != null) {

                        window.location.href = data.d.url;
                    }
                    else {

                        $('#error2')[0].innerText = "Enter the Correct Email ID and Password";

                    }
                },

                error: function (response) {
                    alert(response.responseText);
                },
                failure: function (response) {
                    alert(response.responseText);
                }
            });
        }

        function Forgetpassword() {
            $("#Forgetpassword").modal("show");
            $('#txtForgotEmail').val('');
            $('#spanForgotEmail').text('');
            $('#spanForgot').text('');

        }
        function modalCancel() {
            $("#Forgetpassword").modal("hide");
            $('#txtForgotEmail').val('');
            $('#spanForgotEmail').text('');
            $('#spanForgot').text('');
        }

        function sendRequest(event) {
            event.preventDefault();
            var isValid = true;
            isValid = isValid && hasValue("#txtForgotEmail", "#spanForgotEmail", "Enter the Email ID");
            isValid = isValid && ValidateEmail();
            if (isValid) {
                var lsupObj = new ForgetPassword();
                lsupObj.EmailId = $('#txtForgotEmail').val();
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Login.aspx/SendRequest",
                    data: "{SupportObj : " + ko.toJSON(lsupObj) + "}",
                    dataType: "json",
                    success: function (data) {
                        if (data.d >= 0) {
                            var inserted = data.d;
                            if (inserted != null) {
                                if (inserted == 1) {

                                    new PNotify({
                                        title: 'Notification',
                                        text: 'Please check your Email',
                                        icon: 'icofont icofont-info-circle',
                                        type: 'success'
                                    });
                                    $("#Forgetpassword").modal("hide");

                                }
                                if (inserted == 0) {
                                    $('#spanForgotEmail')[0].innerText = "You are not an authorized User";
                                }
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

        function ValidateEmail() {
            var EmailId = document.getElementById("txtForgotEmail").value;
            var spanForgot = document.getElementById("spanForgotEmail");
            spanForgot.innerHTML = "";
            var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            if (!expr.test(EmailId)) {
                spanForgot.innerHTML = "Invalid Email Address"
                return false;
            }
            return true;

        }

    </script>
    <%-- Login Using Onclick and Enter--%>
    <script>
        function handleButtonClick() {
            chkFrDates();
        }

        document.addEventListener('DOMContentLoaded', function () {
            document.addEventListener('keydown', function (event) {
                if (event.key === 'Enter') {
                    event.preventDefault();
                    handleButtonClick();
                }
            });

            document.querySelector('.primary-btn').addEventListener('click', handleButtonClick);
        });
    </script>
    <style>
        .login-block {
            padding: 30px 0;
            margin: 0 auto;
            min-height: 100vh;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
        }

        body {
            background-image: url("images/Login.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: top;
        }

        .single-input {
            width: 284px;
            border: 1px solid #c1c1c1;
            display: flex;
            margin-bottom: 28px;
            border-radius: 2px;
            margin-left: 13px;
            background: #fff;
        }

        button:focus {
            border: none;
            outline: 0;
        }

        .single-input i {
            padding: 8px 16px;
            color: #54c0c3;
        }

        .single-input input {
            border: 0px solid #c1c1c1;
            width: 100%;
            outline: none;
            border-radius: 15px;
            height: 30px;
            font-size: 18px;
        }

        .submit-btn {
            border: 0px solid #c1c1c1;
            margin-top: 30px;
        }

            .submit-btn input {
                background: #0cd6a8;
                color: #fff;
                cursor: pointer;
            }

        .login-block .auth-box {
            margin: 20px auto 0 auto;
            max-width: 335px;
            background-color: #f7f7f79e;
            padding-top: 10px;
            border-radius: 2px;
            height: 210px;
        }

        .btn {
            width: 30%;
            background: #0ac282;
            border: 1px solid #0ac282;
            border-radius: 2px;
        }

        .btn-primary:hover {
            color: #fff;
            background-color: #54c0c3;
            border-color: #54c0c3;
        }



        /*# Phone*/
        @media only screen and (max-width:320px) {
            body {
                background-image: url("images/Login01.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-position: top;
            }
        }

        /*# Tablet*/
        @media only screen and (min-width:321px) and (max-width:768px) {
            body {
                background-image: url("images/Login01.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-position: top;
            }
        }

        /*# Desktop*/
        @media only screen and (min-width:769px) {
            body {
                background-image: url("images/Login01.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-position: top;
            }
        }
        /*# Mobile*/
        @media only screen and (min-width: 480px) {
            body {
                background-image: url("images/Login01.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-position: top;
            }
        }

        /*# Tablet*/
        @media only screen and (min-width: 768px) {
            body {
                background-image: url("images/Login.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-position: top;
            }
        }

        hr {
            margin-top: 0rem;
            width: 113%;
            margin-bottom: 0rem;
            margin-left: -20px;
            border: 0;
            border-top: 1px dashed #118d919c;
        }

        #error {
            color: red;
            transform: translate(8px, 0px);
            position: absolute;
            line-height: 30px;
        }

        #error1 {
            color: red;
            transform: translate(8px, 8px);
            position: absolute;
        }


        #error2 {
            color: red;
            transform: translate(8px, -9px);
            position: absolute;
            font-size: 14px;
            padding-top: 17px;
        }


        p:hover {
            color: #009933;
            text-decoration-color: #54c0c3;
            font-size: 16px;
        }

        .sweet-alert p {
            color: #000;
            text-decoration: none;
        }


        @media (max-width: 375px) {
            .modal-content {
                width: 383px;
                border: 2px solid #ffffff59;
                border-radius: 0 !important;
                top: 280px !important;
                left: -10px !important;
                background-color: #ececec;
            }
        }

        .close {
            text-shadow: unset !important;
            opacity: 1;
            color: #fff !important;
            padding-top: 5px !important;
        }

            .close:hover {
                color: #fff;
            }


        .modal-content {
            width: 390px;
            border: 2px solid #009933;
            border-radius: 10px !important;
            top: 280px !important;
            left: 30px !important;
        }

        .modal-header {
            border-radius: 0 !important;
            height: 62.5px;
            background: #009933;
            width: 386px;
        }

            .modal-header h5 {
                vertical-align: middle;
                height: 100%;
                color: #fff;
                width: 90%;
                text-transform: uppercase;
            }

        .modal-body {
            height: 360px;
        }

        .modal-header .close {
            padding: 12px 9px;
            margin: -6px -19px -5px 0px;
            font-size: 25px;
        }

        .container-fluid {
            width: 100%;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
        }

        .col-sm-6 {
            flex: 0 0 50%;
            max-width: 50%;
        }

        @media (max-width: 768px) {
            .col-sm-6 {
                flex: 0 0 100%;
                max-width: 100%;
            }
        }


        .input100 {
            width: 100%;
            box-sizing: border-box;
        }

        .container-login100-form-btn {
            width: 100%;
        }


        @media (max-width: 576px) {
            .offset-md-6 {
                margin-left: 0;
            }
        }

        @media (max-width: 768px) {
            .login-block {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <section class="login-block">
        <!-- Container-fluid starts -->
        <div class="container-fluid" style="user-select: none;">
            <div class="row">

                <div class="col-sm-6 offset-md-6" style="align-content: center;">
                    <!-- Authentication card start -->
                    <div class="center-block" style="padding: 0px 0px 0px 180px;">
                        <form class="login100-form validate-form" onsubmit="sendRequest(event)">
                            <span class="login100-form-title" >Login
                            </span>

                            <div class="wrap-input100 validate-input">
                                <input class="input100" type="text" name="email" id="Text1" placeholder="Email id" required="">
                                <span class="focus-input100"></span>
                                <span class="symbol-input100">
                                    <i class="icofont icofont-ui-user" aria-hidden="true"></i>
                                </span>
                                <span class="form-bar" id="error" style="color: red;"></span>
                            </div>

                            <div class="wrap-input100 validate-input">
                                <input class="input100" type="password" name="pass" id="password1" placeholder="Password" required="">
                                <span class="focus-input100"></span>
                                <span class="symbol-input100">
                                    <i class="fa fa-lock" aria-hidden="true"></i>
                                </span>
                                <span class="form-bar" id="error1" style="color: red;"></span>
                                <span class="form-bar" style="color: red;" id="error2"></span>
                            </div>

                            <div class="container-login100-form-btn" style="padding: 10px;">
                                <button class="login100-form-btn " type="button" value="signin" onclick="return chkFrDates(); ">Login</button>
                            </div>

                            <div class="text-center p-t-12">
                                <span class="txt1" onclick="Forgetpassword()" style="color: #000; cursor: pointer; font-size: 15px;">Forgot Password?
                                </span>

                            </div>


                        </form>
                    </div>

                    <div id="Forgetpassword" class="modal" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" style="width: 100%; text-align: center; color: #fff;">Forgot Password</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true" style="color: white; text-align: left;">×</span>
                                    </button>
                                </div>


                                <div class="modal-body" style="height: 170px;">
                                    <div class="card" style="margin-left: -10px; background: none; border: none;">
                                        <div class="card-block" style="background: none; border: none;">
                                            <div class="form-group row" style="width: 100%;">
                                                <div class="col-sm-2 col-form-label" style="color: #fff; font-size: 18px; color: black;"></div>
                                                <div class="col-sm-10" style="margin-left: -30px; text-align: left">

                                                    <input class="form-control" type="text" id="txtForgotEmail" placeholder="Email Id" style="width: 110%;" autocomplete="off" maxlength="50" onkeyup="ValidateEmail()" />
                                                </div>
                                            </div>
                                            <div class="form-group row" style="width: 100%; margin-top: 10px;">
                                                <div class="col-sm-2"></div>
                                                <div class="col-sm-10" style="margin-left: -5px; padding-bottom: 13px; flex-item-align: center;">


                                                    <center>
                                                        <button type="submit" class="btn btn-success f-w-100 " style="font-family: Segoe UI;" id="btnSubmit" onclick="sendRequest(event)">Submit</button>
                                                        <button type="submit" class="btn btn-success f-w-100 " id="btnBack" style="font-family: Segoe UI;" value="" onclick="return modalCancel();">Cancel</button>
                                                    </center>
                                                </div>
                                                <span class="form-bar" id="spanForgotEmail" style="color: red; font-size: 15px; margin-left: 40px;"></span>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end of form -->

            </div>
            <!-- end of col-sm-12 -->
        </div>
        <!-- end of container-fluid -->
    </section>
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
    <script type="text/javascript" src="files/bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
    <script type="text/javascript" src="files/bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
    <script type="text/javascript" src="files/bower_components/jquery-i18next/jquery-i18next.min.js"></script>
    <script type="text/javascript" src="files/assets/js/common-pages.js"></script>
    <script type="text/javascript">
        var ForgetPassword = function () {
            var self = this;
            self.EmailId = ko.observable('');

        };
    </script>
</body>
</html>

