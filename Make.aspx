<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="Make.aspx.cs" Inherits="Make" %>

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

    <script type="text/javascript">
        $(document).ready(function () {
            var objUrlParams = new URLSearchParams(window.location.search);
            var MasterID = objUrlParams.get('MasterID');
            if (MasterID != null) {
                BindMake(MasterID);
            };

            $("#txtMake").keyup(function () {
                var txtmake = $(this).val();
                if (txtmake != '') {
                    $("#spanMake").text("");

                }

            });

            var max = 500;
            var el = document.getElementById('txtMake');

            $('#txtMake').keypress(function (event) {
                var Length = $("#txtMake").val().length;
                var AmountLeft = max - Length;
                $('#txtMake-length-left').html(AmountLeft);
                if (Length >= max) {
                    if (event.which != 8) {
                        $('#spanMake').text('Only Allowed 500 Characters');

                        return false;
                    }
                } else {
                    $('#spanMake').text('');
                    el.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {

                            $('#spanMake').html('');
                        }

                    });
                }


            });

        })



        function BindMake(MasterID) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Make.aspx/BindMake",
                data: "{MasterID : " + MasterID + "}",
                dataType: "json",
                success: function (data) {

                    if (data.d != null) {

                        $('#MasterID').val(data.d.MasterID);
                        $('#txtMake').val(data.d.Description);

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
            if (hasValue("#txtMake", "#spanMake", "Enter the Make"))
                isValid = true;


            if (isValid) {
                var ObjMake = new Make();
                ObjMake.MasterID = $('#MasterID').val();
                ObjMake.Description = $('#txtMake').val();
                $("#btnSubmit").attr("disabled", true);

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Make.aspx/SaveorUpdateMake",
                    data: "{ObjMake : " + ko.toJSON(ObjMake) + "}",
                    dataType: "json",
                    success: function (data) {
                        if (data.d != "") {

                            var inserted = data.d;
                            if (inserted != null) {
                                location.href = "MakeList.aspx?flagId=" + data.d;

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
            location.href = "MakeList.aspx";
        }
    </script>

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
                                                <h1 style="padding:5px 0px 5px 10px;">Make</h1>
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

                                    <div class="card-block" style="padding: 40px;">
                                        <div class="form-group row">

                                            <label class="col-sm-3 col-form-label">Make <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" placeholder="Make" id="txtMake" autocomplete="off" maxlength="500" />
                                                <span class="messages" id="spanMake" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-3"></div>

                                        </div>

                                        <div class="form-group row" style="padding-top: 30px;">
                                            <div class="col-sm-8">
                                                <center>
                                                                <input type="button"  class="btn btn-success f-w-100" style="width:70px;height:auto; margin-top:-3px;padding:4px 11px; " id="btnSubmit" value="Submit" onclick="SaveReq()"/>
                                                                <input type="button"  class="btn btn-success f-w-100" style="width:70px;height:auto; margin-top:-3px;padding:4px 11px; " id="btnBack" value="Cancel"  onclick="BackToList()" />
                                                </center>

                                            </div>
                                            <div class="col-sm-4"></div>
                                        </div>
                                        <input type="hidden" id="MasterID" value="0">
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

    <script type="text/javascript">

        var Make = function () {
            var self = this;
            self.MasterID = ko.observable(0);
            self.Description = ko.observable('');
        };

    </script>
</asp:Content>

