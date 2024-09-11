<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="CustomerMaster.aspx.cs" Inherits="CustomerMasters" %>

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
    <link rel="stylesheet" type="text/css" href="files/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="files/assets/css/jquery.mCustomScrollbar.css">
    <!-- jpro forms css -->
    <link rel="stylesheet" type="text/css" href="files/assets/pages/j-pro/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/j-pro/css/font-awesome.min.css" />

    <script type="text/javascript">

        $(document).ready(function () {
            var objUrlParams = new URLSearchParams(window.location.search);
            var CID = objUrlParams.get('CID');
            if (CID != null) {
                BindCustomerM(CID);
            }
            else {
                fnCusMaster(0);
                cloneDiv();
                cloneDiv();
            }
            $('.cloneya:not(:first)').each(function () {
                $(this).find('sup').hide();
            });

            $("#drpIndu").change(function () {
                var drpIndu = $(this).val();
                if (drpIndu != '') {
                    $("#spanIndu").text("");

                }

            });

            $("#dynamicContainer").on('keyup', '.txtCpn', function () {
                var txtdesValue = $(this).val();
                var cloneyaElement = $(this).closest('.cloneya');

                if (txtdesValue !== '') {
                    cloneyaElement.find(".spantxtCpn").text("");
                }
            });



            $("#dynamicContainer").on('keyup', '.txtdes', function () {
                var txtdesValue = $(this).val();
                var cloneyaElement = $(this).closest('.cloneya');

                if (txtdesValue !== '') {
                    cloneyaElement.find(".spantxtdes").text("");
                }
            });

            $("#dynamicContainer").on('keyup', '.txtCPNu', function () {
                var txtdesValue = $(this).val();
                var cloneyaElement = $(this).closest('.cloneya');

                if (txtdesValue !== '') {
                    cloneyaElement.find(".spantxtCPNu").text("");
                }
            });


            $("#txtGst").keyup(function () {
                var txtGst = $(this).val();
                if (txtGst != '') {
                    $("#spantxtGst").text("");

                }

            });


            $("#txtAdd").keyup(function () {
                var txtAdd = $(this).val();
                if (txtAdd != '') {
                    $("#spantxtAdd").text("");

                }

            });


            var maxl = 500;
            var el = document.getElementById('txtComName');

            $('#txtComName').keypress(function (event) {
                var Length = $("#txtComName").val().length;
                var AmountLeft = maxl - Length;
                $('#txtComName-length-left').html(AmountLeft);
                if (Length >= maxl) {
                    if (event.which != 8) {
                        $('#spantxtComName').text('Only Allowed 500 Characters');

                        return false;
                    }
                } else {
                    $('#spantxtComName').text('');
                    el.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {

                            $('#spantxtComName').html('');
                        }

                    });
                }


            });


            var maxLength = 300;
            var elaz = document.getElementById('txtCpn');

            $('#txtCpn').keypress(function (event) {
                var Length = $("#txtCpn").val().length;
                var AmountLeft = maxLength - Length;
                $('#txtCpn-length-left').html(AmountLeft);
                if (Length >= maxLength) {
                    if (event.which != 8) {
                        $('#spantxtCpn').text('Only Allowed 300 Characters');

                        return false;
                    }
                } else {
                    $('#spantxtCpn').text('');
                    elaz.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {

                            $('#spantxtCpn').html('');
                        }

                    });
                }


            });



            var maxLeg = 300;
            var elay = document.getElementById('txtGst');

            $('#txtGst').keypress(function (event) {
                var Length = $("#txtGst").val().length;
                var AmountLeft = maxLeg - Length;
                $('#txtGst-length-left').html(AmountLeft);
                if (Length >= maxLeg) {
                    if (event.which != 8) {
                        $('#spantxtGst1').text('Only Allowed 300 Characters');

                        return false;
                    }
                } else {
                    $('#spantxtGst1').text('');
                    elay.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {

                            $('#spantxtGst1').html('');
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
                var CID = objUrlParams.get('CID');
                if (CID != null && cloneyaLength === 1) {

                    cloneyaElement.find('.CPName').val('');
                    cloneyaElement.find('.Desigination').val('');
                    cloneyaElement.find('.CPNumber').val('');
                    $('.cloneya:not(:first)').each(function () {
                        $(this).find('sup').hide();
                    });                }
                else if (cloneyaLength == 1) {
                    cloneyaElement.find('.CPName').val('');
                    cloneyaElement.find('.Desigination').val('');
                    cloneyaElement.find('.CPNumber').val('');
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

            $("#txtComName").keyup(function () {
                var txtconsumablename = $(this).val();
                if (txtconsumablename != '') {
                    $("#spantxtComName").text("");

                }

            });


        });

        function limitTextareanote() {
            var maxLen = 300;
            var textArea = document.getElementById("txtsalesRes");

            if (textArea.value.length > maxLen) {
                textArea.value = textArea.value.substring(0, maxLen);
                $("#spantxtsales").text("Only 300 characters are allowed");
            } else { $("#spantxtsales").text(""); }
        }

        function cloneDiv() {
            var template = `
                                            <div class="col-sm-12">
                                                <div class="clone-widget cloneya-wrap original">
                                                    <div class="unit widget left-50 right-50 toclone cloneya" style="padding-bottom: 10px;">
                                                        <button type="button" class="btn btn-primary clone-btn-right clone">
                                                            <i class="icofont icofont-plus" ></i>
                                                        </button>
                                                        
                                                        <button type="button" class="addon-btn adn-50 adn-left delete" >
                                                        <i class="icofont icofont-minus"></i>
                                                        </button>
                                                        <div class="form-group row" style="padding-top:10px">
                                                            <div class="col-sm-3" style="font-size: 16px; line-height: 30px;">
                                                                Contact Person Name <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                                <input type="text" id="txtCpn" class="form-control txtCpn" placeholder="Contact Person Name" name="ContactPersonName" autocomplete="off"/>
                                                                <span class="messages spantxtCpn" id="spantxtCpn" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                            </div>
                                                             <div class="col-sm-3" style="font-size:16px;line-height:30px;">Designation  <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                           <input type="text" id="txtdes" class="form-control txtdes" placeholder="Designation" name="Designation" autocomplete="off"/>
                                                                <span class="messages spantxtdes" id="spantxtdes" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                            </div>
                                                            <div class="col-sm-3" style="font-size: 16px; line-height: 30px;">
                                                                Contact Person Number <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                                <input type="text" id="txtCPNu" class="form-control txtCPNu" onkeyup="ValidateNumber();" placeholder="Contact Person Number" name="ContactPersonNumber" autocomplete="off" maxlength="10" onkeypress="return Validate(event);" />
                                                                <span class="messages" id="spantxtCPNu" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                                <span class="messages span2" id="span2" style="color: red; font-size: 15px; line-height: 30px;"></span>
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


        function fnCusMaster(IndusTypeId) {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "CustomerMaster.aspx/getCusMasdropdown",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    $("#drpIndu").html("");
                    $("#drpIndu").append($("<option></option>").val('0').html('Select Industry Type'));
                    $.each(data.d, function (key, value) {
                        $("#drpIndu").append($("<option></option>").val(value.MasterID).html(value.Description));
                    });
                    $("#drpIndu").val(IndusTypeId);
                },
                error: function (result) {
                    alert("Failed to load Industry Type");
                }
            });
        }

        function BindCustomerM(CID) {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "CustomerMaster.aspx/getCustomerMEdit",
                data: "{CID : " + CID + "}",
                dataType: "json",
                success: function (data) {

                    if (data.d != null) {
                        $('#CID').val(data.d.CID);
                        $('#txtsalesRes').val(data.d.SalesResponse);
                        $('#txtComName').val(data.d.CompanyName);
                        $('#txtGst').val(data.d.GstNo);
                        $('#txtAdd').val(data.d.Address);



                        fnCusMaster(data.d.IndusTypeId);

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
                                                <div class="clone-widget cloneya-wrap original" >
                                                    <div class="unit widget left-50 right-50 toclone cloneya" style="padding-bottom: 10px;">
                                                        <button type="button" class="btn btn-primary clone-btn-right clone">
                                                            <i class="icofont icofont-plus" ></i>
                                                        </button>
                                                        
                                                        <button type="button" class="addon-btn adn-50 adn-left delete" >
                                                        <i class="icofont icofont-minus"></i>
                                                        </button>
                                                        <div class="form-group row" style="padding-top:10px">
                                                            <div class="col-sm-4" style="font-size: 16px; line-height: 30px;">
                                                                Contact Person Name <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                                <input type="text" id="txtCpn" class="form-control" placeholder="Contact Person Name" name="ContactPersonName" autocomplete="off"/>
                                                                <span class="messages spantxtCpn" id="spantxtCpn" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                            </div>
                                                              <div class="col-sm-3" style="font-size:16px;line-height:30px;">Designation  <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                           <input type="text" id="txtdes" class="form-control" placeholder="Designation" name="Designation" autocomplete="off"/>
                                                                <span class="messages spantxtdes" id="spantxtdes" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                            </div>
                                                            <div class="col-sm-3" style="font-size: 16px; line-height: 30px;">
                                                                Contact Person Number <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                                <input type="text" id="txtCPNu" class="form-control txtCPNu" onkeyup="ValidateNumber();" placeholder="Contact Person Number" name="ContactPersonNumber" autocomplete="off" maxlength="10" onkeypress="return Validate(event);" />
                                                                <span class="messages" id="spantxtCPNu" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                                <span class="messages span2" id="span2" style="color: red; font-size: 15px; line-height: 30px;"></span>
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


        function SaveReq() {
            var isValid = true;
            isValid = isValid && hasValue("#txtsalesRes", "#spantxtsales", "Enter the Sales Response");
            isValid = isValid && hasddlValue("#drpIndu", "#spanIndu", "Select Industry Type");
            isValid = isValid && hasValue("#txtComName", "#spantxtComName", "Enter the Company Name");
            isValid = isValid && hasValue("#txtCpn", "#spantxtCpn", "Enter the Contact Person Name");
            isValid = isValid && hasValue("#txtdes", "#spantxtdes", "Enter the Designation");
            isValid = isValid && hasValue("#txtCPNu", "#spantxtCPNu", "Enter the Contact Person Number");
            isValid = isValid && hasValue("#txtGst", "#spantxtGst", "Enter the GST No");
            isValid = isValid && ValidateNumber();
            isValid = isValid && hasValue("#txtAdd", "#spantxtAdd", "Enter the Address");
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


                var objCustomer = new CustomerMaster();
                objCustomer.CID = $('#CID').val();
                objCustomer.SalesResponse = $('#txtsalesRes').val();
                objCustomer.IndusTypeId = $('#drpIndu').val();
                objCustomer.CompanyName = $('#txtComName').val();
                objCustomer.GstNo = $('#txtGst').val();
                objCustomer.Address = $('#txtAdd').val();


                objCustomer.CPName = CPName.toString();
                objCustomer.Desigination = Desigination.toString();
                objCustomer.CPNumber = CPNumber.toString();

                $("#btnSubmit").attr("disabled", true);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "CustomerMaster.aspx/saveCustomerMaster",
                    data: "{objCustomer : " + ko.toJSON(objCustomer) + "}",
                    dataType: "json",
                    success: function (data) {
                        if (data.d != "") {

                            var inserted = data.d;
                            if (inserted != null) {

                                location.href = "CustomerMasterList.aspx?flagId=" + data.d;
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

        function Validate(e) {
            var Phone = e.Phone || e.which;

            var lblError = document.getElementById("CID");
            lblError.Phone = "txtCPNu";

            var regex = /^[0-9]+$/;

            var isValid = regex.test(String.fromCharCode(Phone));
            if (!isValid) {
                $('#spantxtCPNu').text('Numbers Only Allowed');
            }
            else {
                $('#spantxtCPNu').text("");

            }

            return isValid;
        }

        function ValidateNumber() {
            var PhoneNumber = document.getElementById("txtCPNu").value;
            var spanphone = document.getElementById("span2");
            spanphone.innerHTML = "";
            var expr = /^[0-9]{10}$/;
            if (!expr.test(PhoneNumber)) {
                spanphone.innerHTML = "Enter Valid Contact Number (Use 10 digits)"
                return false;
            }
            return true;
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
            location.href = "CustomerMasterList.aspx";
        }
    </script>

    <style type="text/css">
        .form-control {
            font-size: 16px;
            border-radius: 2px;
            border: 1px solid #ccc;
        }

        .wrapper {
            margin: 0 auto;
            outline: none;
            padding: 40px 0px;
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box;
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
                                                <h1 style="padding: 5px 0px 5px 10px;">Customer</h1>
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

                                            <label class="col-sm-3 col-form-label">Sales Response <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                            <div class="col-sm-4">
                                                <input type="text" id="txtsalesRes" class="form-control" placeholder="Sales Response" oninput="limitTextareanote()" autocomplete="off" maxlength="500" />
                                                <span class="messages" id="spantxtsales" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>

                                            <div class="col-sm-2"></div>

                                        </div>

                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Industry Type <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                            <div class="col-sm-4">
                                                <select class="js-example-basic-single col-sm-12 select2-hidden-accessible" tabindex="-1" aria-hidden="true" style="font-size: initial;" id="drpIndu">
                                                </select><span class="messages" id="spanIndu" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-2"></div>
                                        </div>

                                        <div class="form-group row">

                                            <label class="col-sm-3 col-form-label">Company Name <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                            <div class="col-sm-4">
                                                <input type="text" id="txtComName" class="form-control" placeholder="Company Name" autocomplete="off" maxlength="500" />
                                                <span class="messages" id="spantxtComName" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>

                                            <div class="col-sm-2"></div>

                                        </div>
                                        <div class="form-group row">

                                            <label class="col-sm-3 col-form-label">GST No <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                            <div class="col-sm-4">
                                                <input type="text" id="txtGst" class="form-control" placeholder="GST No" autocomplete="off" maxlength="300" />
                                                <span class="messages" id="spantxtGst" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                <span class="messages" id="spantxtGst1" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>

                                            <div class="col-sm-2"></div>

                                        </div>

                                        <div class="form-group row">

                                            <label class="col-sm-3  col-form-label">Address<sup> <i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                            <div class="col-sm-4">
                                                <textarea  id="txtAdd" class="form-control"></textarea>
                                                <span class="messages" id="spantxtAdd" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-2"></div>

                                        </div>
                                        <div class="form-group row" id="dynamicContainer">
                                            <div class="col-sm-12">
                                                <div class="clone-widget cloneya-wrap original" id="pro">
                                                    <div class="unit widget left-50 right-50 toclone cloneya" style="padding-bottom: 10px;">
                                                        <button type="button" class="btn btn-primary clone-btn-right clone">
                                                            <i class="icofont icofont-plus" ></i>
                                                        </button>

                                                        <button type="button" class="addon-btn adn-50 adn-left delete">
                                                            <i class="icofont icofont-minus"></i>
                                                        </button>
                                                        <div class="form-group row manSym" style="padding-top: 10px">
                                                            <div class="col-sm-3" style="font-size: 16px; line-height: 30px;">
                                                                Contact Person Name <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                                <input type="text" id="txtCpn" class="form-control txtCpn" placeholder="Contact Person Name" name="ContactPersonName" autocomplete="off"/>
                                                                <span class="messages spantxtCpn" id="spantxtCpn" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                            </div>
                                                            <div class="col-sm-3" style="font-size: 16px; line-height: 30px;">
                                                                Designation  <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                                <input type="text" id="txtdes" class="form-control txtdes" placeholder="Designation" name="Designation" autocomplete="off" />
                                                                <span class="messages spantxtdes" id="spantxtdes" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                            </div>
                                                            <div class="col-sm-3" style="font-size: 16px; line-height: 30px;">
                                                                Contact Person Number <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                                <input type="text" id="txtCPNu" class="form-control txtCPNu" onkeyup="ValidateNumber();" placeholder="Contact Person Number" name="ContactPersonNumber" autocomplete="off" maxlength="10" onkeypress="return Validate(event);" />
                                                                <span class="messages" id="spantxtCPNu" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                                <span class="messages span2" id="span2" style="color: red; font-size: 15px; line-height: 30px;"></span>
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


                                        <span id="spanReceived" style="color: red; font-size: 15px"></span>
                                        <span id="spanReceived1" style="color: red; font-size: 15px"></span>

                                        <input type="hidden" id="CID" value="0">
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
        var CustomerMaster = function () {
            var self = this;
            self.CID = ko.observable(0);
            self.SalesResponse = ko.observable('');
            self.IndusTypeId = ko.observable(0);
            self.CompanyName = ko.observable('');
            self.CPName = ko.observable('');
            self.Desigination = ko.observable('');
            self.CPNumber = ko.observable('');
            self.GstNo = ko.observable('');
            self.Address = ko.observable('');
        };
    </script>
</asp:Content>

