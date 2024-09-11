<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="Inward.aspx.cs" Inherits="Inwards" %>

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
    <link rel="stylesheet" type="text/css" href="files/assets/pages/j-pro/css/j-forms.css" />

    <!-- feather Awesome -->
    <link rel="stylesheet" type="text/css" href="files/assets/icon/feather/css/feather.css" />

    <style type="text/css">
        .wrapper {
            margin: 0 auto;
            outline: none;
            padding: 40px 0px;
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box;
        }

        .select2-container--default .select2-results__option[aria-selected=true] {
            background-color: #ddd;
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

        .form-control {
            font-size: 16px;
            border-radius: 2px;
            height: 46px;
            border: 1px solid #ccc;
        }

            .form-control:hover {
                font-size: 16px;
                border-radius: 2px;
                height: 46px;
                border: 1px solid #009933;
            }

        .card-block {
            padding: 1.25rem;
            word-spacing: 4px;
            line-height: 20.8px;
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

        select {
            display: none !important;
        }

        .dropdown-select {
            background-color: #0ac282;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#40FFFFFF', endColorstr='#00FFFFFF', GradientType=0);
            background-color: #0ac282;
            border-radius: 6px;
            border: solid 1px #eee;
            box-sizing: border-box;
            cursor: pointer;
            display: block;
            float: left;
            color: #fff;
            font-size: 14px;
            font-weight: normal;
            height: 46px;
            line-height: 44px;
            outline: none;
            padding-left: 18px;
            padding-right: 30px;
            position: relative;
            text-align: left !important;
            transition: all 0.2s ease-in-out;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            white-space: nowrap;
            width: auto;
        }

            .dropdown-select:focus {
                background-color: #0ac282;
            }

            .dropdown-select:hover {
                background-color: #0ac282;
            }

            .dropdown-select:active,
            .dropdown-select.open {
                background-color: #0ac282 !important;
                border-color: #bbb;
                box-shadow: 0 1px 4px rgba(0, 0, 0, 0.05) inset;
            }

            .dropdown-select:after {
                height: 0;
                width: 0;
                border-left: 4px solid transparent;
                border-right: 4px solid transparent;
                border-top: 4px solid #777;
                -webkit-transform: origin(50% 20%);
                transform: origin(50% 20%);
                transition: all 0.125s ease-in-out;
                content: '';
                display: block;
                margin-top: -2px;
                pointer-events: none;
                position: absolute;
                right: 10px;
                top: 50%;
            }

            .dropdown-select.open:after {
                -webkit-transform: rotate(-180deg);
                transform: rotate(-180deg);
            }

            .dropdown-select.open .list {
                -webkit-transform: scale(1);
                transform: scale(1);
                opacity: 1;
                pointer-events: auto;
            }

            .dropdown-select.open .option {
                cursor: pointer;
            }

            .dropdown-select.wide {
                width: 100%;
                font-size: 17px;
            }

                .dropdown-select.wide .list {
                    left: 0 !important;
                    right: 0 !important;
                }

            .dropdown-select .list {
                box-sizing: border-box;
                transition: all 0.15s cubic-bezier(0.25, 0, 0.25, 1.75), opacity 0.1s linear;
                -webkit-transform: scale(0.75);
                transform: scale(0.75);
                -webkit-transform-origin: 50% 0;
                transform-origin: 50% 0;
                box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.09);
                background-color: #fff;
                border-radius: 6px;
                margin-top: 4px;
                padding: 3px 0;
                opacity: 0;
                overflow: hidden;
                pointer-events: none;
                position: absolute;
                top: 100%;
                left: 0;
                z-index: 999;
                max-height: 250px;
                overflow: auto;
                border: 1px solid #ddd;
            }

                .dropdown-select .list:hover .option:not(:hover) {
                    background-color: #FFF;
                }

            .dropdown-select .dd-search {
                overflow: hidden;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0.5rem;
            }

            .dropdown-select .dd-searchbox {
                width: 90%;
                padding: 0.5rem;
                border: 1px solid #999;
                border-color: #999;
                border-radius: 4px;
                height: 30px;
                outline: none;
                color: #000;
            }

                .dropdown-select .dd-searchbox:focus {
                    border-color: #0ac282;
                }

            .dropdown-select .list ul {
                padding: 0;
            }

            .dropdown-select .option {
                cursor: default;
                font-weight: 400;
                line-height: 40px;
                outline: none;
                padding-left: 18px;
                padding-right: 29px;
                text-align: left;
                transition: all 0.2s;
                list-style: none;
                color: #000;
            }

                .dropdown-select .option:hover,
                .dropdown-select .option:focus {
                    background-color: #0ac282 !important;
                    color: #fff;
                }

                .dropdown-select .option.selected {
                    font-weight: 400;
                    color: #12cbc4;
                }

                    .dropdown-select .option.selected:focus {
                        background: #0ac282;
                        color: #fff;
                    }

            .dropdown-select a {
                color: #aaa;
                text-decoration: none;
                transition: all 0.2s ease-in-out;
            }

                .dropdown-select a:hover {
                    color: #666;
                }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            var objUrlParams = new URLSearchParams(window.location.search);
            var InwardId = objUrlParams.get('InwardId');

            if (InwardId != null) {
                BindInward(InwardId);
            }
            else {
                fnDrpSupplier(0);
                fnPoNumber(0, 0);

                BindProduct(0, 0, 0, '');
            }

            $("#dynamicContainer").on('input', '.Received', function () {
                var Received = $(this).val();

                if (Received !== '') {
                    $("#spanQuantity").text("");
                }
            });

            $("#drpPonumber").change(function () {
                var drpPonumber = $(this).val();
                var SPoNumber = $(this).find(":selected").text();

                var drpSupplierId = $("#drpSupplierId").val();
                if (drpPonumber > 0) {
                    IsPONO = 1;
                    $('.duplicate').remove();
                    $(".clone-btn-right").show();
                    cloneDiv()
                    $('.original').remove();
                    BindProduct(drpSupplierId, 0, 1, SPoNumber);

                } else {
                    IsPONO = 0;
                    BindProduct(0, 0, 0, '');
                    $('.duplicate').remove();
                    $(".clone-btn-right").show();

                    $('.Quantity').val('');
                    $('.Received').val('');
                    $('.messages').val('');

                    cloneDiv()
                    $('.original').remove();
                }
            });

            $(document).on("change", "#drpSupplierId", function () {
                var feCount = $("#drpSupplierId").val();
                $("#spanSupplierName").text('');

                var objUrlParams = new URLSearchParams(window.location.search);
                var InwardId = objUrlParams.get('InwardId');

                if (feCount != '0' && feCount != '') {


                    $('.duplicate').remove();
                    $(".clone-btn-right").show();

                    $('.Quantity').val('');
                    $('.Received').val('');
                    $('.messages').val('');

                    cloneDiv()
                    $('.original').remove();
                    fnPoNumber(feCount, 0);
                }
                else {

                    $('.duplicate').remove();
                    $(".clone-btn-right").show();

                    $('.Quantity').val('');
                    $('.Received').val('');
                    $('.messages').val('');

                    cloneDiv()
                    $('.original').remove();
                    fnPoNumber(0, 0);
                    BindProduct(0, 0, 0, '');

                }

            });

            $(document).on("change", ".drpProduct", function () {
                $("#spandrpProduct").text("");
                $(this).closest('.cloneya').find('.Quantity').val('');
                $(this).closest('.cloneya').find('.Received').val('');

                var ProductsID = $(this).val();
                var InwardId = $('#InwardId').val();

                var Quantity = $(this).closest('.cloneya').find('.Quantity');
                var selectedOption = $(this).find("option:selected");
                var lastpriceField = $(this).closest('.cloneya').find('.LastPurchase');
                var lprice = selectedOption.data("lprice");
                var lastPurchase = selectedOption.data("lastpurchase");
                var Description = selectedOption.data("description");
                var hsn = selectedOption.data("hsn");
                var Qty = selectedOption.data("qty");
                var LastInwardedQuantity = selectedOption.data("lastinwardedquantity");
                if (ProductsID != '0' && ProductsID != '') {

                    $(this).closest('.cloneya').find('.LPrice').val(lprice);
                    $(this).closest('.cloneya').find('.Description').val(Description);
                    $(this).closest('.cloneya').find('.HSN').val(hsn);
                    $(this).closest('.cloneya').find('.Quantity').val(Qty);
                    $(this).closest('.cloneya').find('.LastInwardedQuantity').val(LastInwardedQuantity);
                    lastproductprice(ProductsID, IsPONO, lastpriceField);
                } else {
                    $(this).closest('.cloneya').find('.Quantity').val('');
                    $(this).closest('.cloneya').find('.Received').val('');
                    $(this).closest('.cloneya').find('.LPrice').val('');
                    $(this).closest('.cloneya').find('.Description').val('');
                    $(this).closest('.cloneya').find('.HSN').val('');
                    $(this).closest('.cloneya').find('.LastPurchase').val('');
                    $(this).closest('.cloneya').find('.LastInwardedQuantity').val('');
                    $(this).closest('.cloneya').find('.Quantity').val('');
                }
            });

            $(document).on("click", ".clone-btn-right", function () {
                cloneDiv();
            });

            $(document).on("click", ".delete", function () {
                var cloneyaElement = $(this).closest('.cloneya');
                var duplicateElement = $(this).closest('.duplicate');
                var cloneyaLength = $('.duplicate').length;
                var original = $('.original');
                var originallength = $('.original').length;
                var drpSupplierId = $("#drpSupplierId").val();


                var objUrlParams = new URLSearchParams(window.location.search);
                var InwardId = objUrlParams.get('InwardId');
                if (InwardId == null && originallength == 1) {
                    original.remove();
                    cloneyaElement.remove();
                    cloneDiv();

                } else if (InwardId == null && originallength != 1 && cloneyaLength == 1) {
                    cloneyaElement.remove();
                    cloneDiv();

                } else if ((drpSupplierId != 0 || drpSupplierId == 0) && InwardId != null && cloneyaLength == 1 && originallength == 1) {
                    original.remove();
                    cloneyaElement.remove();
                    cloneDiv();
                } else if ((drpSupplierId != 0 || drpSupplierId == 0) && InwardId != null && cloneyaLength == 1 && originallength == 0) {
                    cloneyaElement.remove();
                    cloneDiv();
                } else {
                    cloneyaElement.remove();
                    $(".cloneya:last .clone-btn-right").show();
                }

            });

            $(document).on('keyup keydown', '.Received', function (event) {
                var received = parseFloat($(this).val());
                var quantity = parseFloat($(this).closest('.cloneya').find('.Quantity').val());
                var SpanMessage = $(this).closest('.cloneya').find('.messages');
                var totalReceived = 0;
                var drpProduct = $(this).closest('.cloneya').find('.drpProduct').val();

                // Calculate the total received quantity for the specific drpProduct
                $('.cloneya .Received').each(function () {
                    var value = parseFloat($(this).val());
                    var product = $(this).closest('.cloneya').find('.drpProduct').val();
                    if (!isNaN(value) && product === drpProduct) {
                        totalReceived += value;
                    }
                });

                if (received > quantity) {
                    SpanMessage.text('Inward Quantity exceeds');
                } else {
                    SpanMessage.text('');
                }

                // Perform the check against the total received quantity
                var isActiveElement = false; // Flag to track the current active element
                $('.cloneya .Received').each(function () {
                    var product = $(this).closest('.cloneya').find('.drpProduct').val();
                    var messageElement = $(this).closest('.cloneya').find('.messages');
                    if (product === drpProduct) {
                        if ($(this).is(':focus')) {
                            isActiveElement = true;
                            if (totalReceived > quantity) {
                                messageElement.text('Inward quantity exceeds');
                                isRcQtyOk = false;
                            } else {
                                messageElement.text('');
                                isRcQtyOk = true;
                                $('#spanReceived').text("");
                            }
                        } else {
                            messageElement.text('');
                            isRcQtyOk = true;
                            $('#spanReceived').text("");
                        }
                    }
                });

                // Clear the error message in other elements if the current element is active
                if (isActiveElement) {
                    $('.cloneya .Received').not($(this)).each(function () {
                        var product = $(this).closest('.cloneya').find('.drpProduct').val();
                        var messageElement = $(this).closest('.cloneya').find('.messages');
                        if (product === drpProduct) {
                            messageElement.text('');
                        }
                    });
                }
            });

        });

        function Qtyprice(InwardId, ProductsID, Qtyprice) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Inward.aspx/getQty",
                data: "{InwardId: '" + InwardId + "',ProductsID: '" + ProductsID + "'}",
                dataType: "json",
                success: function (data) {
                    Qtyprice.val(data.d.Qty);
                },
                error: function (result) {
                    alert("Failed to load Qty Price");
                }
            });
        }
        function lastproductprice(ProductsId, IsPONO, lastpriceField) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Inward.aspx/Getlastprice",
                data: "{ProductsId: '" + ProductsId + "',IsPONO: '" + IsPONO + "'}",
                dataType: "json",
                success: function (data) {
                    lastpriceField.val(data.d.LastPrice);
                },
                error: function (result) {
                    alert("Failed to load last Product Price");
                }
            });
        }
        function cloneDiv() {
            var template = `
            <div class="col-sm-12 cloneya duplicate">
                <div class="clone-widget cloneya-wrap">
                    <div class="unit widget left-50 right-50 " style="padding-bottom: 10px;">
                        <button type="button" class="btn btn-primary clone-btn-right clone" style="font-size: 10px; margin-top: -7px;">
                            <i class="icofont icofont-plus"></i>
                        </button>
                        <tb>
                            <button type="button" class="addon-btn adn-50 adn-left delete" >
                                <i class="icofont icofont-minus"></i>
                            </button>
                            <div class="form-group row">
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Product <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                    <select class="drpProduct js-example-basic-single col-sm-12" name="nameProduct" id="drpProduct"></select>
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Quantity
                                    <input type="text" class="form-control Quantity" id="Qty_{{index}}" name="quantity" disabled />
                                </div>
                                                                
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Last Inward Quantity 
                                                                    <input type="text" class="form-control LastInwardedQuantity" id="LastQty_{{index}}" name="LastInwardedQuantity" disabled />
                                                                </div>


                                <div class="col-sm-3" style="font-size: 16px;">
                                    Inward Quantity <span class="messages" id="spanRev" style="color: red; font-size: 15px"></span>
                                    <input type="text" class="form-control Received" placeholder="Inward Qty" name="nameRev" id="txtRe_{{index}}" autocomplete="off" onkeypress="return ValidateDecimalQty(event);" />
                                </div>
                            </div>
                            <div class="form-group row">
<div class="col-sm-3" style="font-size: 16px;">
                                                                    Description 
                                                                    <input type="text" class="form-control Description" name="Description" disabled />
                                                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Net Price <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                    <input type="text" class="form-control LPrice" name="ListPrice" autocomplete="off" onkeypress="return ValidateDecimalQty(event);"/>
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Last Purchase Price 
                                    <input type="text" class="form-control LastPurchase" name="LastPurchase" disabled />
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    HSN No 
                                    <input type="text" class="form-control HSN" name="HSNNo" autocomplete="off" onkeypress="return ValidateDecimalQty(event);"/>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
    </div > `;
            var clonedDiv = $(template);

            clonedDiv.find('.js-example-basic-single').select2();

            // Remove the plus button from existing elements
            $('.clone-btn-right').hide();


            $("#dynamicContainer").append(clonedDiv);
            var drpSupplierId = $("#drpSupplierId").val();
            var SPoNumber = $("#drpPonumber").find(":selected").text();
            fnDrpProductClone(drpSupplierId, 0, IsPONO, SPoNumber, clonedDiv);


        }

        function fnDrpSupplier(SupplierId) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Inward.aspx/getSupplier",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    $("#drpSupplierId").html("");
                    $("#drpSupplierId").append($("<option></option>").val('0').html('Select supplier name'));
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

        var IsPONO = 0;// Global variable to store the P.O.Number type
        function fnPoNumber(SupplierId, PONumberId) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Inward.aspx/getPONumber",
                data: "{SupplierId: '" + SupplierId + "'}",
                dataType: "json",
                success: function (data) {


                    if (data.d.length === 0) {
                        $("#drpPonumber").html("");
                        $("#drpPonumber").append($("<option></option>").val('0').html('Select P.O number'));
                        $.each(data.d, function (key, value) {
                            $("#drpPonumber").append($("<option></option>").val(value.SuppID).html(value.PONumber));
                        });
                        $("#drpPonumber").val(PONumberId);


                    } else {

                        $("#drpPonumber").html("");
                        $("#drpPonumber").append($("<option></option>").val('0').html('Select P.O number'));
                        $.each(data.d, function (key, value) {
                            $("#drpPonumber").append($("<option></option>").val(value.SuppID).html(value.PONumber));
                        });
                        $("#drpPonumber").val(PONumberId);

                    }

                },
                error: function (result) {
                    alert("Failed to load P.O Number");
                }
            });
        }

        function BindProduct(SupplierId, Products, IsPONO, SPoNumber) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Inward.aspx/GetProduct",
                data: "{SupplierId: '" + SupplierId + "',IsPONO: '" + IsPONO + "',SPoNumber: '" + SPoNumber + "'}",
                dataType: "json",
                success: function (data) {
                    var dropdownOptions = '<option value="0">Select Product Name</option>';
                    $.each(data.d, function (key, value) {
                        // Use a space to separate each attribute
                        dropdownOptions += "<option value='" + value.pid +
                            "' data-Qty='" + value.Qty +
                            "' data-Lprice='" + value.LPrice +
                            "' data-LastPurchase='" + value.LastPurchase +
                            "' data-Hsn='" + value.Hsn +
                            "' data-Description='" + value.Description +
                            "' data-LastInwardedQuantity='" + value.LastInwardedQuantity + "'>" + value.pname + "</option>";
                    });
                    // Apply options to all the dropdowns with class 'drpProduct'
                    $(".drpProduct").html(dropdownOptions);
                    $(".drpProduct").val(Products);
                },
                error: function (result) {
                    alert("Failed to load Product Name");
                }
            });
        }

        var isRcQtyOk = true; // Global variable to store the received quantity validity
        function SaveInward() {
            var isValid = false;
            if (hasddlValue("#drpSupplierId", "#spanSupplierName", "Select supplier name") &&
                hasValue("#txtSupplierInv", "#spanSupplierInv", "Enter the supplier invoice number"))

                if (isRcQtyOk == true) {
                    isValid = true;
                } else {
                    isValid = false;
                    $('#spanReceived').text("Inward quantity exceeds");
                }

            if (isValid && isRcQtyOk) {
                var parentContainers = $('#dynamicContainer').find('.cloneya');
                var hasZeroValue = false;
                var hasEmptyTextbox = false; // Initialize as false
                var hasEmptyPrice = false; // Initialize as false
                parentContainers.each(function () {
                    var container = $(this);
                    var dropdown = container.find('.drpProduct');
                    var textbox = container.find('.Received');
                    var LPrice = container.find('.LPrice');
                    if (dropdown.val() === '0') {
                        hasZeroValue = true;
                        return false;
                    }
                    if (textbox.val() === '') {
                        hasEmptyTextbox = true; // Set hasEmptyTextbox to true if an empty value is found
                        return false;
                    }
                    if (LPrice.val() === '') {
                        hasEmptyPrice = true; // Set hasEmptyPrice to true if an empty value is found
                        return false;
                    }
                });
                if (hasZeroValue) {
                    isValid = false;
                    $("#spandrpProduct").text("Select Product Name");
                    $("#spanQuantity").text("");
                    return;
                }
                if (hasEmptyTextbox) {
                    isValid = false;
                    $("#spanQuantity").text("Enter the inward quantity");
                    $("#spandrpProduct").text("");
                    return;
                }
                if (hasEmptyPrice) {
                    isValid = false;
                    $("#spanLPrice").text("Enter the Net price");
                    $("#spandrpProduct").text("");
                    return;
                }

                //ProductID
                var nameProduct = document.getElementsByName("nameProduct");
                var ProductsId = [];
                for (var i = 0; i < nameProduct.length; i++) {
                    ProductsId.push(nameProduct[i].value);
                }

                //Received
                var nameRev = document.getElementsByName("nameRev");
                var ReceievedQty = [];
                for (var i = 0; i < nameRev.length; i++) {
                    ReceievedQty.push(nameRev[i].value);
                }

                //Qty
                var quantity = document.getElementsByName("quantity");
                var Qty = [];
                for (var i = 0; i < quantity.length; i++) {
                    Qty.push(quantity[i].value);
                }

                //LPrice
                var ListPrice = document.getElementsByName("ListPrice");
                var LPrice = [];
                for (var i = 0; i < ListPrice.length; i++) {
                    LPrice.push(ListPrice[i].value);
                }

                //HSN
                var HSNNo = document.getElementsByName("HSNNo");
                var HSN = [];
                for (var i = 0; i < HSNNo.length; i++) {
                    HSN.push(HSNNo[i].value);
                }

                // Description
                var DescriptionNo = document.getElementsByName("Description");
                var Description = [];
                for (var i = 0; i < DescriptionNo.length; i++) {
                    if (DescriptionNo[i].value && DescriptionNo[i].value.trim() !== '') {
                        Description.push(DescriptionNo[i].value);
                    } else {
                        Description.push('-');
                    }
                }




                var inObj = new Inward();
                inObj.InwardId = $('#InwardId').val();
                inObj.SupplierId = $('#drpSupplierId').val();
                inObj.PONumberId = $('#drpPonumber').val();
                inObj.SupplierInv = $('#txtSupplierInv').val();
                inObj.IsPONO = IsPONO;

                inObj.ProductsId = ProductsId.toString();
                inObj.Qty = Qty.toString();
                inObj.ReceievedQty = ReceievedQty.toString();
                inObj.LPrice = LPrice.toString();
                inObj.HSN = HSN.toString();
                inObj.Description = Description.toString();
                $("#btnSubmit").attr("disabled", true);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Inward.aspx/SaveOrUpdateinward",
                    data: "{inObj : " + ko.toJSON(inObj) + "}",
                    dataType: "json",
                    success: function (data) {
                        if (data.d != "") {

                            var inserted = data.d;
                            if (inserted != null) {
                                location.href = "InwardList.aspx?flagId=" + data.d;
                                ValidateDecimalQty(e);

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
            return isValid && isRcQtyOk;

        }

        function BindInward(InwardId) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Inward.aspx/BindeditInward",
                data: "{InwardId : " + InwardId + "}",
                dataType: "json",
                success: function (data) {

                    if (data.d != null) {

                        $('#InwardId').val(data.d.InwardId);
                        $('#txtSupplierInv').val(data.d.SupplierInv);
                        IsPONO = data.d.IsPONO;
                        fnDrpSupplier(data.d.SupplierId);
                        fnPoNumber(data.d.SupplierId, data.d.PONumberId)
                        //BindProduct(data.d.SupplierId, data.d.ProductsId, IsPONO);

                        var ProductsId = data.d.ProductsId.split(",");
                        var Qty = data.d.Qty.split(",");
                        var ReceievedQty = data.d.ReceievedQty.split(",");
                        var LPrice = data.d.LPrice.split(",");
                        var HSN = data.d.HSN.split(",");
                        var Description = data.d.Description.split(",");
                        var SupplierId = data.d.SupplierId;
                        setTimeout(function () {
                            for (var i = 0; i < ProductsId.length; i++) {
                                cloneDivEdit(SupplierId, ProductsId[i], IsPONO, $("#drpPonumber").find(":selected").text(), Qty[i], ReceievedQty[i], LPrice[i], HSN[i], Description[i]);
                            }
                        }, 1000);

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

        function cloneDivEdit(SupplierId, productId, IsPONO, SPoNumber, Quantity, Received, LPrice, HSN, Description) {
            $('#pro').remove();
            var template = `
            <div class="col-sm-12  cloneya duplicate EditDuplicate">
                <div class="clone-widget cloneya-wrap">
                    <div class="unit widget left-50 right-50 " style="padding-bottom: 10px;">
                        <button type="button" class="btn btn-primary clone-btn-right clone" style="font-size: 10px; margin-top: -7px;">
                            <i class="icofont icofont-plus"></i>
                        </button>
                        <tb>
                            <button type="button" class="addon-btn adn-50 adn-left delete" >
                                <i class="icofont icofont-minus"></i>
                            </button>
                            <div class="form-group row">
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Product <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                    <select class="drpProduct js-example-basic-single col-sm-12" name="nameProduct" id="drpProduct"></select>
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Quantity
                                    <input type="text" class="form-control Quantity" id="Qty_{{index}}" name="quantity" disabled />
                                </div>

                                <div class="col-sm-3" style="font-size: 16px;">
                                    Last Inward Quantity
                                    <input type="text" class="form-control LastInwardedQuantity" id="LastQty_{{index}}" name="LastInwardedQuantity" disabled />
                                </div>

                                <div class="col-sm-3" style="font-size: 16px;">
                                    Inward Quantity <span class="messages" id="spanRev" style="color: red; font-size: 15px"></span>
                                    <input type="text" class="form-control Received" placeholder="Inward Qty" name="nameRev" id="txtRe_{{index}}" autocomplete="off" onkeypress="return ValidateDecimalQty(event);" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Description
                                    <input type="text" class="form-control Description" name="Description" disabled />
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Net Price <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                    <input type="text" class="form-control LPrice" name="ListPrice" autocomplete="off" onkeypress="return ValidateDecimalQty(event);" />
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Last Purchase Price
                                    <input type="text" class="form-control LastPurchase" name="LastPurchase" disabled />
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    HSN No
                                    <input type="text" class="form-control HSN" name="HSNNo" autocomplete="off" onkeypress="return ValidateDecimalQty(event);" />
                                </div>
                            </div>
                    </div>
                </div>
            </div>
    </div > `;

            var clonedDiv = $(template);

            clonedDiv.find('.js-example-basic-single').select2();
            fnDrpProductClone(SupplierId, productId, IsPONO, SPoNumber, clonedDiv);
            clonedDiv.find("input[name='quantity']").val(Quantity);
            clonedDiv.find("input[name='nameRev']").val(Received);
            clonedDiv.find("input[name='ListPrice']").val(LPrice);
            clonedDiv.find("input[name='HSNNo']").val(HSN);
            clonedDiv.find("input[name='Description']").val(Description);
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Inward.aspx/Getlastprice",
                data: "{ProductsId: '" + productId + "',IsPONO: '" + IsPONO + "'}",
                dataType: "json",
                success: function (data) {
                    clonedDiv.find("input[name='LastPurchase']").val(data.d.LastPrice);
                },
                error: function (result) {
                    alert("Failed to load last Product Price");
                }
            });

            // Remove the plus button from existing elements
            $('.clone-btn-right').hide();

            $("#dynamicContainer").append(clonedDiv);
        }

        function fnDrpProductClone(SupplierId, Products, IsPONO, SPoNumber, clonedDiv) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Inward.aspx/GetProduct",
                data: "{SupplierId: '" + SupplierId + "',IsPONO: '" + IsPONO + "',SPoNumber: '" + SPoNumber + "'}",
                dataType: "json",
                success: function (data) {
                    var dropdownOptions = '<option value="0">Select Product Name</option>';
                    $.each(data.d, function (key, value) {
                        dropdownOptions += "<option value='" + value.pid + "' data-Qty='" + value.Qty + "' data-Lprice='" + value.LPrice + "' data-LastPurchase='" + value.LastPurchase + "' data-Hsn='" + value.Hsn + "' data-Description='" + value.Description + "' data-LastInwardedQuantity='" + value.LastInwardedQuantity + "'>" + value.pname + "</option>";
                    });

                    clonedDiv.find(".drpProduct").html(dropdownOptions);
                    clonedDiv.find(".drpProduct").val(Products);
                },
                error: function (result) {
                    alert("Failed to load Product Name");
                }
            });
        }

        function ValidateDecimalQty(e) {
            var nameRev = e.nameRev || e.which;

            var lblError = document.getElementById("InwardId");
            lblError.nameRev = "input[name = 'nameRev']";

            //Regex for Valid Characters i.e. Alphabets.
            var regex = /^[0-9]*(\.[0-9]{0,2})?$/;

            //Validate TextBox value against the Regex.
            var isValid = regex.test(String.fromCharCode(nameRev));
            if (!isValid) {
                hasValue("input[name='nameRev']", "#spanReceived1", "Numbers Only Allowed");
            }
            else {
                $("#spanReceived1").text("");
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
            location.href = "InwardList.aspx";
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
                                                <h1 style="padding: 5px 0px 5px 10px;">Inward</h1>
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

                                            <div class="col-sm-4 " style="font-size: 16px;">
                                                Supplier Name <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                <select class="js-example-basic-single col-sm-2" id="drpSupplierId">
                                                </select>
                                                <span class="messages" id="spanSupplierName" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                <div><span class="messages"></span></div>
                                            </div>
                                            <div class="col-sm-4 " style="font-size: 16px;">
                                                P.O No 
                                                <select class="js-example-basic-single col-sm-2" id="drpPonumber">
                                                </select>
                                                <span class="messages" id="spanPONumber" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                <div><span class="messages"></span></div>
                                            </div>
                                            <div class="col-sm-4 " style="font-size: 16px;">
                                                Supplier Invoice No <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                <input type="text" class="form-control" id="txtSupplierInv" maxlength="250" autocomplete="off" oninput="$('#spanSupplierInv').text('')" />
                                                <span class="messages" id="spanSupplierInv" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                <div><span class="messages"></span></div>
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
                                        <h3 style="padding-bottom: 5px; font-weight: 600;">Product Details</h3>
                                        <div class="form-group row" id="dynamicContainer">
                                            <div class="col-sm-12">
                                                <div class="clone-widget cloneya-wrap original ">
                                                    <div class="unit widget left-50 right-50 toclone cloneya" style="padding-bottom: 10px;" id="pro">
                                                        <button type="button" class="btn btn-primary clone-btn-right clone" style="font-size: 10px; margin-top: -7px;">
                                                            <i class="icofont icofont-plus"></i>
                                                        </button>
                                                        <tb>
                                                            <button type="button" class="addon-btn adn-50 adn-left delete">
                                                                <i class="icofont icofont-minus"></i>
                                                            </button>
                                                            <div class="form-group row">
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Product <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                                    <select class="drpProduct js-example-basic-single col-sm-12" name="nameProduct" id="drpProduct"></select>
                                                                </div>

                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Quantity 
                                                                    <input type="text" class="form-control Quantity" id="Qty_{{index}}" name="quantity" disabled />
                                                                </div>

                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Last Inward Quantity 
                                                                    <input type="text" class="form-control LastInwardedQuantity" id="LastQty_{{index}}" name="LastInwardedQuantity" disabled />
                                                                </div>

                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Inward Quantity 

                                                                    <input type="text" class="form-control Received" placeholder="Inward Qty" name="nameRev" id="txtRe_{{index}}" autocomplete="off" onkeypress="return ValidateDecimalQty(event);" />
                                                                    <span class="messages" id="spanRev" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                                </div>

                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Description 
                                                                    <input type="text" class="form-control Description" name="Description" disabled />
                                                                </div>
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Net Price <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                                    <input type="text" class="form-control LPrice" name="ListPrice" autocomplete="off" onkeypress="return ValidateDecimalQty(event);" />
                                                                </div>
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Last Purchase Price 
                                                                    <input type="text" class="form-control LastPurchase" name="LastPurchase" disabled />
                                                                </div>
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    HSN No 
                                                                    <input type="text" class="form-control HSN" name="HSNNo" autocomplete="off" onkeypress="return ValidateDecimalQty(event);" />
                                                                </div>
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group row" style="padding-top: 30px;">
                                            <div class="col-sm-12">
                                                <center>
                                                    <input type="button" class="btn btn-success f-w-100" style="width: 70px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnSubmit" value="Submit" onclick="SaveInward()" />
                                                    <input type="button" class="btn btn-success f-w-100" style="width: 70px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnBack" value="Cancel" onclick="BackToList()" />
                                                </center>

                                            </div>
                                        </div>

                                        <span id="spanReceived" style="color: red; font-size: 15px"></span>
                                        <span id="spanReceived1" style="color: red; font-size: 15px"></span>
                                        <span class="messages" id="spandrpProduct" style="color: red; font-size: 15px"></span>
                                        <span class="messages" id="spanQuantity" style="color: red; font-size: 15px"></span>
                                        <span class="messages" id="spanLPrice" style="color: red; font-size: 15px"></span>

                                        <input type="hidden" id="InwardId" value="0" />
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

    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="files/bower_components/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="files/bower_components/modernizr/modernizr.js"></script>
    <script type="text/javascript" src="files/bower_components/modernizr/feature-detects/css-scrollbars.js"></script>

    <script type="text/javascript">
        var Inward = function () {
            var self = this;
            this.InwardId = ko.observable(0);
            this.SupplierId = ko.observable(0);
            this.IsPONO = ko.observable(0);
            this.SupplierInv = ko.observable('');
            this.PONumberId = ko.observable('');
            this.ProductsId = ko.observable(0);
            this.Qty = ko.observable('');
            this.ReceievedQty = ko.observable(0);
            this.LPrice = ko.observable(0);
            this.HSN = ko.observable(0);
            this.Description = ko.observable(0);

        };
    </script>
</asp:Content>

