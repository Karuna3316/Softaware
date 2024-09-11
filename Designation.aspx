<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="Designation.aspx.cs" Inherits="Designation" %>

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

    <!--Knockout Script-->
    <script src="js/knockout-3.3.0.js" type="text/javascript"></script>
    <script src="js/knockout.mapping-latest.js" type="text/javascript"></script>
    <script src="js/knockout.validation.js" type="text/javascript"></script>

    <script type="text/javascript">

        $(document).ready(function () {

            var objUrlParams = new URLSearchParams(window.location.search);
            var DesignationID = objUrlParams.get('DesignationID');
            if (DesignationID != null)
                BindDesignation(DesignationID);

            var maxLen = 50;
            var el = document.getElementById('txtDesignation');

            $('#txtDesignation').keypress(function (event) {
                var Length = $("#txtDesignation").val().length;
                var AmountLeft = maxLen - Length;
                $('#txtDesignation-length-left').html(AmountLeft);
                if (Length >= maxLen) {
                    if (event.which != 8) {
                        $('#spanDesignation').text('Only Allowed 50 Characters');

                        return false;
                    }
                } else {
                    $('#spanDesignation').text('');
                    el.addEventListener('keydown', function (event) {
                        // Checking for Backspace.
                        if (event.keyCode == 8) {
                            $('#spanDesignation').html('');
                        }

                    });
                }


            });

            $("#txtDesignation").keyup(function () {
                var txtconsumablename = $(this).val();
                if (txtconsumablename != '') {
                    $("#spanDesignation").text("");

                }

            });

        });

        function BindDesignation(DesignationID) {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Designation.aspx/BindDesignation",
                data: "{DesignationID : " + DesignationID + "}",
                dataType: "json",
                success: function (data) {

                    if (data.d != null) {

                        $('#DesignationID').val(data.d.DesignationID);
                        $('#txtDesignation').val(data.d.Designation);
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


        function SaveReq() {

            var isValid = false;
            if
                (hasValue("#txtDesignation", "#spanDesignation", "Enter the Designation"))
                isValid = true;



            if (isValid) {
                var objDesignation = new DesignationObj();
                objDesignation.DesignationID = $('#DesignationID').val();

                objDesignation.Designation = $('#txtDesignation').val();
                $("#btnSubmit").attr("disabled", true);

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Designation.aspx/saveDesignation",
                    data: "{objDesignation : " + ko.toJSON(objDesignation) + "}",
                    dataType: "json",
                    success: function (data) {
                        if (data.d != "") {

                            var inserted = data.d;
                            if (inserted != null) {

                                location.href = "DesignationList.aspx?flagId=" + data.d;

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

        function BackToList() {
            location.href = "DesignationList.aspx";
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
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
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
                                                <h1 style="padding:5px 0px 5px 10px;">Designation</h1>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="button" style="float:right;">
                                                    <input type="button" class="btn btn-info" value="Back" onclick="BackToList()"/>
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

                                    <div class="card-block" style="padding: 40px;"">
                                        <div class="form-group row" style="padding-top:20px;">
                                            <label class="col-sm-3 col-form-label" style="font-size: 16px;">Designation <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" placeholder="Designation" id="txtDesignation" autocomplete="off" maxlength="50" />
                                                <span class="messages" id="spanDesignation" style="color: red; font-size: 15px; line-height: 30px;"></span>

                                            </div>
                                            <div class="col-sm-3"></div>

                                        </div>

                                        <div class="form-group row" style="padding-top: 30px;">
                                            <div class="col-sm-8">
                                                <center>
                                                    <input type="button" class="btn btn-success f-w-100" style="width: 85px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnSubmit" value="Submit" onclick="SaveReq()" />
                                                    <input type="button" class="btn btn-success f-w-100" style="width: 85px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnBack" value="Cancel" onclick="BackToList()" />
                                                </center>

                                            </div>
                                            <div class="col-sm-4"></div>
                                        </div>
                                        <input type="hidden" id="DesignationID" value="0">
                                    </div>


                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>


    </div>

    <!-- Required Jquery -->
    <script type="text/javascript" src="files/bower_components/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="files/bower_components/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="files/bower_components/popper.js/dist/umd/popper.min.js"></script>
    <script type="text/javascript" src="files/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- data-table js -->
    <script src="files/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="files/bower_components/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="files/assets/pages/data-table/js/jszip.min.js"></script>
    <script src="files/assets/pages/data-table/js/pdfmake.min.js"></script>
    <script src="files/assets/pages/data-table/js/vfs_fonts.js"></script>
    <script src="files/bower_components/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="files/assets/pages/data-table/js/dataTables.bootstrap4.min.js"></script>
    <script src="files/assets/pages/chart/knob/jquery.knob.js"></script>
    <script type="text/javascript" src="files/assets/pages/chart/knob/knob-custom-chart.js"></script>
    <script type="text/javascript" src="files/assets/js/sweetalert.js"></script>
    <script type="text/javascript" src="files/assets/js/modal.js"></script>
    <script type="text/javascript" src="files/assets/js/modalEffects.js"></script>
    <!-- sweet alert modal.js intialize js -->

    <!-- modalEffects js nifty modal window effects -->
    <script type="text/javascript" src="files/assets/js/modalEffects.js"></script>
    <script type="text/javascript" src="files/assets/js/classie.js"></script>
    <script type="text/javascript" src="files/bower_components/select2/dist/js/select2.full.min.js"></script>
    <!-- Multiselect js -->
    <script type="text/javascript" src="files/bower_components/bootstrap-multiselect/dist/js/bootstrap-multiselect.js"></script>
    <script type="text/javascript" src="files/bower_components/multiselect/js/jquery.multi-select.js"></script>
    <script type="text/javascript" src="files/assets/js/jquery.quicksearch.js"></script>
    <!-- Custom js -->
    <script type="text/javascript" src="files/assets/pages/advance-elements/select2-custom.js"></script>

    <script type="text/javascript">
        var DesignationObj = function () {
            var self = this;
            self.DesignationID = ko.observable(0);
            self.Designation = ko.observable('');

        };
    </script>
</asp:Content>


