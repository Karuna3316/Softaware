<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="ProductMaster.aspx.cs" Inherits="ProductMaster" %>

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
    <link rel="stylesheet" type="text/css" href="files/assets/css/style.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/css/jquery.mCustomScrollbar.css" />

    <script>
        $(document).ready(function () {
            var objUrlParams = new URLSearchParams(window.location.search);
            var ProductsID = objUrlParams.get('ProductsID');
            if (ProductsID != null) {
                BindProductMasterForEdit(ProductsID);
                BindListPrice(ProductsID);
                $('#tbl_Product').show();
            }
            else {
                fnDrpMake(0);
                fnDrpSupplier(0);
                $('#tbl_Product').hide();
            }
            $("#drpMakeId").change(function () {
                var X = $(this).val();
                if (X > 0) {
                    $("#SpanMakeId").text("");
                }
            });
            $("#drpSupplierId").change(function () {
                var X = $(this).val();
                if (X > 0) {
                    $("#SpanSupplierId").text("");
                }
            });
            var max = 500;
            var el = document.getElementById('txtProductsName');

            $('#txtProductsName').keypress(function (event) {
                var Length = $("#txtProductsName").val().length;
                var AmountLeft = max - Length;
                $('#txtProductsName-length-left').html(AmountLeft);
                if (Length >= max) {
                    if (event.which != 8) {
                        $('#SpanProductsName').text('Only Allowed 500 Characters');

                        return false;
                    }
                } else {
                    $('#SpanProductsName').text('');
                    el.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {

                            $('#SpanProductsName').html('');
                        }

                    });
                }


            });

            var maxLe = 250;
            var elaa = document.getElementById('txtSize');

            $('#txtSize').keypress(function (event) {
                var Length = $("#txtSize").val().length;
                var AmountLeft = maxLe - Length;
                $('#txtSize-length-left').html(AmountLeft);
                if (Length >= maxLe) {
                    if (event.which != 8) {
                        $('#SpanSize').text('Only Allowed 250 Characters');

                        return false;
                    }
                } else {
                    $('#SpanSize').text('');
                    elaa.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {

                            $('#SpanSize').html('');
                        }

                    });
                }


            });

            var maxL1 = 250;
            var elb = document.getElementById('txtHsn');

            $('#txtHsn').keypress(function (event) {
                var Length = $("#txtHsn").val().length;
                var AmountLeft = maxL1 - Length;
                $('#txtHsn-length-left').html(AmountLeft);
                if (Length >= maxL1) {
                    if (event.which != 8) {
                        $('#SpanHsn').text('Only Allowed 250 Characters');

                        return false;
                    }
                } else {
                    $('#SpanHsn').text('');
                    elb.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {

                            $('#SpanHsn').html('');
                        }

                    });
                }


            });


            var maxLen1 = 16;

            var ela = document.getElementById('txtLPrice');

            $('#txtLPrice').keypress(function (event) {
                var Length = $("#txtLPrice").val().length;
                var AmountLeft = maxLen1 - Length;
                $('#txtLPrice-length-left').html(AmountLeft);

                if (Length >= maxLen1) {
                    if (event.which != 8) {
                        $("#txtLPrice").val(parseFloat($("#txtLPrice").val()).toFixed(2));
                        $('#SpanLPrice').text('Only Allowed 18 Characters');

                        return false;
                    }
                }
                else {
                    $('#SpanLPrice').text('');
                    ela.addEventListener('keydown', function (event) {
                        // Checking for Backspace.
                        if (event.keyCode == 8) {
                            $('#SpanLPrice').html('');
                        }
                    });
                }
            });

            $("#txtProductsName").keyup(function () {
                var txtconsumablename = $(this).val();
                if (txtconsumablename != '') {
                    $("#SpanProductsName").text("");

                }

            });

            $("#txtLPrice").keyup(function () {
                var txtconsumablename = $(this).val();
                if (txtconsumablename != '') {
                    $("#SpanLPrice").text("");

                }

            });

        });

        function fnDrpMake(MakeId) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "ProductMaster.aspx/BindMake",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    $("#drpMakeId").html("");
                    $("#drpMakeId").append($("<option></option>").val('0').html('Select Make'));
                    $.each(data.d, function (key, value) {
                        $("#drpMakeId").append($("<option></option>").val(value.MID).html(value.MName));
                    });
                    $("#drpMakeId").val(MakeId);
                },
                error: function (result) {
                    alert("Failed to load Make");
                }
            });

        }

        function fnDrpSupplier(SupplierId) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "ProductMaster.aspx/BindSupplier",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    $("#drpSupplierId").html("");
                    $("#drpSupplierId").append($("<option></option>").val('0').html('Select Supplier Name'));
                    $.each(data.d, function (key, value) {
                        $("#drpSupplierId").append($("<option></option>").val(value.SID).html(value.SName));
                    });
                    $("#drpSupplierId").val(SupplierId);
                },
                error: function (result) {
                    alert("Failed to load Supplier Name");
                }
            });

        }

        function BindListPrice(ProductsID) {
            $.ajax({

                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "ProductMaster.aspx/GetProductMasterHistory",
                data: "{ProductsID : " + ProductsID + "}",
                dataType: "json",
                success: function (data) {
                    formDocument().lstProductMastersHistoryObj().constructor();
                    if ($.fn.dataTable.isDataTable('#help_tbl')) {
                        $('#help_tbl').DataTable().clear().destroy();
                    }
                    ko.mapping.fromJS(data.d, null, formDocument);
                
                },

                error: function (response) {
                    alert(response.responseText);
                },
                failure: function (response) {
                    alert(response.responseText);
                }
            });

        }

        function BindProductMasterForEdit(ProductsID) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "ProductMaster.aspx/BindProductMasterForEdit",
                data: "{ProductsID : " + ProductsID + "}",
                dataType: "json",
                success: function (data) {

                    if (data.d != null) {

                        $('#ProductsID').val(data.d.ProductsID);

                        $('#txtProductsName').val(data.d.ProductsName);
                        $('#txtSize').val(data.d.Size);
                        $('#txtHsn').val(data.d.Hsn);
                        $('#txtLPrice').val(data.d.LPrice);
                        $('#txtMinQty').val(data.d.MinQty);

                        fnDrpMake(data.d.MakeId);
                        fnDrpSupplier(data.d.SupplierId);

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
                (hasddlValue("#drpMakeId", "#SpanMakeId", "Select Make")
                && hasddlValue("#drpSupplierId", "#SpanSupplierId", "Select Supplier Name")
                && hasValue("#txtProductsName", "#SpanProductsName", "Enter the Product Name")
                && hasValue("#txtLPrice", "#SpanLPrice", "Enter the List Price"))
                isValid = true;



            if (isValid) {
                var ProdObj = new ProductMasters();
                ProdObj.ProductsID = $('#ProductsID').val();
                ProdObj.MakeId = $('#drpMakeId').val();
                ProdObj.SupplierId = $('#drpSupplierId').val();
                ProdObj.ProductsName = $('#txtProductsName').val();
                ProdObj.Size = $('#txtSize').val();
                ProdObj.Hsn = $('#txtHsn').val();
                ProdObj.LPrice = $('#txtLPrice').val();
                ProdObj.MinQty = $('#txtMinQty').val();
                $("#btnSubmit").attr("disabled", true);


                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "ProductMaster.aspx/SaveOrUpdateProducts",
                    data: "{ProdObj : " + ko.toJSON(ProdObj) + "}",
                    dataType: "json",
                    success: function (data) {
                        if (data.d != "") {

                            var inserted = data.d;
                            if (inserted != null) {
                                location.href = "ProductMasterList.aspx?flagId=" + data.d;
                                ValidateDecimal(e);
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

        function ValidateDecimal(e) {
            var LPrice = e.LPrice || e.which;

            var lblError = document.getElementById("ProductsID");
            lblError.LPrice = "txtLPrice";

            //Regex for Valid Characters i.e. Alphabets.
            var regex = /^[0-9]*(\.[0-9]{0,2})?$/;

            //Validate TextBox value against the Regex.
            var isValid = regex.test(String.fromCharCode(LPrice));
            if (!isValid) {
                (hasValue("#txtLPrice", "#SpanLPrice1", "Numbers Only Allowed"));
            }
            else {
                $("#SpanLPrice1").text("");
            }
            return isValid;
        }

        function Validate(e) {
            var Qty = e.Qty || e.which;

            var lblError = document.getElementById("ProductsID");
            lblError.Qty = "txtMinQty";

            var regex = /^[0-9]+$/;

            var isValid = regex.test(String.fromCharCode(Qty));
            if (!isValid) {
                $('#SpanMinQty').text('Numbers Only Allowed');
            }
            else {
                $('#SpanMinQty').text("");

            }

            return isValid;
        }

        function BackToList() {
            location.href = "ProductMasterList.aspx";
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
    </script>

    <style type="text/css">
        .form-control {
            font-size: 16px;
            border-radius: 2px;
            border: 1px solid #ccc;
            width:80%;
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

        th {
            background: #009933 !important;
            color: #ffffff;
            text-align: center !important;
            font-size: 15px !important;
        }
        .select2-container {
            min-width: 80% !important;
            width: auto !important;
            z-index: 99;
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
                                                <h1 style="padding:5px 0px 5px 10px;">Product</h1>
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
                            <div class="col-sm-12"">
                                <div class="card">
                                    <div class="card-block" style="padding: 40px;">
                                        <div class="form-group row">
                                            <div class="col-sm-6">
                                            <label class="col-form-label">Make <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label><br />
                                                <select id="drpMakeId" class="js-example-basic-single col-sm-12 select2-hidden-accessible" tabindex="-1" aria-hidden="true" style="font-size: initial;">
                                                </select><br /><span class="messages" id="SpanMakeId" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-6">

                                            <label class="col-form-label">Supplier Name <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label><br />
                                                <select id="drpSupplierId" class="js-example-basic-single col-sm-12 select2-hidden-accessible" tabindex="-1" aria-hidden="true" style="font-size: initial;">
                                                </select><br /><span class="messages" id="SpanSupplierId" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>

                                        </div>


                                        <div class="form-group row">
                                            <div class="col-sm-6">

                                            <label class="col-form-label">Product Name <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                                <input type="text" id="txtProductsName" class="form-control" placeholder="Product Name" autocomplete="off" maxlength="500" />
                                            <span class="messages" id="SpanProductsName" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            
                                            <div class="col-sm-6">
                                            <label class="col-form-label">List Price <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                                <input type="text" id="txtLPrice" class="form-control" placeholder="List Price" onkeypress="return ValidateDecimal(event);" autocomplete="off" maxlength="18" />
                                                <span class="messages" id="SpanLPrice" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                <span class="messages" id="SpanLPrice1" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-sm-6">

                                            <label class="col-form-label">HSN</label>
                                                <input type="text" id="txtHsn" class="form-control" placeholder="HSN" autocomplete="off" maxlength="250" />
                                            <span class="messages" id="SpanHsn" style="color: red; font-size: 15px; line-height: 30px;"></span>

                                            </div>
                                            <div class="col-sm-6">

                                            <label class="col-form-label">Size & Type</label>
                                                <input type="text" id="txtSize" class="form-control" placeholder="Size & Type" autocomplete="off" maxlength="250" />
                                            <span class="messages" id="SpanSize" style="color: red; font-size: 15px; line-height: 30px;"></span>

                                            </div>
                                            
                                            
                                            </div>
                                        <div class="form-group row">
                                            <div class="col-sm-6">

                                            <label class="col-form-label">Min Quantity</label>
                                                <input type="text" id="txtMinQty" class="form-control" placeholder="Min Quantity" onkeypress="return Validate(event);" autocomplete="off" />
                                            <span class="messages" id="SpanMinQty" style="color: red; font-size: 15px; line-height: 30px;"></span>

                                            </div>
                                            

                                        </div>

                                        <div class="form-group row" style="padding-top: 30px;">
                                            <div class="col-sm-12">
                                                <center>
                                                         <input type="button"  class="btn btn-success f-w-100" style="width:70px;height:auto; margin-top:-3px;padding:4px 11px; " id="btnSubmit" value="Submit" onclick="SaveReq()"/>
                                                         <input type="button"  class="btn btn-success f-w-100" style="width:70px;height:auto; margin-top:-3px;padding:4px 11px; " id="btnBack" value="Cancel"  onclick="BackToList()" />
                                                </center>

                                            </div>
                                        </div>
                                        <input type="hidden" id="ProductsID" value="0">
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>

                    <div class="page-body">
                        <div class="row">
                            <div class="col-sm-12"">
                                <div class="card" id="tbl_Product">
                                    <div class="card-block" style="padding:20px 10px 0px 10px; ">
                                        <div class="dt-responsive table-responsive" style="padding-left: 10px; padding-bottom: 10px;" data-bind="with: formDocument">
                                            <table id="help_tbl" class="table table-striped table-bordered nowrap" data-bind="hidden: formDocument().lstProductMastersHistoryObj().length > 0" style="width: 100%;">
                                                <thead>
                                                    <tr>
                                                        <th style=" width: 40%;">List Price</th>
                                                        <th style=" width: 30%;">Updated By</th>
                                                        <th style=" width: 30%;">Updated Date</th>



                                                    </tr>
                                                </thead>
                                                <tbody data-bind="foreach: formDocument().lstProductMastersHistoryObj()" style="width: 100%;">
                                                    <tr>
                                                        <td style="width: 40%; text-align: right;"><span data-bind="text: LPrice"></span></td>
                                                        <td style="width: 30%;text-align: left;"><span data-bind="text: Updatedby"></span></td>
                                                        <td style="width: 30%; text-align: center;"><span data-bind="text: UpdatedDate"></span></td>



                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>
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

    <script>
        var Products = function (name, value) {
            var self = this;
            self.MName = name;
            self.MID = value;
        };
        var Suppliers = function (name, value) {
            var self = this;
            self.SName = name;
            self.SID = value;
        };
        var ProductMasters = function () {
            var self = this;
            this.ProductsID = ko.observable(0);
            this.MakeId = ko.observable('');
            this.SupplierId = ko.observable('');
            this.ProductsName = ko.observable('');
            this.Size = ko.observable('');
            this.Hsn = ko.observable('');
            this.LPrice = ko.observable('');
            this.MinQty = ko.observable('');
        }
        var ProductMastersHistory = function () {
            var self = this;
            this.LPrice = ko.observable('');
            this.Updatedby = ko.observable('');
            this.UpdatedDate = ko.observable('');

            this.lstProductMastersHistoryObj = ko.observableArray([{
                LPrice: '', Updatedby: '', UpdatedDate: ''
            }]);
        };
        formDocument = ko.observable(new ProductMastersHistory());
        ko.applyBindings(new ProductMastersHistory());
    </script>
</asp:Content>

