<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="ProjectMaster.aspx.cs" Inherits="ProjectMaster" %>

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
    <!-- jpro forms css -->
    <link rel="stylesheet" type="text/css" href="files/assets/pages/j-pro/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/j-pro/css/font-awesome.min.css" />

    <script type="text/javascript">
        $(document).ready(function () {
            var objUrlParams = new URLSearchParams(window.location.search);
            var ProjectID = objUrlParams.get('ProjectID');
            if (ProjectID != null) {
                BindProjectMaster(ProjectID)
            }
            else {
                fnBindStatus(0);
                cloneDiv();
                cloneDiv();
            }
            $('.cloneya:not(:first)').each(function () {
                $(this).find('sup').hide();
            });
            $("#txtDD").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: false,
                changeYear: false,
                yearRange: '1924:' + (new Date).getFullYear()

            });

            $("#txtPORD").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: false,
                changeYear: false,
                yearRange: '1924:' + (new Date).getFullYear()

            });



            $("#dynamicContainer").on('keyup', '.txtCPName', function () {
                var txtdesValue = $(this).val();
                var cloneyaElement = $(this).closest('.cloneya');

                if (txtdesValue !== '') {
                    cloneyaElement.find(".spanCPName").text("");
                }
            });



            $("#dynamicContainer").on('keyup', '.txtdes', function () {
                var txtdesValue = $(this).val();
                var cloneyaElement = $(this).closest('.cloneya');

                if (txtdesValue !== '') {
                    cloneyaElement.find(".spandes").text("");
                }
            });

            $("#dynamicContainer").on('keyup', '.txtCPNo', function () {
                var txtdesValue = $(this).val();
                var cloneyaElement = $(this).closest('.cloneya');

                if (txtdesValue !== '') {
                    cloneyaElement.find(".spanCPNo").text("");
                }
            });

            $("#txtpro").keyup(function () {
                var txtpro = $(this).val();
                if (txtpro != '') {
                    $("#spanPro").text("");

                }

            });



            $("#txtPORD").change(function () {
                var txtPORD = $(this).val();
                if (txtPORD != '') {
                    $("#spanPORD").text("");

                }

            });

            $("#txtDD").change(function () {
                var txtDD = $(this).val();
                if (txtDD != '') {
                    $("#spanDD").text("");

                }

            });

            $("#txtCPName").keyup(function () {
                var txtCPName = $(this).val();
                if (txtCPName != '') {
                    $("#spanCPName").text("");

                }

            });

            $("#txtdes").keyup(function () {
                var txtdes = $(this).val();
                if (txtdes != '') {
                    $("#spandes").text("");

                }

            });

            $("#BindStatus").change(function () {
                var BindStatus = $(this).val();
                if (BindStatus != '') {
                    $("#spansta").text("");

                }

            });

            var max = 500;
            var el = document.getElementById('txtpro');

            $('#txtpro').keypress(function (event) {
                var Length = $("#txtpro").val().length;
                var AmountLeft = max - Length;
                $('#txtpro-length-left').html(AmountLeft);
                if (Length >= max) {
                    if (event.which != 8) {
                        $('#spanPro1').text('Only Allowed 500 Characters');

                        return false;
                    }
                } else {
                    $('#spanPro1').text('');
                    el.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {

                            $('#spanPro1').html('');
                        }

                    });
                }


            });

            var maxLength = 500;
            var elaz = document.getElementById('txtLab');

            $('#txtLab').keypress(function (event) {
                var Length = $("#txtLab").val().length;
                var AmountLeft = maxLength - Length;
                $('#txtLab-length-left').html(AmountLeft);
                if (Length >= maxLength) {
                    if (event.which != 8) {
                        $('#spanLab').text('Only Allowed 500 Characters');

                        return false;
                    }
                } else {
                    $('#spanLab').text('');
                    elaz.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {

                            $('#spanLab').html('');
                        }

                    });
                }


            });

            var maxLen2 = 250;
            var elay = document.getElementById('txtCPName');

            $('#txtCPName').keypress(function (event) {
                var Length = $("#txtCPName").val().length;
                var AmountLeft = maxLen2 - Length;
                $('#txtCPName-length-left').html(AmountLeft);
                if (Length >= maxLen2) {
                    if (event.which != 8) {
                        $('#spanCPName1').text('Only Allowed 250 Characters');

                        return false;
                    }
                } else {
                    $('#spanCPName1').text('');
                    elay.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {

                            $('#spanCPName1').html('');
                        }

                    });
                }


            });


            var maxLen1 = 16;

            var ela = document.getElementById('txtProv');

            $('#txtProv').keypress(function (event) {
                var Length = $("#txtProv").val().length;
                var AmountLeft = maxLen1 - Length;
                $('#txtProv-length-left').html(AmountLeft);

                if (Length >= maxLen1) {
                    if (event.which != 8) {
                        $("#txtProv").val(parseFloat($("#txtProv").val()).toFixed(2));
                        $('#spanProv').text('Only Allowed 18 Characters.');

                        return false;
                    }
                }
                else {
                    $('#spanProv').text('');
                    ela.addEventListener('keydown', function (event) {
                        // Checking for Backspace.
                        if (event.keyCode == 8) {
                            $('#spanProv').html('');
                        }
                    });
                }
            });


            $(document).on("click", ".clone-btn-right", function () {
                cloneDiv();
                $('.cloneya:not(:first)').each(function () {
                    $(this).find('sup').hide();
                });
            });

            $(document).on("click", ".delete", function () {
                $('.cloneya sup').show();                

                var cloneyaElement = $(this).closest('.cloneya');
                var cloneyaLength = $('.cloneya').length;

                var objUrlParams = new URLSearchParams(window.location.search);
                var ProjectID = objUrlParams.get('ProjectID');
                if (ProjectID != null && cloneyaLength === 1) {

                    cloneyaElement.find('.CPName').val('');
                    cloneyaElement.find('.Desigination').val('');
                    cloneyaElement.find('.CPNumber').val('');
                    $('.cloneya:not(:first)').each(function () {
                        $(this).find('sup').hide();
                    });
                }
                else if (cloneyaLength == 1) {
                    cloneyaElement.find('.CPName').val('');
                    cloneyaElement.find('.Desigination').val('');
                    cloneyaElement.find('.CPNumber').val('');
                    $('.cloneya:not(:first)').each(function () {
                        $(this).find('sup').hide();
                    });
                }
                else {
                    // Remove the current element if it doesn't have the plus button
                    cloneyaElement.remove();
                    // Show the plus button on the last created clone
                    $(".cloneya:last .clone-btn-right").show();

                    $('.cloneya:not(:first)').each(function () {
                        $(this).find('sup').hide();
                    });
                }


            });

            $("#txtProv").keyup(function () {
                var txtconsumablename = $(this).val();
                if (txtconsumablename != '') {
                    $("#spanProv").text("");

                }

            });

        });



        function cloneDiv() {
            var template = `
                                             <div class="col-sm-12">
                                                <div class="clone-widget cloneya-wrap original">
                                                    <div class="unit widget left-50 right-50 toclone cloneya" style="padding-bottom: 10px;">
                                                        <button type="button" class="btn btn-primary clone-btn-right clone" >
                                                            <i class="icofont icofont-plus"></i>
                                                        </button>
                                                        
                                                        <button type="button" class="addon-btn adn-50 adn-left delete">
                                                        <i class="icofont icofont-minus"></i>
                                                        </button>
                                                        <div class="form-group row" style="padding-top:10px">
                                                            <div class="col-sm-3" style="font-size: 16px; line-height: 30px;">
                                                                Contact Person Name <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                                <input type="text" id="txtCPName" class="form-control txtCPName" placeholder="Contact Person" name="ContactPersonName" autocomplete="off"  maxlength="250" style="color: black;" />
                                                                <span class="messages spanCPName" id="spanCPName" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                                <span class="messages" id="spanCPName1" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                            </div>
                                                            <div class="col-sm-3" style="font-size:16px;line-height:30px;">Designation <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                           <input type="text" id="txtdes" class="form-control txtdes" placeholder="Designation" name="Designation" autocomplete="off"  />
                                                                <span class="messages spandes" id="spandes" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                            </div>
                                                            <div class="col-sm-3" style="font-size: 16px; line-height: 30px;">
                                                                Contact Person Number <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                                <input type="text" id="txtCPNo" class="form-control txtCPNo" placeholder="Contact Number" name="ContactPersonNumber" autocomplete="off" maxlength="10" onkeypress="return Validate(event);" onkeyup="ValidateNumber();" />
                                                                <span class="messages" id="spanCPNo" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                                <span class="messages" id="spanCPNo1" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                            </div>
                                                            
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>`;


            var clonedDiv = $(template);

            clonedDiv.find('.js-example-basic-single').select2();
            $('.clone-btn-right').hide();
            $("#dynamicContainer").append(clonedDiv);




        }

        function fnBindStatus(Sta) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "ProjectMaster.aspx/status",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    $("#BindStatus").html("");
                    $("#BindStatus").append($("<option></option>").val('0').html('Select Status'));
                    $.each(data.d, function (key, value) {
                        $("#BindStatus").append($("<option></option>").val(value.Id).html(value.Description));
                    });
                    $("#BindStatus").val(Sta);
                },
                error: function (result) {
                    alert("Failed to load Status");
                }
            });
        }

        function BindPid() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "ProjectMaster.aspx/BindPid",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    if (data.d != null) {
                        if (data.d.Project) {

                            $("#txtpro").val(data.d.Project);

                        }
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

        function SaveReq() {
            var isValid = true;
            isValid = isValid && hasValue("#txtpro", "#spanPro", "Enter the Project Id");
            isValid = isValid && hasValue("#txtProv", "#spanProv", "Enter the Project Value");
            isValid = isValid && hasValue("#txtPORD", "#spanPORD", "Choose PO Received Date");
            isValid = isValid && hasValue("#txtDD", "#spanDD", "Choose Due date");
            isValid = isValid && hasddlValue("#BindStatus", "#spansta", "Select the Status");
            isValid = isValid && hasValue("#txtCPName", "#spanCPName", "Enter the Contact Person");
            isValid = isValid && hasValue("#txtdes", "#spandes", "Enter the Designation");
            isValid = isValid && hasValue("#txtCPNo", "#spanCPNo", "Enter the Contact Number");
            isValid = isValid && ValidateNumber();

            if (isValid) {


                //Contact person Name 
                var ContactPersonName = document.getElementsByName("ContactPersonName");
                var CPName = [];
                for (var i = 0; i < ContactPersonName.length; i++) {
                    CPName.push(ContactPersonName[i].value);

                }

                //designation
                var Designation = document.getElementsByName("Designation");
                var Desigination = [];
                for (var i = 0; i < Designation.length; i++) {
                    Desigination.push(Designation[i].value);
                }

                //Contact person Number
                var ContactPersonNumber = document.getElementsByName("ContactPersonNumber");
                var CPNumber = [];
                for (var i = 0; i < ContactPersonNumber.length; i++) {
                    CPNumber.push(ContactPersonNumber[i].value);
                }

                var objpro = new ProjectMasters();
                objpro.ProjectID = $('#ProjectID').val();
                objpro.Project = $('#txtpro').val();
                objpro.LabName = $('#txtLab').val();
                objpro.ProjectDesc = $('#txtprodes').val();
                objpro.Duedate = $('#txtDD').val();
                objpro.PORDate = $('#txtPORD').val();
                objpro.ProValue = $('#txtProv').val();

                objpro.StatusId = $('#BindStatus').val();
                objpro.Reason = $('#txtRea').val();

                objpro.CPName = CPName.toString();
                objpro.Desigination = Desigination.toString();
                objpro.CPNumber = CPNumber.toString();

                $("#btnSubmit").attr("disabled", true);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "ProjectMaster.aspx/saveprojectMaster",
                    data: "{objpro : " + ko.toJSON(objpro) + "}",
                    dataType: "json",
                    success: function (data) {
                        if (data.d != "") {

                            var inserted = data.d;
                            if (inserted != null) {

                                location.href = "ProjectMasterList.aspx?flagId=" + data.d;
                                Validate(e);
                                ValidateDecimal(e);
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


        function BindProjectMaster(ProjectID) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "ProjectMaster.aspx/getProjectMaster",
                data: "{ProjectID : " + ProjectID + "}",
                dataType: "json",
                success: function (data) {

                    if (data.d != null) {

                        $('#ProjectID').val(data.d.ProjectID);
                        $('#txtpro').val(data.d.Project);
                        $('#txtLab').val(data.d.LabName);
                        $('#txtprodes').val(data.d.ProjectDesc);
                        $('#txtDD').val(data.d.Duedate);
                        $('#txtPORD').val(data.d.PORDate);
                        $('#txtProv').val(data.d.ProValue);

                        $('#txtRea').val(data.d.Reason);

                        fnBindStatus(data.d.StatusId);

                        var CPName = data.d.CPName.split(",");
                        var Desigination = data.d.Desigination.split(",");
                        var CPNumber = data.d.CPNumber.split(",");

                        for (var i = 0; i < CPName.length; i++) {
                            cloneDivEdit(CPName[i], Desigination[i], CPNumber[i]);
                        }


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


        function cloneDivEdit(CPName, Desigination, CPNumber) {
            $('#pro').remove();
            var template = `
                                              <div class="col-sm-12">
                                                <div class="clone-widget cloneya-wrap original">
                                                    <div class="unit widget left-50 right-50 toclone cloneya" style="padding-bottom: 10px;">
                                                        <button type="button" class="btn btn-primary clone-btn-right clone" >
                                                            <i class="icofont icofont-plus" ></i>
                                                        </button>
                                                        
                                                        <button type="button" class="addon-btn adn-50 adn-left delete">
                                                        <i class="icofont icofont-minus"></i>
                                                        </button>
                                                        <div class="form-group row" style="padding-top:10px">
                                                            <div class="col-sm-3" style="font-size: 16px; line-height: 30px;">
                                                                Contact Person Name <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                                <input type="text" id="txtCPName" class="form-control txtCPName" placeholder="Contact Person" name="ContactPersonName" autocomplete="off"  maxlength="250" style="color: black;" />
                                                                <span class="messages spanCPName" id="spanCPName" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                                <span class="messages" id="spanCPName1" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                            </div>
                                                            <div class="col-sm-3" style="font-size:16px;line-height:30px;">Designation <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                           <input type="text" id="txtdes" class="form-control txtdes" placeholder="Designation" name="Designation" autocomplete="off"  />
                                                                <span class="messages spandes" id="spandes" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                            </div>
                                                            <div class="col-sm-3" style="font-size: 16px; line-height: 30px;">
                                                                Contact Person Number <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                                <input type="text" id="txtCPNo" class="form-control txtCPNo" placeholder="Contact Number" name="ContactPersonNumber" autocomplete="off" maxlength="10" onkeypress="return Validate(event);" onkeyup="ValidateNumber();" />
                                                                <span class="messages" id="spanCPNo" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                                <span class="messages" id="spanCPNo1" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                            </div>
                                                            
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>`;
            var clonedDiv = $(template);

            clonedDiv.find('.js-example-basic-single').select2();

            clonedDiv.find("input[name='ContactPersonName']").val(CPName);
            clonedDiv.find("input[name='Designation']").val(Desigination);
            clonedDiv.find("input[name='ContactPersonNumber']").val(CPNumber);
            $('.clone-btn-right').hide();

            $("#dynamicContainer").append(clonedDiv);
        }



        document.addEventListener('DOMContentLoaded', function () {
            var inputField = document.getElementById('txtPORD');

            inputField.addEventListener('paste', function (event) {
                event.preventDefault();
            });


            inputField.addEventListener('dragstart', function (event) {
                event.preventDefault();
            });


            inputField.addEventListener('dragover', function (event) {
                event.preventDefault();
            });
        });

        document.addEventListener('DOMContentLoaded', function () {
            var inputField = document.getElementById('txtDD');

            inputField.addEventListener('paste', function (event) {
                event.preventDefault();
            });


            inputField.addEventListener('dragstart', function (event) {
                event.preventDefault();
            });


            inputField.addEventListener('dragover', function (event) {
                event.preventDefault();
            });
        });



        function Validate(e) {
            var CPNumber = e.CPNumber || e.which;

            var lblError = document.getElementById("ProjectID");
            lblError.CPNumber = "txtCPNo";

            var regex = /^[0-9]+$/;

            var isValid = regex.test(String.fromCharCode(CPNumber));
            if (!isValid) {
                $('#spanCPNo').text('Numbers Only Allowed');
            }
            else {
                $('#spanCPNo').text("");

            }

            return isValid;
        }

        function ValidateNumber() {
            var PhoneNumber = document.getElementById("txtCPNo").value;
            var spanphone = document.getElementById("spanCPNo1");
            spanphone.innerHTML = "";
            var expr = /^[0-9]{10}$/;
            if (!expr.test(PhoneNumber)) {
                spanphone.innerHTML = "Enter Valid Contact Number (Use 10 digits)"
                return false;
            }
            return true;
        }


        function ValidateDecimal(e) {
            var ProValue = e.ProValue || e.which;

            var lblError = document.getElementById("ProjectID");
            lblError.ProValue = "txtProv";

            //Regex for Valid Characters i.e. Alphabets.
            var regex = /^[0-9]*(\.[0-9]{0,2})?$/;

            //Validate TextBox value against the Regex.
            var isValid = regex.test(String.fromCharCode(ProValue));
            if (!isValid) {
                (hasValue("#txtProv", "#spanProv1", "Numbers Only Allowed"));
            }
            else {
                $("#spanProv1").text("");
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
            location.href = "ProjectMasterList.aspx";
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

        .wrapper {
            margin: 0 auto;
            outline: none;
            padding-top: 60px;
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box;
        }
        .btn i {
            margin-right: 0px;
        }

        .btn {
            border-radius: 2px;
            text-transform: capitalize;
            font-size: 15px;
            padding: 2px 1px 1px 1px;
            cursor: pointer;
        }

        .addon-btn {
            font-size: 16px;
            margin-left: 0px;
            border: 1px solid #999;
            padding: 2px 2px 1px 2px;
        }

        .clone-btn-right {
            font-size: 11px;
            margin-top: -8px;
            padding: 2px 2px 2px 2px;
        }
        .select2-container {
            min-width: 80% !important;
            width: auto !important;
            z-index: 99;
        }
        #ui-datepicker-div {
            z-index:9999 !important;
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
                                                <h1 style="padding: 5px 0px 5px 10px;">Project</h1>
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
                                    <div class="card-block" style="padding: 40px;">

                                        <div class="form-group row">
                                            <div class="col-sm-5">

                                            <label class="col-form-label">Project Id <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                                <input type="text" id="txtpro" class="form-control" style="width:80%;" placeholder="Project Id" autocomplete="off" oninput="limitTextareaprojectid()" maxlength="500" />
                                                <span class="messages" id="spanPro" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                <span class="messages" id="spanPro1" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-5">
                                            <label class="col-form-label">Lab Name </label>
                                                <input type="text" id="txtLab" class="form-control" style="width:80%;" placeholder="Lab Name" autocomplete="off" oninput="limitTextarealab" maxlength="500" />
                                                <span class="messages" id="spanLab" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                <span class="messages" id="spanLab1" style="color: red; font-size: 15px; line-height: 30px;"></span>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-5">
                                            <label class="col-form-label">Project Description</label>
                                                <textarea class="form-control" style="width:80%;" placeholder="" id="txtprodes"></textarea>
                                                <span class="messages" id="spanprodec" style="color: red; font-size: 15px; line-height: 30px;"></span>

                                            </div>
                                            <div class="col-sm-5">
                                            <label class="col-form-label">Project Value <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                                <div class="input-group"  style="width:80%;">
                                                    <input type="text" class="form-control" style="width:80%;" placeholder="Project Value" onkeypress="return ValidateDecimal(event);" autocomplete="off" maxlength="18" id="txtProv" />
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon2" style="font-size: 16px; color: white;">%</span>
                                                    </div>

                                                </div>
                                                <span class="messages" id="spanProv" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                <span class="messages" id="spanProv1" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            
                                            </div>
                                        <div class="form-group row">
                                            <div class="col-sm-5">
                                            <label class="col-form-label" style="line-height:0px;">PO Received Date <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                                <div class="input-group" style=" width:50%;">
                                                    <input class="form-control" type="text" id="txtPORD" placeholder="" style="margin-top: 15px;width:60%;" autocomplete="off" readonly />
                                                    <div class="input-group-prepend" style="padding-top: 15px;">
                                                        <span class="input-group-text" id="Span2" style="color: #fff; font-size: 16px;"><i class="fa fa-calendar-check-o"></i></span>
                                                    </div>
                                                </div>
                                                <span class="messages" id="spanPORD" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            
                                            <div class="col-sm-5">
                                            <label class="col-form-label" style="line-height:0px;">Due Date <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                                <div class="input-group" style="width:50%;">
                                                    <input class="form-control" type="text" id="txtDD" placeholder="" style="margin-top: 15px;" autocomplete="off" readonly />
                                                    <div class="input-group-prepend" style="padding-top: 15px;">
                                                        <span class="input-group-text" id="Span1" style="color: #fff; font-size: 16px;"><i class="fa fa-calendar-check-o"></i></span>
                                                    </div>
                                                </div>
                                                <span class="messages" id="spanDD" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                           
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-5">
                                            <label class="col-form-label">Status <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label><br />
                                                <select class="js-example-basic-single col-sm-12 select2-hidden-accessible" tabindex="-1" aria-hidden="true" style="font-size: initial;" id="BindStatus">
                                                </select><br />
                                                <span class="messages" id="spansta" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-5">
                                            <label class="col-form-label">Reason</label>
                                                <textarea class="form-control" style="width:80%" placeholder="" id="txtRea"></textarea>
                                                <span class="messages" id="spanRea" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                        </div>

                                        <div class="form-group row" id="dynamicContainer">
                                            <div class="col-sm-12">
                                                <div class="clone-widget cloneya-wrap original" id="pro">
                                                    <div class="unit widget left-50 right-50 toclone cloneya" style="padding-bottom: 10px;">
                                                        <button type="button" class="btn btn-primary clone-btn-right clone" >
                                                            <i class="icofont icofont-plus"></i>
                                                        </button>

                                                        <button type="button" class="addon-btn adn-50 adn-left delete">
                                                            <i class="icofont icofont-minus"></i>
                                                        </button>
                                                        <div class="form-group row" style="padding-top: 10px">
                                                            <div class="col-sm-3" style="font-size: 16px; line-height: 30px;">
                                                                Contact Person Name <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                                <input type="text" id="txtCPName" class="form-control txtCPName" placeholder="Contact Person" name="ContactPersonName" autocomplete="off" maxlength="250" style="color: black;" />
                                                                <span class="messages spanCPName" id="spanCPName" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                                <span class="messages" id="spanCPName1" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                            </div>
                                                            <div class="col-sm-3" style="font-size: 16px; line-height: 30px;">
                                                                Designation <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                                <input type="text" id="txtdes" class="form-control txtdes" placeholder="Designation" name="Designation" autocomplete="off" />
                                                                <span class="messages spandes" id="spandes" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                            </div>
                                                            <div class="col-sm-3" style="font-size: 16px; line-height: 30px;">
                                                                Contact Person Number <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                                <input type="text" id="txtCPNo" class="form-control txtCPNo" placeholder="Contact Number" name="ContactPersonNumber" autocomplete="off" maxlength="10" onkeypress="return Validate(event);" onkeyup="ValidateNumber();" />
                                                                <span class="messages" id="spanCPNo" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                                <span class="messages" id="spanCPNo1" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row" style="padding-top: 30px;">
                                            <div class="col-sm-12">
                                                <center>
                                                    <input type="button" class="btn btn-success f-w-100" style="width: 70px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnSubmit" value="Submit" onclick="SaveReq()" />
                                                    <input type="button" class="btn btn-success f-w-100" style="width: 70px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnBack" value="Cancel" onclick="BackToList() " />
                                                </center>
                                            </div>
                                        </div>
                                        <input type="hidden" id="ProjectID" value="0" />
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
    <script type="text/javascript" src="files/bower_components/bootstrap-multiselect/dist/js/bootstrap-multiselect.js"></script>
    <script type="text/javascript" src="files/bower_components/multiselect/js/jquery.multi-select.js"></script>
    <script type="text/javascript" src="files/assets/js/jquery.quicksearch.js"></script>
    <!-- Custom js -->
    <script type="text/javascript" src="files/assets/pages/advance-elements/select2-custom.js"></script>
    <script src="files/assets/js/pcoded.min.js"></script>
    <script src="files/assets/js/vartical-layout.min.js"></script>
    <script src="files/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="files/assets/js/script.js"></script>

    <script type="text/javascript">
        var ProjectMasters = function () {
            var self = this;
            self.ProjectID = ko.observable(0);
            self.Project = ko.observable('');
            self.LabName = ko.observable('');
            self.ProjectDesc = ko.observable('');
            self.Duedate = ko.observable('');
            self.PORDate = ko.observable('');
            self.ProValue = ko.observable('');
            self.CPName = ko.observable('');
            self.Desigination = ko.observable('');
            self.CPNumber = ko.observable('');
            self.StatusId = ko.observable('');
            self.Reason = ko.observable('');
        };
    </script>
</asp:Content>

