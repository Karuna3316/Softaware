<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="UserMaster.aspx.cs" Inherits="UserMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Style.css Start -->
    <link rel="stylesheet" type="text/css" href="files/bower_components/datatables.net-bs4/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/data-table/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/data-table/extensions/buttons/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" href="files/assets/pages/chart/radial/css/radial.css" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/custom.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/css/style.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/css/jquery.mCustomScrollbar.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/css/sweetalert.css" />
    <!-- feather Awesome -->
    <link rel="stylesheet" type="text/css" href="files/assets/icon/feather/css/feather.css " />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/ion-icon/css/ionicons.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/icofont/css/icofont.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/simple-line-icons/css/simple-line-icons.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/css/sweetalert.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/material-design/css/material-design-iconic-font.min.css" />
    <!-- Select 2 css -->
    <link rel="stylesheet" href="files/bower_components/select2/dist/css/select2.min.css" />
    <!-- Multi Select css -->
    <link rel="stylesheet" type="text/css"
        href="files/bower_components/bootstrap-multiselect/dist/css/bootstrap-multiselect.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/multiselect/css/multi-select.css" />
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="files/assets/css/style.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/css/jquery.mCustomScrollbar.css" />

    <script type="text/javascript">
        $(document).ready(function () {
            var objUrlParams = new URLSearchParams(window.location.search);
            var userId = objUrlParams.get('userId');
            if (userId != null) {
                BindUserMaster(userId)
            }
            else {
                fnBindDesignation(0);
                fnBindRoleName(0);
            }
            $("#BindRole").change(function () {
                var X = $(this).val();
                if (X > 0) {
                    $("#spanRole").text("");
                }
            });
            $("#Designation").change(function () {
                var X = $(this).val();
                if (X > 0) {
                    $("#spanDes").text("");
                }
            });
            $("#txtDOB").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-90:+0",
                yearRange: '1924:' + (new Date).getFullYear()

            });

            $("#txtDOJ").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: false,
                changeYear: false,
                yearRange: '1924:' + (new Date).getFullYear()

            });

            $('#txtEmailId').prop('readonly', true);
            $('#txtEmp').prop('readonly', true);

            setTimeout(function () {
                $('#txtEmailId').prop('readonly', false);
                $('#txtEmp').prop('readonly', false);
            }, 1000);


            $('.toggle-password').click(function () {
                $(this).toggleClass("fa-eye fa-eye-slash");
                // Find the password input field
                var passwordField = $('#txtPwd');

                // Toggle the password visibility
                if (passwordField.attr('type') === 'password') {
                    passwordField.attr('type', 'text');
                } else {
                    passwordField.attr('type', 'password');
                }
            });

            var max = 500;
            var el = document.getElementById('txtEmp');

            $('#txtEmp').keypress(function (event) {
                var Length = $("#txtEmp").val().length;
                var AmountLeft = max - Length;
                $('#txtEmp-length-left').html(AmountLeft);
                if (Length >= max) {
                    if (event.which != 8) {
                        $('#spanEmpName').text('Only Allowed 500 Characters');

                        return false;
                    }
                } else {
                    $('#spanEmpName').text('');
                    el.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {

                            $('#spanEmpName').html('');
                        }

                    });
                }


            });

            var maxLength3 = 50;
            var elc = document.getElementById('txtEmailId');

            $('#txtEmailId').keypress(function (event) {
                var Length = $("#txtEmailId").val().length;
                var AmountLeft = maxLength3 - Length;
                $('#txtEmailId-length-left').html(AmountLeft);
                if (Length >= maxLength3) {
                    if (event.which != 8) {
                        $('#spanEId1').text(' Only Allowed 50 Characters');

                        return false;
                    }
                } else {
                    $('#spanEId1').text('');
                    elc.addEventListener('keydown', function (event) {
                        // Checking for Backspace.
                        if (event.keyCode == 8) {
                            $('#spanEId1').html('');
                        }

                    });
                }


            });

            var maxLength4 = 50;
            var elD = document.getElementById('txtPwd');

            $('#txtPwd').keypress(function (event) {
                var Length = $("#txtPwd").val().length;
                var AmountLeft = maxLength4 - Length;
                $('#txtPwd-length-left').html(AmountLeft);
                if (Length >= maxLength4) {
                    if (event.which != 8) {
                        $('#spanPwd').text(' Only Allowed 50 Characters');

                        return false;
                    }
                } else {
                    $('#spanPwd').text('');
                    elD.addEventListener('keydown', function (event) {
                        // Checking for Backspace.
                        if (event.keyCode == 8) {
                            $('#spanPwd').html('');
                        }

                    });
                }


            });

            $("#txtEmp").keyup(function () {
                var txtconsumablename = $(this).val();
                if (txtconsumablename != '') {
                    $("#spanEmpName").text("");

                }

            });

            $("#txtEmailId").keyup(function () {
                var txtconsumablename = $(this).val();
                if (txtconsumablename != '') {
                    $("#spanEId").text("");

                }

            });

            $("#txtPwd").keyup(function () {
                var txtconsumablename = $(this).val();
                if (txtconsumablename != '') {
                    $("#spanPwd").text("");

                }

            });

            $("#txtPho").keyup(function () {
                var txtconsumablename = $(this).val();
                if (txtconsumablename != '') {
                    $("#spanPho").text("");

                }

            });
        });


        function fnBindDesignation(DES) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "UserMaster.aspx/designation",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    $("#Designation").html("");
                    $("#Designation").append($("<option></option>").val('0').html('Select Designation'));
                    $.each(data.d, function (key, value) {
                        $("#Designation").append($("<option></option>").val(value.DesignationID).html(value.Designation));
                    });
                    $("#Designation").val(DES);
                },
                error: function (result) {
                    alert("Failed to load Designation");
                }
            });
        }

        function fnBindRoleName(RID) {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "UserMaster.aspx/Roles",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    $("#BindRole").html("");
                    $("#BindRole").append($("<option></option>").val('0').html('Select Role'));
                    $.each(data.d, function (key, value) {
                        $("#BindRole").append($("<option></option>").val(value.roleId).html(value.roleName));
                    });
                    $("#BindRole").val(RID);
                },
                error: function (result) {
                    alert("Failed to load Role Name");
                }
            });
        }

        function SaveReq() {
            var isValid = true;
            isValid = isValid && hasValue("#txtEmp", "#spanEmpName", "Enter the Employee Name");
            isValid = isValid && hasValue("#txtEmailId", "#spanEId", "Enter the Email Id");
            isValid = isValid && ValidateEmail();
            isValid = isValid && hasValue("#txtPwd", "#spanPwd", "Enter the Password");
            isValid = isValid && hasValue("#txtPho", "#spanPho", "Enter the Phone Number");
            isValid = isValid && ValidateNumber();
            isValid = isValid && hasddlValue("#BindRole", "#spanRole", "Select Role");
            isValid = isValid && hasddlValue("#Designation", "#spanDes", "Select Designation");
            if (isValid) {
                var objuser = new UserMasters();
                objuser.userId = $('#userId').val();
                objuser.UserName = $('#txtEmp').val();
                objuser.Password = $('#txtPwd').val();
                objuser.EmailId = $('#txtEmailId').val();
                objuser.roleId = $('#BindRole').val();
                objuser.Designation = $('#Designation').val();
                objuser.DesignationID = $('#Designation').val();
                objuser.DOB = $('#txtDOB').val();
                objuser.DOJ = $('#txtDOJ').val();
                objuser.Phone = $('#txtPho').val();
                $("#btnSubmit").attr("disabled", true);

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "UserMaster.aspx/saveuserMaster",
                    data: "{objuser : " + ko.toJSON(objuser) + "}",
                    dataType: "json",
                    success: function (data) {
                        if (data.d != "") {

                            var inserted = data.d;
                            if (inserted != null) {

                                location.href = "UserMasterList.aspx?flagId=" + data.d;
                                Validate(e);
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


        function BindUserMaster(userId) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "UserMaster.aspx/getUserMaster",
                data: "{userId : " + userId + "}",
                dataType: "json",
                success: function (data) {
                    if (data.d != null) {

                        $('#userId').val(data.d.userId);
                        $('#txtEmp').val(data.d.UserName);
                        $('#txtPwd').val(data.d.Password);
                        $('#txtEmailId').val(data.d.EmailId);
                        $('#txtDOB').val(data.d.DOB);
                        $('#txtDOJ').val(data.d.DOJ);
                        $('#txtPho').val(data.d.Phone);


                        fnBindRoleName(data.d.roleId);
                        fnBindDesignation(data.d.Designation);

                    }
                    else {

                        alert('failed to load');
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

        function ValidateEmail() {
            var EmailId = document.getElementById("txtEmailId").value;
            var spanEmailId = document.getElementById("spanEId");
            spanEmailId.innerHTML = "";
            var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            if (!expr.test(EmailId)) {
                spanEmailId.innerHTML = "Invalid Email Address"
                return false;
            }
            return true;
        }

        function ValidateNumber() {
            var PhoneNumber = document.getElementById("txtPho").value;
            var spanphone = document.getElementById("spanPho1");
            spanphone.innerHTML = "";
            var expr = /^[0-9]{10}$/;
            if (!expr.test(PhoneNumber)) {
                spanphone.innerHTML = "Enter Valid Contact Number (Use 10 digits)"
                return false;
            }
            return true;
        }

        function Validate(e) {
            var Phone = e.Phone || e.which;

            var lblError = document.getElementById("userId");
            lblError.Phone = "txtPho";

            var regex = /^[0-9]+$/;

            var isValid = regex.test(String.fromCharCode(Phone));
            if (!isValid) {
                $('#spanPho').text('Numbers Only Allowed');
            }
            else {
                $('#spanPho').text("");

            }

            return isValid;
        }

        function hasddlValue(ctrlId, errDisplayCtrlId, errMsg) {
            var hasIt = true;
            if ($(ctrlId).val() == "Select" || $(ctrlId).val() == "0") {
                hasIt = false;
                $(errDisplayCtrlId).text(errMsg);
                //$(ctrlId).focus();
            }
            else {
                $(errDisplayCtrlId).text('');

            }

            return hasIt;
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
            location.href = "UserMasterList.aspx";
        }
    </script>

    <style type="text/css">
        .form-control {
            font-size: 16px;
            border-radius: 2px;
            border: 1px solid #ccc;
        }

            .form-control:hover {
                font-size: 16px;
                border-radius: 2px;
                border: 1px solid #009933;
            }
        .select2-container {
            min-width: 80% !important;
            width: auto !important;
            z-index: 99;
        }
        .container-fluid, .container-lg, .container-md, .container-sm, .container-xl {
            width: auto;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
            background: #FFFFFF;
        }

        .select2-container--default .select2-results__option--highlighted[aria-selected] {
            background-color: #0ac282;
            font-size: 16px;
        }

        .select2-results__option[aria-selected] {
            cursor: pointer;
            font-size: 16px;
        }

        .select2-container--default .select2-search--dropdown .select2-search__field {
            border: 1px solid #aaa;
            font-size: 16px;
        }

        .ui-widget-content {
            border: 1px solid #aaa;
            background: #fff url(images/ui-bg_flat_75_ffffff_40x100.png) 50% 50% repeat-x;
            color: #222;
            width: auto;
        }

        .ui-datepicker .ui-datepicker-header {
            background: #D9D9D9;
            border: 1px solid #D9D9D9;
        }

        .input-group-text {
            background-color: #0ac282;
        }

        .ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active {
            border: 1px solid #0ac282;
            background: #0ac282 url(../images/ui-bg_glass_50_3baae3_1x400.png) 50% 50% repeat-x;
            font-weight: bold;
            color: #ffffff;
        }

        .ui-datepicker .ui-datepicker-title select {
            font-size: 13px !important;
            margin: 1px 0;
        }

        .toggle-password {
            cursor: pointer;
            margin-left: 3px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="pcoded-content">
        <div class="pcoded-inner-content">
            <div class="main-body">
                <div class="page-wrapper">
                    <div class="page-body">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-block">
                                        <div class="form-group row">
                                            <div class="col-sm-6">
                                                <h1 style="padding: 5px 0px 5px 10px;">User</h1>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="button" style="float: right;">
                                                    <input type="button" class="btn btn-info" value="Back" onclick="BackToList()" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="page-body">
                        <div class="row">
                            <div class="col-sm-12">

                                <div class="card">

                                    <div class="card-block" style="padding: 50px;">
                                        <div class="form-group row" style="padding-bottom:7px;">
                                            <div class="col-sm-6">
                                            <label class="col-form-label">Employee Name <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                            
                                                <input type="text" id="txtEmp" class="form-control" placeholder="Employee Name" autocomplete="off" style="color: black;width:80%" maxlength="500" />

                                                <span class="messages" id="spanEmpName" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                <span class="messages" id="spanEmployeeName1" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-6">

                                            <label class="col-form-label">Email Id <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                            
                                                <input type="text" id="txtEmailId" class="form-control" placeholder="Email Id" style="color: black;width:80%" autocomplete="off" maxlength="50" onkeyup="ValidateEmail()" />
                                                <span class="messages" id="spanEId" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                <span class="messages" id="spanEId1" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>

                                            

                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-6">

                                            <label class="col-form-label">Password <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                            
                                            <div class="input-group" style="width:80%;">
                                                <input id="txtPwd" name="password" type="password" class=" form-control" style="width:80%;" placeholder="Password" autocomplete="off" />
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon2"style="padding:8px;color:#fff"><i class="toggle-password fa fa-eye-slash"style="font-size:15px;margin-left:0px;"></i></span>
                                                </div>
                                            </div>
                                                <span class="messages" id="spanPwd" style="color: red; font-size: 15px; line-height: 30px;"></span>

                                            </div>
                                            <div class="col-sm-6">
                                                <label class="col-form-label">Phone Number <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                                <input type="Text" id="txtPho" class="form-control" placeholder="Phone Number" style="width:80%;" onkeypress="return Validate(event);" maxlength="10" autocomplete="off" onkeyup="ValidateNumber();" />
                                                <span class="messages" id="spanPho" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                <span class="messages" id="spanPho1" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            
                                            </div>

                                        <div class="form-group row" style="padding-bottom:7px;">
                                            <div class="col-sm-6" style="width:80% !important;">

                                            <label class="col-form-label" style="">Role</label> <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup><br />
                                            
                                                <select class="js-example-basic-single col-sm-6 select2-hidden-accessible" tabindex="-1" aria-hidden="true" style="font-size: initial;" id="BindRole">
                                                </select><br /><span class="messages" id="spanRole" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-6">

                                            <label class="col-form-label">Designation <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label><br />
                                                <select class="js-example-basic-single col-sm-12 select2-hidden-accessible" tabindex="-1" aria-hidden="true" style="font-size: initial;" id="Designation">
                                                </select><br />
                                                <span class="messages" id="spanDes" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            
                                            

                                        </div>

                                        <div class="form-group row">
                                            <div class="col-sm-6">

                                            <label class="col-form-label"  style="line-height:0px;">Date Of Birth</label>
                                                <div class="input-group" style="width:50%">
                                                    <input class="form-control" type="text" id="txtDOB" style="margin-top: 15px;" autocomplete="off" readonly />
                                                    <div class="input-group-prepend" style="padding-top: 15px;">
                                                        <span class="input-group-text" id="Span1" style="color: #fff; font-size: 16px;"><i class="fa fa-calendar-check-o"></i></span>
                                                    </div>
                                                </div>
                                                <span class="messages" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-6">

                                            <label class="col-form-label" style="line-height:0px;">Date Of Joining</label>
                                                <div class="input-group" style="width:50%;">
                                                    <input class="form-control" type="text" id="txtDOJ" style="margin-top: 15px;" autocomplete="off" readonly />
                                                    <div class="input-group-prepend" style="padding-top: 15px;">
                                                        <span class="input-group-text" id="Span2" style="color: #fff; font-size: 16px;"><i class="fa fa-calendar-check-o"></i></span>
                                                    </div>
                                                </div>
                                                <span class="messages" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            

                                        </div>
                                        <div class="form-group row" style="padding-top: 30px;">
                                            <div class="col-sm-12">
                                                <center>
                                                    <input type="button" class="btn btn-success f-w-100" style="width: 70px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnSubmit" value="Submit" onclick="SaveReq()" />
                                                    <input type="button" class="btn btn-success f-w-100" style="width: 70px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnBack" value="Cancel" onclick="BackToList()" />
                                                </center>

                                            </div>
                                        </div>
                                        <input type="hidden" id="userId" value="0" />

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="files/bower_components/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="files/bower_components/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="files/bower_components/popper.js/dist/umd/popper.min.js"></script>
    <script type="text/javascript" src="files/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!--Knockout Script-->
    <script src="js/knockout-3.3.0.js" type="text/javascript"></script>
    <script src="js/knockout.mapping-latest.js" type="text/javascript"></script>
    <script src="js/knockout.validation.js" type="text/javascript"></script>

    <!-- data-table js -->
    <script src="files/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="files/bower_components/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="files/assets/pages/data-table/js/jszip.min.js"></script>
    <script src="files/assets/pages/data-table/js/pdfmake.min.js"></script>
    <script src="files/assets/pages/data-table/js/vfs_fonts.js"></script>
    <script src="files/bower_components/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="files/assets/pages/data-table/js/dataTables.bootstrap4.min.js"></script>
    <!-- Select 2 js -->
    <script type="text/javascript" src="files/bower_components/select2/dist/js/select2.full.min.js"></script>
    <!-- Multiselect js -->
    <script type="text/javascript"
        src="files/bower_components/bootstrap-multiselect/dist/js/bootstrap-multiselect.js">
    </script>
    <script type="text/javascript" src="files/bower_components/multiselect/js/jquery.multi-select.js"></script>
    <script type="text/javascript" src="files/assets/js/jquery.quicksearch.js"></script>
    <!-- Custom js -->
    <script type="text/javascript" src="files/assets/pages/advance-elements/select2-custom.js"></script>
    <script src="files/assets/js/pcoded.min.js"></script>
    <script src="files/assets/js/vartical-layout.min.js"></script>
    <script src="files/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="files/assets/js/script.js"></script>

    <script type="text/javascript">
        var UserMasters = function () {
            var self = this;
            self.userId = ko.observable(0);
            self.UserName = ko.observable('');
            self.Password = ko.observable('');
            self.EmailId = ko.observable('');
            self.roleName = ko.observable('');
            self.Designation = ko.observable('');
            self.DOB = ko.observable('');
            self.DOJ = ko.observable('');
            self.Phone = ko.observable('');
        };
    </script>
</asp:Content>

