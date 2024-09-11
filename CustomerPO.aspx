<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="CustomerPO.aspx.cs" Inherits="CustomerPO" %>

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
            var CustomerPOID = objUrlParams.get('CustomerPOID');
            if (CustomerPOID != null) {
                BindCustomerPO(CustomerPOID);
            }
            else {
                fnDrpCustomerName(0);
            }

            $("#drpCustomerName").change(function () {
                var X = $(this).val();
                if (X > 0) {
                    $("#SpanCustomerName").text("");
                }
            });
            $("#txtPODate").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: false,
                changeYear: false,
                yearRange: '1924:' + (new Date).getFullYear()

            });

            var max = 500;
            var el = document.getElementById('txtPONumber');

            $('#txtPONumber').keypress(function (event) {
                $('#spanPOnum').text('');
                var Length = $("#txtPONumber").val().length;
                var AmountLeft = max - Length;
                $('#txtPONumber-length-left').html(AmountLeft);
                if (Length >= max) {
                    if (event.which != 8) {
                        $('#spanPOnum').text('Only Allowed 500 Characters');

                        return false;
                    }
                } else {
                    el.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {

                            $('#spanPOnum').html('');
                        }

                    });
                }


            });
        });

        function fnDrpCustomerName(tid) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "CustomerPO.aspx/BindDrpCustomerName",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    var dropdownOptions = '<option value="0">Select Customer Name</option>';
                    $.each(data.d, function (key, value) {
                        dropdownOptions += "<option value='" + value.CID + "'>" + value.CPName + "</option>";
                    });

                    $(".drpCustomerName").html(dropdownOptions);
                    $(".drpCustomerName").val(tid);
                },
                error: function (result) {
                    alert("Failed to load Customer Name");
                }
            });
        }


        function SaveReq() {
            var isValid = false;
            if
                (hasddlValue("#drpCustomerName", "#SpanCustomerName", "Select Customer Name ")
                && hasValue("#txtPONumber", "#spanPOnum", "Enter the  PO Number")
                && hasValue("#hdnF", "#spanhdnf", "Upload PO File")
                && hasValue("#txtPODate", "#spanPoDate", "Choose the PO date"))
                isValid = true;


            if (isValid) {
                var objCustomerPO = new CustomerPO();
                objCustomerPO.CustomerPOID = $('#CustomerPOID').val();
                objCustomerPO.Customerid = $('#drpCustomerName').val();
                objCustomerPO.PONumber = $('#txtPONumber').val();
                objCustomerPO.DocFileName = $('#hdnF').val();
                objCustomerPO.PODate = $('#txtPODate').val();

                $("#btnSubmit").attr("disabled", true);

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "CustomerPO.aspx/SaveOrUpdateCustomerPO",

                    data: "{objCustomerPO : " + ko.toJSON(objCustomerPO) + "}",
                    dataType: "json",
                    success: function (data) {
                        if (data.d != "") {

                            var inserted = data.d;
                            if (inserted != null) {
                                location.href = "CustomerPOList.aspx?flagId=" + data.d;

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

        function BindCustomerPO(CustomerPOID) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "CustomerPO.aspx/BindCustomerPOforEdit",
                data: "{CustomerPOID : " + CustomerPOID + "}",
                dataType: "json",
                success: function (data) {

                    if (data.d != null) {
                        $('#CustomerPOID').val(data.d.CustomerPOID);
                        $('#txtPONumber').val(data.d.PONumber);
                        $('#hdnF').val(data.d.DocFileName);
                        $('#txtPODate').val(data.d.PODate);
                        $('#fExists').text(data.d.DocFileName);

                        fnDrpCustomerName(data.d.Customerid);

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



        function UploadFile(ctrlName) {
            $('#spanhdnf').text('');
            var data = new FormData();
            var files = ctrlName.files;

            var userN = ctrlName.title;
            $('#hdnF')[0].value = files[0].name;
            // Add the uploaded file content to the form data collection
            if (files.length > 0) {
                data.append("UploadedFile", files[0]);
            }
            // Make Ajax request with the contentType = false, and procesDate = false

            $.ajax({
                type: "POST",
                url: "FileUploadHandler.ashx?username=" + userN,
                contentType: false,
                processData: false,
                data: data,
                success: function (result) {
                    console.log(result);
                },
                error: function (response) {
                    alert(response.responseText);
                },
                failure: function (response) {
                    alert(response.responseText);
                }
            });
        }

        function downloadPCFile() {
            if ($("#fExists")[0].title = "1")
                window.location = "FileDownloadHandler.ashx?fname=" + $("#fExists")[0].innerText;
            else
                alert('file does not exists');
        }

        function hasddlValue(ctrlId, errDisplayCtrlId, errMsg) {
            var hasIt = true;
            if ($(ctrlId).val() == "Select" || $(ctrlId).val() == "0") {
                hasIt = false;
                $(errDisplayCtrlId).text(errMsg);
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
            }
            else {
                $(errDisplayCtrlId).text('');
            }

            return hasIt;
        }

        function BackToList() {
            location.href = "CustomerPOList.aspx";
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
                                                <h1 style="padding: 5px 0px 5px 10px;">Customer PO</h1>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="button" style="float: right;">
                                                    <input type="button" class="btn btn-info" onclick="BackToList()" value="Back" />
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
                                            <label class="col-sm-3 col-form-label">Customer Name <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                            <div class="col-sm-4">
                                                <select class="drpCustomerName js-example-basic-single col-sm-12 select2-hidden-accessible" tabindex="-1" aria-hidden="true" style="font-size: initial;" id="drpCustomerName">
                                                </select><span class="messages" id="SpanCustomerName" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-2"></div>
                                        </div>
                                        <div class="form-group row">

                                            <label class="col-sm-3 col-form-label">PO Number <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                            <div class="col-sm-4">
                                                <input type="text" id="txtPONumber" class="form-control" placeholder="PO Number" autocomplete="off" maxlength="500" />
                                                <span class="messages" id="spanPOnum" style="color: red; font-size: 15px; line-height: 30px;"></span>

                                            </div>
                                        </div>


                                        <div class="form-group row">

                                            <label class="col-sm-3 col-form-label">PO File <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                            <div class="col-sm-4">
                                                <input type="file" class="form-control" style="padding: 1px; margin-bottom: 8px;" accept="application/pdf" id="File1" onchange="UploadFile(this);" />

                                                <input type="hidden" id="hdnF" />
                                                <a href="#" onclick="downloadPCFile(this);">
                                                    <span id="fExists" data-bind="text: fName, attr: { title: $data.fExists }" style="margin-top: 5px;"></span></a>
                                                <span class="messages" id="spanhdnf" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>

                                            <div class="col-sm-2"></div>

                                        </div>

                                        <div class="form-group row">

                                            <label class="col-sm-3 col-form-label">PO Date <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                            <div class="col-sm-3">
                                                <div class="input-group" style="margin-bottom: 0px;">
                                                    <input class="form-control" type="text" id="txtPODate" style="margin-top: 0px;" autocomplete="off" onclick="$('#spanPoDate').text('');" readonly />
                                                    <div class="input-group-prepend" style="padding-top: 0px;">
                                                        <span class="input-group-text" id="Span1" style="color: #fff; font-size: 16px;"><i class="fa fa-calendar-check-o"></i></span>
                                                    </div>
                                                </div>
                                                <span class="messages" id="spanPoDate" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>

                                            <div class="col-sm-5"></div>

                                        </div>
                                        <div class="form-group row" style="padding-top: 30px;">
                                            <div class="col-sm-8">
                                                <center>
                                                    <input type="button" class="btn btn-success f-w-100" style="width: 70px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnSubmit" value="Submit" onclick="SaveReq()" />
                                                    <input type="button" class="btn btn-success f-w-100" style="width: 70px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnBack" value="Cancel" onclick="BackToList() " />
                                                </center>

                                            </div>
                                            <div class="col-sm-4"></div>
                                        </div>
                                        <input type="hidden" id="CustomerPOID" value="0" />

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
        var CustomerPO = function () {
            var self = this;
            self.CustomerPOID = ko.observable(0);
            self.Customerid = ko.observable('');
            self.PONumber = ko.observable('');
            self.DocFileName = ko.observable('');
            self.PODate = ko.observable('');
        };
    </script>
</asp:Content>

  