<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="Invoice.aspx.cs" Inherits="Invoice" %>

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
    <!-- jpro forms css -->
    <link rel="stylesheet" type="text/css" href="files/assets/pages/j-pro/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/j-pro/css/font-awesome.min.css" />

    <script type="text/javascript">
        $(document).ready(function () {
            var objUrlParams = new URLSearchParams(window.location.search);
            var InvoiceId = objUrlParams.get('InvoiceId');

            if (InvoiceId != null) {
                BindInvoice(InvoiceId);

            }
            else {
                Bindinvoicenumber();
                fnDrpSupplier(0);
                fnDrpProduct(0, -99);
                fnDrpProjectID(0);
                fnDrpCustomerPO(0);
            }

            $("#Date").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: false,
                changeYear: false,
                yearRange: '1924:' + (new Date).getFullYear()

            });
            $("#drpPid").attr('disabled', true);
            $("#divPid").attr('hidden', false);

            $("#drpPrjTypeId").change(function () {
                $("#spandrpPrjTypeId").text("");
                var Type = $(this).val();
                if (Type == 1) {
                    $("#drpPid").attr('disabled', false);
                    $("#divPid").attr('hidden', false);
                    $("#divNpid").attr('hidden', true);
                    $("#divCustomerPO").attr('hidden', true);
                    $("#drpCustomerPO").val(0).trigger('change.select2');
                    $("#txtNpid").val("");
                    $("#spantxtNpid").text("");
                    $("#spandrpPid").text("");
                    $("#spandrpCustomerPO").text("");
                } else if (Type == 2) {
                    $("#divPid").attr('hidden', true);
                    $("#divNpid").attr('hidden', false);
                    $("#divCustomerPO").attr('hidden', true);
                    $("#drpPid").val(0).trigger('change.select2');
                    $("#drpCustomerPO").val(0).trigger('change.select2');
                    $("#spantxtNpid").text("");
                    $("#spandrpPid").text("");
                    $("#spandrpCustomerPO").text("");
                } else if (Type == 3) {
                    $("#divPid").attr('hidden', true);
                    $("#divNpid").attr('hidden', true);
                    $("#divCustomerPO").attr('hidden', false);
                    $("#drpPid").val(0).trigger('change.select2');
                    $("#txtNpid").val("");
                    $("#spantxtNpid").text("");
                    $("#spandrpPid").text("");
                    $("#spandrpCustomerPO").text("");

                } else {
                    $("#divPid").attr('hidden', false);
                    $("#divNpid").attr('hidden', true);
                    $("#divCustomerPO").attr('hidden', true);
                    $("#drpPid").val(0).trigger('change.select2');
                    $("#drpPid").attr('disabled', true);
                    $("#txtNpid").val("");
                    $("#drpCustomerPO").val(0).trigger('change.select2');
                    $("#spantxtNpid").text("");
                    $("#spandrpPid").text("");
                    $("#spandrpCustomerPO").text("");
                }
            });

            $("#drpPid").change(function () {

                $("#spandrpPid").text("");

            });

            $("#drpCustomerPO").change(function () {

                $("#spandrpCustomerPO").text("");

            });

            $("#drpInvType").change(function () {
                $("#spandrpInvType").text("");
                var OutwardTypeId = $(this).val();
                fnDrpDCNumber(0, 0);
                fnDrpProduct(0, -99);
                $('.duplicate').remove();
                cloneDiv()
                $('.original').remove();
                reamount();

                if (OutwardTypeId > 0) {
                    if (OutwardTypeId == 3) {
                        reamount();
                        fnDrpDCNumber(0, 0);
                        $("#drpDcNo").attr('disabled', true);
                        fnDrpProduct(0, 0);
                        OTID = 0;
                    } else if (OutwardTypeId == 2) {
                        reamount();
                        $("#drpDcNo").attr('disabled', false);
                        fnDrpDCNumber(OutwardTypeId, 0);
                        fnDrpProduct(0, -2);
                        OTID = -2;
                    } else if (OutwardTypeId == 1) {
                        reamount();
                        $("#drpDcNo").attr('disabled', false);
                        fnDrpDCNumber(OutwardTypeId, 0);
                        fnDrpProduct(0, -1);
                        OTID = -1;
                    } else {
                        fnDrpProduct(0, -99);
                        OTID = -99;
                    }
                } else {
                    fnDrpDCNumber(0, 0);
                    fnDrpProduct(0, -99);
                    $('.duplicate').remove();
                    cloneDiv()
                    $('.original').remove();
                    reamount();
                }


            });

            $("#drpDcNo").change(function () {
                $("#spandrpDcNo").text("");
                var OutwardId = $(this).val();
                if (OutwardId > 0) {
                    fnDrpProduct(0, OutwardId);
                } else {
                    fnDrpProduct(0, -99);
                    $('.duplicate').remove();
                    cloneDiv()
                    $('.original').remove();
                    reamount();
                }
            });

            $("#txtNpid").keyup(function () {

                $("#spantxtNpid").text("");

            });

            $("#drpSupplierId").change(function () {
                var Customer = $("#drpSupplierId").val();
                var GstNo = $(this).find(":selected").attr("GstNo");
                var Address = $(this).find(":selected").attr("Address");

                if (Customer != '') {
                    $('#spanSupplierName')[0].innerText = "";
                    $("#txtGSTNo").val(GstNo);
                    $("#txtAddress").val(Address);
                }
                else {
                    $('#spanSupplierName')[0].innerText = "Select Customer Name";
                }

            });

            $("#hdnF").change(function () {

                var PoFile = $("#hdnF").val();

                if (PoFile != '') {
                    $('#Spanpoupload')[0].innerText = "";
                }
                else {
                    $('#Spanpoupload')[0].innerText = "Upload the Invoice file";
                }

            });



            $(document).on("change", ".drpProduct", function () {
                $(this).closest('.cloneya').find('.price').val('');
                $(this).closest('.cloneya').find('.Hsn').val('');
                $(this).closest('.cloneya').find('.stock').val('');
                $(this).closest('.cloneya').find('.Quantity').val(1);
                $(this).closest('.cloneya').find('.Discount').val(0);
                $(this).closest('.cloneya').find('.Amount').val('');
                $(this).closest('.cloneya').find('.LastPrice').val('');
                $('#spanStock').text('');
                $("#SpandrpProductIdCmn").text('');
                var feCo = $("#drpSupplierId").val();
                var feCoyt = $(this).val();
                $(this).closest('.cloneya').find('.messages').text('');

                if (feCoyt != '0' && feCoyt != '') {
                    IsCloneProdutActive = true;
                    var priceField = $(this).closest('.cloneya').find('.price');
                    var Hsn = $(this).closest('.cloneya').find('.Hsn');
                    var AmountField = $(this).closest('.cloneya').find('.Amount');
                    var SizeField = $(this).closest('.cloneya').find('.Size');
                    var DescriptionField = $(this).closest('.cloneya').find('.Description1');
                    var StockField = $(this).closest('.cloneya').find('.stock');
                    var LastPrice = $(this).closest('.cloneya').find('.LastPrice');
                    $(this).closest('.cloneya').find('.Quantity').val($(this).find(":selected").attr('OutwardedQty'));
                    $(this).closest('.cloneya').find('.Make').val($(this).find(":selected").attr('Make'));
                    $(this).closest('.cloneya').find('.Description').val($(this).find(":selected").attr('Description'));
                    productprice(feCoyt, priceField, Hsn, AmountField, SizeField, LastPrice);
                    DescriptionValue(feCoyt, DescriptionField);
                    StockAvailability(feCoyt, StockField);
                } else {
                    IsCloneProdutActive = false;
                    $(this).closest('.cloneya').find('.price').val('');
                    $(this).closest('.cloneya').find('.Hsn').val('');
                    $(this).closest('.cloneya').find('.Size').val('');
                    $(this).closest('.cloneya').find('.stock').val('');
                    $(this).closest('.cloneya').find('.Quantity').val(1);
                    $(this).closest('.cloneya').find('.Discount').val(0);
                    $(this).closest('.cloneya').find('.Amount').val('');
                    $(this).closest('.cloneya').find('.Description').val('');
                    $(this).closest('.cloneya').find('.LastPrice').val('');

                    reamount();

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
                var InvoiceId = objUrlParams.get('InvoiceId');
                if (InvoiceId == null && originallength == 1) {
                    original.remove();
                    cloneyaElement.remove();
                    cloneDiv();

                } else if (InvoiceId == null && originallength != 1 && cloneyaLength == 1) {
                    cloneyaElement.remove();
                    cloneDiv();

                } else if ((drpSupplierId != 0 || drpSupplierId == 0) && InvoiceId != null && cloneyaLength == 1 && originallength == 1) {
                    original.remove();
                    cloneyaElement.remove();
                    cloneDiv();
                } else if ((drpSupplierId != 0 || drpSupplierId == 0) && InvoiceId != null && cloneyaLength == 1 && originallength == 0) {
                    cloneyaElement.remove();
                    cloneDiv();
                } else {
                    cloneyaElement.remove();
                    $(".cloneya:last .clone-btn-right").show();
                }

            });

            $("#txtCgst").on("input", function () {
                var cgstValue = $(this).val();
                $("#txtSgst").val(cgstValue);
                validatePercentage(cgstValue, "txtCgst");

            });

            $("#txtSgst").on("input", function () {
                var sgstValue = $(this).val();
                $("#txtCgst").val(sgstValue);
                validatePercentage(sgstValue, "txtSgst");

            });

            //$(document).on("input", "input[name='nameDis']", function () {
            //    var Discount = $(this).val();
            //    validateDiscountPercentage(Discount, this);

            //    // Ensure the entered value is within the range of 0 to 100
            //    Discount = Math.min(100, Math.max(0, Discount));

            //    // Update the input value with the adjusted value
            //    $(this).val(Discount);
            //});

            $(document).on('keyup keydown', '.Quantity', function (event) {
                var Quantity = parseFloat($(this).val());
                var stock = parseFloat($(this).closest('.cloneya').find('.stock').val());

                if (Quantity > stock) {
                    $("#spanQty").text('Quantity exceeds stock limit');

                } else {
                    $("#spanQty").text('');
                }


            });


            var maxLen1 = 16;

            var ela = document.getElementById('txtIgst');
            $('#txtIgst').keypress(function (event) {
                var Length = $("#txtIgst").val().length;
                var AmountLeft = maxLen1 - Length;
                $('#txtIgst-length-left').html(AmountLeft);

                if (Length >= maxLen1) {
                    if (event.which != 8) {
                        $("#txtIgst").val(parseFloat($("#txtIgst").val()).toFixed(2));
                        $('#spantxtIgst').text('Only Allowed 18 Characters');

                        return false;
                    }
                }
                else {
                    $('#spantxtIgst').text('');
                    ela.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {
                            $('#spantxtIgst').html('');
                        }
                    });
                }
            });

            var maxLength = 16;

            var elaz = document.getElementById('txtCgst');
            $('#txtCgst').keypress(function (event) {
                var Length = $("#txtCgst").val().length;
                var AmountLeft = maxLength - Length;
                $('#txtCgst-length-left').html(AmountLeft);

                if (Length >= maxLength) {
                    if (event.which != 8) {
                        $("#txtCgst").val(parseFloat($("#txtCgst").val()).toFixed(2));
                        $('#spantxtCgst').text('Only Allowed 18 Characters');

                        return false;
                    }
                }
                else {
                    $('#spantxtCgst').text('');
                    elaz.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {
                            $('#spantxtCgst').html('');
                        }
                    });
                }
            });

            var maxLeg = 16;

            var elay = document.getElementById('txtSgst');
            $('#txtSgst').keypress(function (event) {
                var Length = $("#txtSgst").val().length;
                var AmountLeft = maxLeg - Length;
                $('#txtSgst-length-left').html(AmountLeft);

                if (Length >= maxLeg) {
                    if (event.which != 8) {
                        $("#txtSgst").val(parseFloat($("#txtSgst").val()).toFixed(2));
                        $('#spantxtSgst').text('Only Allowed 18 Characters');

                        return false;
                    }
                }
                else {
                    $('#spantxtSgst').text('');
                    elay.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {
                            $('#spantxtSgst').html('');
                        }
                    });
                }
            });

            var maxLegs = 16;

            var elax = document.getElementById('txtGVInvoice');
            $('#txtGVInvoice').keypress(function (event) {
                var Length = $("#txtGVInvoice").val().length;
                var AmountLeft = maxLegs - Length;
                $('#txtGVInvoice-length-left').html(AmountLeft);

                if (Length >= maxLegs) {
                    if (event.which != 8) {
                        $("#txtGVInvoice").val(parseFloat($("#txtGVInvoice").val()).toFixed(2));
                        $('#spanGvinvoice').text('Only Allowed 18 Characters');

                        return false;
                    }
                }
                else {
                    $('#spanGvinvoice').text('');
                    elax.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {
                            $('#spanGvinvoice').html('');
                        }
                    });
                }
            });

            var maxLengthValue = 18; // Maximum of 18 characters before adding decimal point and decimals

            $('#txtFrieghtCharges').on('input', function () {
                var inputValue = $(this).val();

                // Remove any non-numeric characters
                inputValue = inputValue.replace(/[^0-9]/g, '');

                // Limit the input value to a maximum of 18 characters
                if (inputValue.length > maxLengthValue) {
                    inputValue = inputValue.slice(0, maxLengthValue);
                }

                // Separate integer and decimal parts
                var integerPart = inputValue.slice(0, maxLengthValue - 2); // First 16 characters
                var decimalPart = inputValue.slice(maxLengthValue - 2);    // Last 2 characters

                // Combine integer and decimal parts with a decimal point
                var formattedValue = (decimalPart === '') ? integerPart : `${integerPart}.${decimalPart}`;

                $(this).val(formattedValue);

                var Length = formattedValue.length;
                var AmountLeft = maxLengthValue - Length;
                $('#txtFrieghtCharges-length-left').html(AmountLeft);

                if (Length >= maxLengthValue) {
                    $('#spanFrieghtChargesValue').text('Only Allowed 18 Digits');
                } else {
                    $('#spanFrieghtChargesValue').text('');
                }
            });

            var maxle = 250;
            var elb = document.getElementById('txtInvNumber');

            $('#txtInvNumber').keypress(function (event) {
                $("#spanInvNumber").text("");
                var Length = $("#txtInvNumber").val().length;
                var AmountLeft = maxle - Length;
                $('#txtInvNumber-length-left').html(AmountLeft);
                if (Length >= maxle) {
                    if (event.which != 8) {
                        $('#spanInvNumbers').text('Only Allowed 250 Characters');

                        return false;
                    }
                } else {
                    $('#spanInvNumbers').text('');
                    elb.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {

                            $('#spanInvNumbers').html('');
                        }

                    });
                }


            });

            $(document).on('keyup keydown', '.Quantity', function (event) {
                var Quantity = parseInt($(this).closest('.cloneya').find('.drpProduct option:selected').attr('OutwardedQty'));
                var EnteredQuantity = parseFloat($(this).val());
                var SpanMessage = $(this).closest('.cloneya').find('.messages');

                if (EnteredQuantity > Quantity) {
                    SpanMessage.text('Quantity exceeds (Available : ' + Quantity + ')');
                    isRcQtyOk = false;
                } else {
                    SpanMessage.text('');
                    isRcQtyOk = true;
                }
            });


        });

        var OTID = 0;

        function validatePercentage(value, fieldId) {
            var errorMessage = $("#spanPercentage");

            if (isNaN(value) || value < 0 || value > 100) {
                errorMessage.text("Percentage should be between 0 and 100");
                setTimeout(function () {
                    errorMessage.text("");
                }, 5000);
                $("#txtSgst").val(9);
                $("#txtCgst").val(9);


            } else {
                errorMessage.text("");
            }
        }

        function cloneDiv() {
            var template = `
            <div class="col-sm-12  cloneya duplicate ClonePortion">
                <div class="clone-widget cloneya-wrap">
                    <div class="unit widget left-50 right-50 " style="padding-bottom:10px;">
                        <button type="button" class="btn btn-primary clone-btn-right clone" style="font-size:10px;margin-top:-7px;">
                            <i class="icofont icofont-plus"></i>
                        </button><tb>
                            <button type="button" class="addon-btn adn-50 adn-left delete" >
                                <i class="icofont icofont-minus"></i>
                            </button>
                            <div class="form-group row">
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Product
                                    <select class="drpProduct js-example-basic-single col-sm-12" name="nameProduct" id="drpProduct" onchange="reamount();"></select>
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                                                Make 
                                                          <input type="text" class="form-control Make" id="Make_{{index}}" name="nameMake" autocomplete="off" disabled />
                                                            </div>
                                <div class="col-sm-3" style="font-size:16px;">Net Price
                                    <input type="text" class="form-control price" value="0.00" oninput="validateInput(this)" id="price_{{index}}" autocomplete="off" name="namePrice" onkeyup="reamount();" />
                                </div>

                                <div class="col-sm-3" style="font-size: 16px;">
                                    HSN
                                    <input type="text" class="form-control Hsn" id="Hsn_{{index}}" name="nameHsn" autocomplete="off" disabled />
                                </div>

                            </div>


                            <div class="form-group row" >
<div class="col-sm-4" style="font-size: 16px;">
                                                                Description
                                                          <input type="text" class="form-control Description" id="Description_{{index}}" name="Description" autocomplete="off" disabled />
                                                            </div>
                                <div class="col-sm-4" style="font-size:16px;">Quantity
                                <span class="messages" style="color: red; font-size: 15px"></span>
                                    <input type="text" class="form-control Quantity" value="1" placeholder="Quantity" autocomplete="off" name="nameQty" id="txtqty_{{index}}" onkeyup="reamount();" onkeypress="return ValidateDecimalQty(event);" />
                                </div>
                                <div class="col-sm-4" style="font-size:16px;">Profit Percentage
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon2">%</span>
                                        </div>
                                        <input type="text" class="form-control Discount" value="0" placeholder="Discount" name="nameDis" id="txtdis_{{index}}" autocomplete="off" onkeyup="reamount();" oninput="ValidateDecimal(this,'spanPercentage')" />
                                    </div>                </div>
</div>
<div class="form-group row" >
                                    <div class="col-sm-4" style="font-size: 16px;">
                                                                Selling cost / Each
                                                              <input type="text" class="form-control SellingCost" value="" name="nameSellingCost" id="txtSellingCost_{{index}}" disabled />
                                                            </div>
                                <div class="col-sm-4" style="font-size:16px;">Total Amount
                                    <input type="text" class="form-control Amount" value="" name="nameAmount" id="txtamount_{{index}}" disabled />
                                </div>
                                <div class="col-sm-4" style="font-size: 16px;">
                                    Last Invoice Price
                                    <input type="text" class="form-control LastPrice" name="LastPrice" disabled />
                                </div>
                            </div>
                    </div>
                </div>
            </div> `;

            var clonedDiv = $(template);

            clonedDiv.find('.js-example-basic-single').select2();


            $('.clone-btn-right').hide();
            var OutwardId = $('#drpDcNo').val();

            $("#dynamicContainer").append(clonedDiv);

            fnDrpProductClone(0, OTID, clonedDiv);
        }

        function Bindinvoicenumber() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Invoice.aspx/Bindinvoicenumber",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    if (data.d != null) {
                        if (data.d.InvoiceNo) {

                            $("#txtInvoiceno").val(data.d.InvoiceNo);

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


        function fnDrpSupplier(SupplierId) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Invoice.aspx/BindSupplier",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    $("#drpSupplierId").html("");
                    $("#drpSupplierId").append($("<option></option>").val('0').html('Select Customer Name'));
                    $.each(data.d, function (key, value) {
                        $("#drpSupplierId").append($("<option></option>").val(value.SID).html(value.SName).attr('GstNo', value.GstNo).attr('Address', value.Address));
                    });
                    $("#drpSupplierId").val(SupplierId);
                },
                error: function (result) {
                    alert("Failed to load Customer Name");
                }
            });

        }

        function fnDrpDCNumber(OutwardTypeId, DCNo) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Invoice.aspx/GetDCNumberDrp",
                data: "{OutwardTypeId: '" + OutwardTypeId + "'}",
                dataType: "json",
                success: function (data) {
                    $("#drpDcNo").html("");
                    $("#drpDcNo").append($("<option></option>").val('0').html('Select DC Number'));
                    $.each(data.d, function (key, value) {
                        $("#drpDcNo").append($("<option></option>").val(value.OutwardId).html(value.DCNo));
                    });
                    $("#drpDcNo").val(DCNo);
                },
                error: function (result) {
                    alert("Failed to load DC Number");
                }
            });

        }
        function fnDrpProjectID(ProjectID) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Invoice.aspx/GetProjectId",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    $("#drpPid").html("");
                    $("#drpPid").append($("<option></option>").val('0').html('Select Project ID'));
                    $.each(data.d, function (key, value) {
                        $("#drpPid").append($("<option></option>").val(value.ProjectID).html(value.Project));
                    });
                    $("#drpPid").val(ProjectID);
                },
                error: function (result) {
                    alert("Failed to load Project ID");
                }
            });

        }
        function fnDrpCustomerPO(CustomerPOID) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Invoice.aspx/GetCustomerPO",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    $("#drpCustomerPO").html("");
                    $("#drpCustomerPO").append($("<option></option>").val('0').html('Select CustomerPO'));
                    $.each(data.d, function (key, value) {
                        $("#drpCustomerPO").append($("<option></option>").val(value.CustomerPOID).html(value.CustomerPOName));
                    });
                    $("#drpCustomerPO").val(CustomerPOID);
                },
                error: function (result) {
                    alert("Failed to load CustomerPO ID");
                }
            });

        }


        function productprice(ProductsID, priceField, Hsn, AmountField, SizeField, LastPrice) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Invoice.aspx/getprice",
                data: "{ProductsID: '" + ProductsID + "'}",
                dataType: "json",
                success: function (data) {
                    priceField.val(data.d.LPrice);
                    Hsn.val(data.d.Hsn);
                    SizeField.val(data.d.Size);
                    AmountField.val(data.d.LPrice);
                    LastPrice.val(data.d.LastPrice);
                    var totalAmount = 0;

                    $('.cloneya').each(function () {
                        var price = $(this).find('.price').val();
                        var quantity = $(this).find('[name="nameQty"]').val();
                        var discount = $(this).find('[name="nameDis"]').val();

                        var SellingCost = parseFloat(price) + (parseFloat(price) * (parseInt(discount) / 100));
                        var amount = SellingCost * quantity;
                        $(this).find('[name="nameSellingCost"]').val(SellingCost.toFixed(2));
                        $(this).find('[name="nameAmount"]').val(amount.toFixed(2));
                        totalAmount += amount;
                    });

                    var sum = 0;

                    $('.Amount').each(function () {
                        var amount = parseFloat($(this).val());
                        if (!isNaN(amount)) {
                            sum += amount;
                        }
                    });
                    var FrieghtCharges = parseFloat(document.getElementById("txtFrieghtCharges").value);
                    var CGSTPercent = parseFloat(document.getElementById("txtCgst").value);
                    var SGSTPercent = parseFloat(document.getElementById("txtSgst").value);
                    var CGST = (sum * (CGSTPercent / 100));
                    var SGST = (sum * (SGSTPercent / 100));
                    var Total = sum + CGST + SGST;
                    var GrandTotal = Total + FrieghtCharges;

                    $("#txtTotalInvoice").val(Total.toFixed(2));
                    $("#txtGrandTotal").val(GrandTotal.toFixed(2));

                },
                error: function (result) {
                    alert("Failed to load Product Price");
                }
            });
        }

        function DescriptionValue(ProductsID, DescriptionField) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Invoice.aspx/BindPrevOutwardQty",
                data: "{ProductsID: '" + ProductsID + "'}",
                dataType: "json",
                success: function (data) {
                    if (data.d.PrevOutwardQty > 0) {
                        DescriptionField.val("Previous Outwarded Quantity : " + data.d.PrevOutwardQty);
                    } else {
                        DescriptionField.val("No Data Available.");
                    }
                },
                error: function (result) {
                    alert("Failed to load Product Price");
                }
            });
        }
        function StockAvailability(ProductsID, StockField) {


            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Invoice.aspx/BindStockAvailability",
                data: "{ProductsID: '" + ProductsID + "'}",
                dataType: "json",
                success: function (data) {
                    StockField.val(data.d.StockAvailability);

                },
                error: function (result) {
                    alert("Failed to load StockAvailability");
                }
            });
        }


        function fnDrpProduct(Products, OutwardId) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Invoice.aspx/getproduct",
                data: "{OutwardId: '" + OutwardId + "'}",
                dataType: "json",
                success: function (data) {

                    $(".drpProduct").html("");
                    $(".drpProduct").append($("<option></option>").val('0').html('Select Product Name'));
                    $.each(data.d, function (key, value) {
                        $(".drpProduct").append($("<option></option>").val(value.ProductsID).html(value.ProductsName).attr('Make', value.Make).attr('Description', value.Description).attr('OutwardedQty', value.OutwardedQty));

                    });
                    $(".drpProduct").val(Products);
                    reamount();
                },
                error: function (result) {
                    alert("Failed to load Product Name");
                }
            });
        }

        function UploadFile(ctrlName) {
            $('#Spanpoupload').text('');
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

        var isRcQtyOk = true; // Global variable to store the received quantity validity
        var IsCloneProdutActive = false;

        function Saveinvoice() {

            var rlid = $('#<%= userIdHiddenField.ClientID %>').val();
            var isValid = true;
            if (rlid == 2) { //Condition 1
                isValid = isValid &&
                    hasValue("#Date", "#spanDate", "Choose the Invoice Date") &&
                    hasValue("#txtInvNumber", "#spanInvNumber", "Enter the Invoice Number") &&
                    hasValue("#hdnF", "#Spanpoupload", "Upload the Invoice File");

            } else {
                if (isValid = isValid && hasddlValue("#drpPrjTypeId", "#spandrpPrjTypeId", "Select project type")) {
                    if ($('#drpPrjTypeId').val() == "1") {
                        isValid = hasddlValue("#drpPid", "#spandrpPid", "Select project Id");
                    } else if ($('#drpPrjTypeId').val() == "3") {
                        isValid = hasddlValue("#drpCustomerPO", "#spandrpCustomerPO", "Select CustomerPO");
                    } else {
                        isValid = hasValue("#txtNpid", "#spantxtNpid", "Enter the non-project Id");
                    }
                    isValid = isValid && hasddlValue("#drpInvType", "#spandrpInvType", "Select Invoice Type")
                    if ($('#drpInvType').val() != 3) {
                        isValid = isValid && hasddlValue("#drpDcNo", "#spandrpDcNo", "Select DC Number")
                    }
                    isValid = isValid && hasddlValue("#drpSupplierId", "#spanSupplierName", "Select Customer Name")

                }
                if (isValid) { //Condition 3


                    var parentContainers = $('#dynamicContainer').find('.cloneya');
                    var hasZeroValue = false;
                    parentContainers.each(function () {
                        var container = $(this);
                        var dropdown = container.find('.drpProduct');
                        if (dropdown.val() === '0') {
                            hasZeroValue = true;
                            return false;
                        }
                    });
                    if ((isValid == true) && hasZeroValue) {//Condition 2
                        isValid = false;
                        $("#SpandrpProductIdCmn").text("Please select Dropdown");
                        return;
                    }
                    if (isRcQtyOk == true && IsCloneProdutActive == true) { //Condition 3
                        isValid = true;
                    } else {
                        isValid = false;
                    }
                }
            }

            if (isValid && isRcQtyOk) {
                //ProductID
                var nameProduct = document.getElementsByName("nameProduct");
                var ProductsId = [];
                for (var i = 0; i < nameProduct.length; i++) {
                    ProductsId.push(nameProduct[i].value);
                }

                //Price
                var namePrice = document.getElementsByName("namePrice");
                var LPrice = [];
                for (var i = 0; i < namePrice.length; i++) {
                    LPrice.push(namePrice[i].value);
                }
                //Hsn
                var nameHsn = document.getElementsByName("nameHsn");
                var Hsn = [];
                for (var i = 0; i < nameHsn.length; i++) {
                    Hsn.push(nameHsn[i].value);
                }

                //Qty
                var nameQty = document.getElementsByName("nameQty");
                var Qty = [];
                for (var i = 0; i < nameQty.length; i++) {
                    Qty.push(nameQty[i].value);
                }

                // Description
                var nameDescription = document.getElementsByName("Description");
                var Description = [];
                for (var i = 0; i < nameDescription.length; i++) {
                    var value = nameDescription[i].value.trim();
                    Description.push(value ? value : '-');
                }


                //Discount
                var nameDis = document.getElementsByName("nameDis");
                var Discount = [];
                for (var i = 0; i < nameDis.length; i++) {
                    Discount.push(nameDis[i].value);
                }
                var inObj = new invoice();
                inObj.InvoiceId = $('#InvoiceId').val();
                inObj.SupplierId = $('#drpSupplierId').val();
                inObj.InvoiceNo = $('#txtInvoiceno').val();
                inObj.InvoiceDate = $('#Date').val();
                inObj.InvNo = $('#txtInvNumber').val();
                inObj.DocFileName = $('#hdnF').val();
                inObj.PIdType = $('#drpPrjTypeId').val();
                inObj.PId = $('#drpPid').val();
                inObj.NPId = $('#txtNpid').val();
                inObj.CustomerPO = $('#drpCustomerPO').val();
                inObj.PaymentTerms = $('#txtPaymentTerms').val();
                inObj.DeliveryPeriod = $('#txtDeliveryPeriod').val();
                inObj.GstNo = $('#txtGSTNo').val();
                inObj.Address = $('#txtAddress').val();
                inObj.InvType = $('#drpInvType').val();
                inObj.DcNo = $('#drpDcNo').val();

                inObj.FrieghtCharges = $('#txtFrieghtCharges').val();
                inObj.Cgst = $('#txtCgst').val();
                inObj.Sgst = $('#txtSgst').val();


                inObj.LPrice = LPrice.toString();
                inObj.Hsn = Hsn.toString();
                inObj.Discount = Discount.toString();
                inObj.Qty = Qty.toString();
                inObj.Description = Description.toString();
                inObj.ProductsId = ProductsId.toString();
                $("#btnSubmit").attr("disabled", true);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Invoice.aspx/SaveOrUpdateinvoice",
                    data: "{inObj : " + ko.toJSON(inObj) + "}",
                    dataType: "json",
                    success: function (data) {
                        if (data.d != "") {

                            var inserted = data.d;
                            if (inserted != null) {
                                location.href = "InvoiceList.aspx?flagId=" + data.d;

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



        function BindInvoice(InvoiceId) {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Invoice.aspx/BindEditInvoice",
                data: "{ 'InvoiceId': " + InvoiceId + " }",
                dataType: "json",
                success: function (data) {
                    if (data.d != null) {
                        $('#InvoiceId').val(data.d.InvoiceId);
                        $('#txtInvoiceno').val(data.d.InvoiceNo);
                        $('#txtInvNumber').val(data.d.InvNo);
                        $('#drpPrjTypeId').val(data.d.PIdType).trigger('change.select2');
                        fnDrpProjectID(data.d.PId);
                        fnDrpCustomerPO(data.d.CustomerPO);
                        $('#txtNpid').val(data.d.NPId);
                        if (data.d.PIdType == 1) {
                            $("#divPid").attr('hidden', false);
                            $("#divNpid").attr('hidden', true);
                            $("#divCustomerPO").attr('hidden', true);
                        } else if (data.d.PIdType == 2) {
                            $("#divPid").attr('hidden', true);
                            $("#divNpid").attr('hidden', false);
                            $("#divCustomerPO").attr('hidden', true);
                        } else if (data.d.PIdType == 3) {
                            $("#divPid").attr('hidden', true);
                            $("#divNpid").attr('hidden', true);
                            $("#divCustomerPO").attr('hidden', false);
                        } else {
                            $("#divPid").attr('hidden', false);
                            $("#divNpid").attr('hidden', true);
                            $("#divCustomerPO").attr('hidden', true);
                        }
                        $('#txtPaymentTerms').val(data.d.PaymentTerms);
                        $('#txtDeliveryPeriod').val(data.d.DeliveryPeriod);
                        $('#txtGSTNo').val(data.d.GstNo);
                        $('#txtAddress').val(data.d.Address);
                        $('#drpInvType').val(data.d.InvType).trigger('change.select2');
                        fnDrpDCNumber(data.d.InvType, data.d.DcNo);

                        $('#Date').val(data.d.InvoiceDate);
                        $('#txtFrieghtCharges').val(data.d.FrieghtCharges);
                        $('#txtCgst').val(data.d.Cgst);
                        $('#txtSgst').val(data.d.Sgst);
                        $('#hdnF').val(data.d.DocFileName);
                        $('#fExists').text(data.d.DocFileName);

                        fnDrpSupplier(data.d.SupplierId);

                        refind();

                        var ProductsId = data.d.ProductsId.split(",");
                        var Lprice = data.d.LPrice.split(",");
                        var Hsn = data.d.Hsn.split(",");
                        var Qty = data.d.Qty.split(",");
                        var Discount = data.d.Discount.split(",");


                        if (data.d.ProductsId == "" || data.d.ProductsId == null) {
                            fnDrpProduct(0, 0);
                            $(this).closest('.cloneya').find('.Quantity').val(1);
                            $(this).closest('.cloneya').find('.Discount').val(0);

                        }
                        if (data.d.productsId != "" || data.d.productsId != null) {
                            for (var i = 0; i < ProductsId.length; i++) {

                                cloneDivEdit(ProductsId[i], data.d.DcNo, Lprice[i], Hsn[i], Qty[i], Discount[i]);
                            }

                        }
                        IsCloneProdutActive = true;
                        var rlid = $('#<%= userIdHiddenField.ClientID %>').val();
                        if (rlid == 2) {
                            $(".price").attr("disabled", true);
                            $(".Quantity").attr("disabled", true);
                            $(".Discount").attr("disabled", true);
                            $(".drpProduct").attr("disabled", true);
                            $(".txtCgst").attr("disabled", true);
                            $(".txtSgst").attr("disabled", true);
                            $(".FrieghtCharges").attr("disabled", true);
                        }
                    }
                    else {
                        alert('Failed to load data');
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

        function cloneDivEdit(productId, OutwardId, listPrice, Hsn, quantity, discount) {
            $('#pro').remove();
            var template = `
            <div class="col-sm-12   cloneya duplicate EditDuplicate ClonePortion">
                <div class="clone-widget cloneya-wrap">
                    <div class="unit widget left-50 right-50 " style="padding-bottom:10px;">
                        <button type="button" class="btn btn-primary clone-btn-right clone" style="font-size:10px;margin-top:-7px;">
                            <i class="icofont icofont-plus"></i>
                        </button><tb>
                            <button type="button" class="addon-btn adn-50 adn-left delete" >
                                <i class="icofont icofont-minus"></i>
                            </button>
                            <div class="form-group row" >
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Product
                                    <select class="drpProduct js-example-basic-single col-sm-12" name="nameProduct" id="drpProduct" onchange="reamount();"></select>
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                                                Make
                                                          <input type="text" class="form-control Make" id="Make_{{index}}" name="nameMake" autocomplete="off" disabled />
                                                            </div>
                                <div class="col-sm-3" style="font-size:16px;">Net Price
                                    <input type="text" class="form-control price" value="0.00" oninput="validateInput(this)" autocomplete="off" id="price_{{index}}" name="namePrice" onkeyup="reamount();"/>
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    HSN
                                    <input type="text" class="form-control Hsn" id="Hsn_{{index}}" name="nameHsn" autocomplete="off" disabled />
                                </div>

                            </div>

                            <div class="form-group row" >
<div class="col-sm-4" style="font-size: 16px;">
                                                                Description
                                                          <input type="text" class="form-control Description" id="Description_{{index}}" name="Description" autocomplete="off" disabled />
                                                            </div>
                                <div class="col-sm-4" style="font-size:16px;">Quantity
                                <span class="messages" style="color: red; font-size: 15px"></span>
                                    <input type="text" class="form-control Quantity" value="1" placeholder="Quantity" autocomplete="off" name="nameQty" id="txtqty_{{index}}" onkeyup="reamount();" onkeypress="return ValidateDecimalQty(event);" />
                                </div>
                                <div class="col-sm-4" style="font-size:16px;">Profit Percentage
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon2">%</span>
                                        </div>
                                        <input type="text" class="form-control Discount" value="0" placeholder="Discount" name="nameDis" id="txtdis_{{index}}" autocomplete="off" onkeyup="reamount();" oninput="ValidateDecimal(this,'spanPercentage')" />
                                    </div>
                                </div>
</div>
<div class="form-group row" >
                                <div class="col-sm-4" style="font-size: 16px;">
                                                                Selling cost / Each
                                                              <input type="text" class="form-control SellingCost" value="" name="nameSellingCost" id="txtSellingCost_{{index}}" disabled />
                                                            </div>
                                <div class="col-sm-4" style="font-size:16px;">Total Amount
                                    <input type="text" class="form-control Amount" value="" name="nameAmount" id="txtamount_{{index}}" disabled />
                                </div>
                                <div class="col-sm-4" style="font-size: 16px;">
                                    Last Invoice Price
                                    <input type="text" class="form-control LastPrice" name="LastPrice" disabled />
                                </div>
                            </div>
                    </div>
                </div>
            </div>
       </div > `;

            var clonedDiv = $(template);

            clonedDiv.find('.js-example-basic-single').select2();
            //fnDrpProductClone(productId, OutwardId, clonedDiv);
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Invoice.aspx/getproductnameEdit",
                data: "{OutwardId: '" + OutwardId + "'}",
                dataType: "json",
                success: function (data) {
                    var dropdownOptions = '<option value="0">Select Product Name</option>';
                    $.each(data.d, function (key, value) {
                        var option = $("<option></option>").val(value.ProductsID).html(value.ProductsName).attr('Make', value.Make).attr('Description', value.Description).attr('OutwardedQty', value.OutwardedQty);
                        dropdownOptions += option[0].outerHTML;
                    });

                    clonedDiv.find(".drpProduct").html(dropdownOptions);
                    clonedDiv.find(".drpProduct").val(productId);
                    clonedDiv.find(".Make").val(clonedDiv.find(".drpProduct").find(":selected").attr('Make'));
                    clonedDiv.find(".Description").val(clonedDiv.find(".drpProduct").find(":selected").attr('Description'));
                    reamount();
                },
                error: function (result) {
                    alert("Failed to load Product Name");
                }
            });
            clonedDiv.find("input[name='namePrice']").val(listPrice);
            clonedDiv.find("input[name='nameHsn']").val(Hsn);
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Invoice.aspx/getprice",
                data: "{ProductsID: '" + productId + "'}",
                dataType: "json",
                success: function (data) {
                    clonedDiv.find("input[name='LastPrice']").val(data.d.LastPrice);
                }
            });
            var DescriptionField = clonedDiv.closest('.cloneya').find('.Description1');
            DescriptionValue(productId, DescriptionField);

            var StockField = clonedDiv.closest('.cloneya').find('.stock');
            StockAvailability(productId, StockField)
            if (listPrice == "" || listPrice == null) {
                clonedDiv.find("input[name='nameQty']").val(1);
                clonedDiv.find("input[name='nameDis']").val(0);
            } else {
                clonedDiv.find("input[name='nameQty']").val(quantity);
                clonedDiv.find("input[name='nameDis']").val(discount);
            }

            // Remove the plus button from existing elements
            $('.clone-btn-right').hide();

            $("#dynamicContainer").append(clonedDiv);

            var rlid = $('#<%= userIdHiddenField.ClientID %>').val();
            if (rlid == 2) {
                $("select:not(.Accountant), input:not(.Accountant), textarea:not(.Accountant)").prop("disabled", true);
                $(".clone-btn-right, .adn-left").hide();
            }
        }

        function fnDrpProductClone(Products, OutwardId, clonedDiv) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Invoice.aspx/getproduct",
                data: "{OutwardId: '" + OutwardId + "'}",
                dataType: "json",
                success: function (data) {
                    var dropdownOptions = '<option value="0">Select Product Name</option>';
                    $.each(data.d, function (key, value) {
                        var option = $("<option></option>").val(value.ProductsID).html(value.ProductsName).attr('Make', value.Make).attr('Description', value.Description).attr('OutwardedQty', value.OutwardedQty);
                        dropdownOptions += option[0].outerHTML;
                    });

                    clonedDiv.find(".drpProduct").html(dropdownOptions);
                    clonedDiv.find(".drpProduct").val(Products);
                    clonedDiv.find(".Make").val(clonedDiv.find(".drpProduct").find(":selected").attr('Make'));
                    reamount();
                },
                error: function (result) {
                    alert("Failed to load Product Name");
                }
            });
        }

        function BackToList() {
            location.href = "InvoiceList.aspx";
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

        function ValidateDecimalCGST(e) {
            var Cgst = e.Cgst || e.which;

            var lblError = document.getElementById("InvoiceId");
            lblError.Cgst = "txtCgst";

            //Regex for Valid Characters i.e. Alphabets.
            var regex = /^[0-9]*(\.[0-9]{0,2})?$/;

            //Validate TextBox value against the Regex.
            var isValid = regex.test(String.fromCharCode(Cgst));
            if (!isValid) {
                (hasValue("#txtCgst", "#spanDcgst", "Numbers Only Allowed"));
            }
            else {
                $("#spanDcgst").text("");
            }
            return isValid;
        }

        function ValidateDecimalSGST(e) {
            var Sgst = e.Sgst || e.which;

            var lblError = document.getElementById("InvoiceId");
            lblError.Sgst = "txtSgst";

            //Regex for Valid Characters i.e. Alphabets.
            var regex = /^[0-9]*(\.[0-9]{0,2})?$/;

            //Validate TextBox value against the Regex.
            var isValid = regex.test(String.fromCharCode(Sgst));
            if (!isValid) {
                (hasValue("#txtSgst", "#spanDsgst", "Numbers Only Allowed"));
            }
            else {
                $("#spanDsgst").text("");
            }
            return isValid;
        }

        function ValidateDecimalQty(e) {
            var nameQty = e.nameQty || e.which;

            var lblError = document.getElementById("InvoiceId");
            lblError.nameQty = "input[name = 'nameQty']";

            //Regex for Valid Characters i.e. Alphabets.
            var regex = /^[0-9]*(\.[0-9]{0,2})?$/;

            //Validate TextBox value against the Regex.
            var isValid = regex.test(String.fromCharCode(nameQty));
            if (!isValid) {
                hasValue("input[name='nameQty']", "#spanQty", "Numbers Only Allowed");
            } else {
                $("#spanQty").text("");
            }
            return isValid;
        }

        function ValidateDecimalDis(e) {
            var nameDis = e.nameDis || e.which;

            var lblError = document.getElementById("InvoiceId");
            lblError.nameDis = "input[name='nameDis']";

            //Regex for Valid Characters i.e. Alphabets.
            var regex = /^[0-9]*(\.[0-9]{0,2})?$/;

            //Validate TextBox value against the Regex.
            var isValid = regex.test(String.fromCharCode(nameDis));
            if (!isValid) {
                hasValue("input[name='nameDis']", "#spanDis", "Enter the Valid Percentage (0 - 100%)");
            } else {
                $("#spanDis").text("");
            }
            return isValid;
        }

        function validateInput(inputElement) {
            // Get the current value of the input
            let inputValue = inputElement.value;
            var errorMessage = document.getElementById('spanPrice');

            // Remove any non-numeric characters from the input
            let numericValue = inputValue.replace(/[^0-9.]/g, '');

            // Update the input value with the numeric-only value
            inputElement.value = numericValue;
            if (/[^0-9.]/.test(inputValue)) {
                errorMessage.textContent = 'Only numeric values are allowed';
            } else {
                errorMessage.textContent = '';
            }
        }

        function ValidateDecimal(ID, SpanID) {
            var inputValue = $(ID).val();
            var decimalRegex = /^\d{1,18}(\.\d{0,2})?$/;

            if (inputValue === "") {
                $('#' + SpanID).text('');
                return true;
            }

            if (!decimalRegex.test(inputValue)) {
                $('#' + SpanID).text('Enter the valid decimal');

                // Remove non-numeric characters and limit the decimal part to 2 digits
                var sanitizedValue = inputValue.replace(/[^0-9.]/g, '');
                var decimalIndex = sanitizedValue.indexOf('.');

                if (decimalIndex !== -1) {
                    var integerPart = sanitizedValue.substr(0, decimalIndex);
                    var decimalPart = sanitizedValue.substr(decimalIndex + 1, 2);
                    ID.value = integerPart + '.' + decimalPart;
                } else {
                    ID.value = sanitizedValue.substr(0, 18);
                }

                return false;
            } else {
                $('#' + SpanID).text('');
            }

            return true;
        }

        function validateDecimalInput(inputElement) {
            // Get the current value of the input
            let inputValue = inputElement.value;
            var errorMessage = document.getElementById('spanPercentage');

            // Remove any non-numeric characters from the input
            let numericValue = inputValue.replace(/[^0-9.]/g, '');

            // Parse the numeric value as a float
            let parsedValue = parseFloat(numericValue);

            // Check if the parsed value is within the range of 0 to 100
            if (isNaN(parsedValue) || parsedValue < 0 || parsedValue > 100) {
                errorMessage.textContent = 'Only numeric values from 0 to 100 are allowed';

                // Find the closest ancestor with class 'cloneya'
                $(inputElement).closest('.cloneya').find('.Discount').val(0);


            } else {
                errorMessage.textContent = '';
            }

            // Update the input value with the numeric-only value
            inputElement.value = numericValue;
        }

        function validatePercentage(value, fieldId) {
            var errorMessage = $("#spanPercentage");

            if (isNaN(value) || value < 0 || value > 100) {
                errorMessage.text("Percentage should be between 0 and 100");
                $(fieldId).closest('.cloneya').find('.Discount').val(0);

                setTimeout(function () {
                    errorMessage.text("");
                }, 5000);
                $("#txtSgst").val(9);
                $("#txtCgst").val(9);


            } else {
                errorMessage.text("");
            }
        }
        function validateDiscountPercentage(value, inputElement) {
            var errorMessage = $("#spanPercentage");

            if (isNaN(value) || value < 0 || value > 100) {
                errorMessage.text("Discount Percentage should be between 0 and 100");

                // Reset the value of the current input field to 0
                $(inputElement).val(0);

                setTimeout(function () {
                    errorMessage.text("");
                }, 5000);
            } else {
                errorMessage.text("");
            }
        }


    </script>

    <style type="text/css">
        .input-group-text {
            background-color: #01a9ac;
            color: #fff;
            font-size: 16px;
        }

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

        hr {
            margin-top: 1rem;
            margin-bottom: 1rem;
            border: 0;
            border-top: 3px solid #000;
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

        .form-group {
            padding-bottom: 15px;
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
                                                <h1 style="padding: 5px 0px 5px 10px;">Invoice </h1>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="button" style="float: right;">
                                                    <input type="button" class="btn btn-info Accountant" value="Back" onclick="BackToList()" />
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
                                            <div class="col-sm-3" style="font-size: 16px;">
                                                Project ID Type  <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                <select class="js-example-basic-single col-sm-2" id="drpPrjTypeId">
                                                    <option value="0">Select Project ID Type</option>
                                                    <option value="1">PID</option>
                                                    <option value="2">NPID</option>
                                                    <option value="3">Customer PO</option>
                                                </select>
                                                <span class="messages" id="spandrpPrjTypeId" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-3" style="font-size: 16px;" id="divPid" hidden="hidden">
                                                Project ID  <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                <select class="js-example-basic-single col-sm-2" id="drpPid">
                                                </select>
                                                <span class="messages" id="spandrpPid" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-3" style="font-size: 16px;" id="divNpid" hidden="hidden">
                                                Non Project ID  <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                <input type="text" class="form-control" id="txtNpid" name="NON Project Id" autocomplete="off" />
                                                <span class="messages" id="spantxtNpid" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-3" style="font-size: 16px;" id="divCustomerPO" hidden="hidden">
                                                Customer PO  <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                <select class="js-example-basic-single col-sm-2" id="drpCustomerPO">
                                                </select>
                                                <span class="messages" id="spandrpCustomerPO" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-3" style="font-size: 16px;">
                                                Invoice Type <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                <select class="js-example-basic-single col-sm-2" id="drpInvType">
                                                    <option value="0">Select Invoice Type</option>
                                                    <option value="1">DC Trail</option>
                                                    <option value="2">DC Sales</option>
                                                    <option value="3">Regular Invoice</option>
                                                </select>
                                                <span class="messages" id="spandrpInvType" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-3" style="font-size: 16px;">
                                                DC Number <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                <select class="js-example-basic-single col-sm-2" id="drpDcNo">
                                                    <option value="0">Select DC Number</option>
                                                </select>
                                                <span class="messages" id="spandrpDcNo" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            

                                        </div>

                                        <div class="form-group row">
                                            <div class="col-sm-3" style="font-size: 16px;">
                                                Customer Name <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                <select class="js-example-basic-single col-sm-2" id="drpSupplierId">
                                                </select>
                                                <span class="messages" id="spanSupplierName" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-3" style="font-size: 16px;">
                                                Invoice Request No  <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                <input type="text" class="form-control" placeholder="Invoice Request No" id="txtInvoiceno" autocomplete="off" disabled />
                                                <span class="messages" id="spaninv" style="color: red; font-size: 15px; line-height: 30px;"></span><span class="messages" id="spanvoice" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-3" style="font-size: 16px;">
                                                Invoice Date <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                <div class="input-group" style="margin-bottom: 0px;">
                                                    <input class="form-control Accountant" type="text" id="Date" autocomplete="off" readonly onclick="$('#spanDate').text('');" />
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="Span1" style="color: #fff; font-size: 16px;"><i class="fa fa-calendar-check-o"></i></span>
                                                    </div>
                                                </div>
                                                <span class="messages " id="spanDate" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>

                                            <div class="col-sm-3" style="font-size: 16px;">
                                                Invoice No <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                <input class="form-control Accountant" type="text" id="txtInvNumber" placeholder="Invoice No" autocomplete="off" maxlength="250" />
                                                <span class="messages" id="spanInvNumbers" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                <span class="messages" id="spanInvNumber" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>

                                            
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-sm-4" style="font-size: 16px;">
                                                Invoice File <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                <input type="file" class="form-control Accountant" style="padding: 8px;" accept="application/pdf" id="File1" onchange="UploadFile(this);" />
                                                <input type="hidden" id="hdnF" />
                                                <a href="#" onclick="downloadPCFile(this);">
                                                    <span id="fExists" data-bind="text: fName, attr: { title: $data.fExists }"></span></a>
                                                <span class="messages" id="Spanpoupload" style="color: red; font-size: 15px;"></span>
                                            </div>

                                            <div class="col-sm-4" style="font-size: 16px;">
                                                Payment Terms 
                                                  <div class="input-group" style="margin-bottom: 0px;">
                                                      <input class="form-control" type="text" id="txtPaymentTerms" autocomplete="off" />
                                                  </div>

                                            </div>
                                            <div class="col-sm-4" style="font-size: 16px;">
                                                Delivery Period
                                                <input type="text" class="form-control" id="txtDeliveryPeriod" name="DeliveryPeriod" autocomplete="off" />
                                            </div>
                                            
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-4" style="font-size: 16px;">
                                                GST No
                                                <input type="text" class="form-control" id="txtGSTNo" name="GSTNo" autocomplete="off" />
                                            </div>
                                            <div class="col-sm-4" style="font-size: 16px;">
                                                Address
                                                <textarea class="form-control" id="txtAddress" name="Address" autocomplete="off"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="page-body ClonePortion" id="ClonePortion">
                        <div class="row">
                            <div class="col-sm-12">

                                <div class="card">

                                    <div class="card-block" style="padding: 40px;">


                                        <h3 style="padding-bottom: 5px; font-weight: 600;">Product Details</h3>
                                        <div class="form-group row" id="dynamicContainer">
                                            <div class="col-sm-12 " id="pro">
                                                <div class="clone-widget cloneya-wrap original">
                                                    <div class="unit widget left-50 right-50 toclone cloneya" style="padding-bottom: 10px;">
                                                        <button type="button" class="btn btn-primary clone-btn-right clone" style="font-size: 10px; margin-top: -7px;">
                                                            <i class="icofont icofont-plus"></i>
                                                        </button>

                                                        <button type="button" class="addon-btn adn-50 adn-left delete">
                                                            <i class="icofont icofont-minus"></i>
                                                        </button>
                                                        <div class="form-group row">
                                                            <div class="col-sm-3" style="font-size: 16px;">
                                                                Product
                                                              <select class="drpProduct js-example-basic-single col-sm-12" name="nameProduct" id="drpProduct" onchange="reamount();"></select>
                                                            </div>
                                                            <div class="col-sm-3" style="font-size: 16px;">
                                                                Make
                                                          <input type="text" class="form-control Make" id="Make_{{index}}" name="nameMake" autocomplete="off" disabled />
                                                            </div>
                                                            <div class="col-sm-3" style="font-size: 16px;">
                                                                Net Price
                                                           <input type="text" class="form-control price" value="0.00" oninput="validateInput(this)" autocomplete="off" id="price_{{index}}" name="namePrice" onkeyup="reamount();"/>
                                                            </div>
                                                            <div class="col-sm-3" style="font-size: 16px;">
                                                                HSN No
                                                          <input type="text" class="form-control Hsn" id="Hsn_{{index}}" name="nameHsn" autocomplete="off" disabled />
                                                            </div>                                                        
                                                            
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-sm-4" style="font-size: 16px;">
                                                                Description
                                                          <input type="text" class="form-control Description" id="Description_{{index}}" name="Description" autocomplete="off" disabled />
                                                            </div>
                                                            <div class="col-sm-4" style="font-size: 16px;">
                                                                Quantity
                                                                <span class="messages" style="color: red; font-size: 15px"></span>
                                                              <input type="text" class="form-control Quantity" value="1" placeholder="Quantity" name="nameQty" autocomplete="off" id="txtqty_{{index}}" onkeyup="reamount();" onkeypress="return ValidateDecimalQty(event);" />
                                                            </div>
                                                            <div class="col-sm-4" style="font-size: 16px;">
                                                                Profit Percentage
                                                               <div class="input-group">
                                                                   <div class="input-group-prepend">
                                                                       <span class="input-group-text" id="basic-addon2">%</span>
                                                                   </div>
                                                                   <input type="text" class="form-control Discount" value="0" placeholder="Discount" name="nameDis" id="txtdis_{{index}}" autocomplete="off" onkeyup="reamount();" oninput="ValidateDecimal(this,'spanPercentage')" />
                                                               </div>
                                                            </div>
                                                            </div>
                                                        <div class="form-group row" >
                                                            <div class="col-sm-4" style="font-size: 16px;">
                                                                Selling cost / Each
                                                              <input type="text" class="form-control SellingCost" value=""  name="nameSellingCost" id="txtSellingCost_{{index}}" disabled />
                                                            </div>
                                                            <div class="col-sm-4" style="font-size: 16px;">
                                                                Total Amount
                                                              <input type="text" class="form-control Amount" value=""  name="nameAmount" id="txtamount_{{index}}" disabled />
                                                            </div>
                                                            
                                                            <div class="col-sm-4" style="font-size: 16px;">
                                                                Last Invoice Price
                                                                <input type="text" class="form-control LastPrice" name="LastPrice" disabled />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <hr />
                                        <div class="form-group row">
                                            <div class="col-sm-4" style="font-size: 16px;">
                                                CGST<span class="messages" id="spantxtCgst" style="color: red; font-size: 15px"></span>  <span class="messages" id="spanDcgst" style="color: red; font-size: 15px"></span>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon">%</span>
                                                    </div>
                                                    <input type="text" class="form-control txtCgst" value="9" placeholder="CGST" id="txtCgst" onkeyup="refind();" autocomplete="off" maxlength="18" onkeypress="return ValidateDecimalCGST(event);" />

                                                </div>
                                            </div>

                                            <div class="col-sm-4" style="font-size: 16px;">
                                                SGST<span class="messages " id="spantxtSgst" style="color: red; font-size: 15px"></span> <span class="messages" id="spanDsgst" style="color: red; font-size: 15px"></span>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1">%</span>
                                                    </div>
                                                    <input type="text" class="form-control txtSgst" value="9" placeholder="SGST" id="txtSgst" onkeyup="refind();" autocomplete="off" maxlength="18" onkeypress="return ValidateDecimalSGST(event);" />

                                                </div>
                                            </div>


                                            <div class="col-sm-4" style="font-size: 16px;">
                                                Total
                                                <input type="text" class="form-control " value="0" id="txtTotalInvoice" placeholder="Total" name="" disabled />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-4"></div>
                                            <div class="col-sm-4"></div>
                                            <div class="col-sm-4" style="font-size: 16px;">
                                                Frieght Charges
                                                <input type="text" class="form-control FrieghtCharges" id="txtFrieghtCharges" onkeyup="refind();" value="0" placeholder="Frieght Charges" autocomplete="off" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-4"></div>
                                            <div class="col-sm-4"></div>
                                            <div class="col-sm-4" style="font-size: 16px;">
                                                <b>Grand Total</b>
                                                <input type="text" class="form-control" id="txtGrandTotal" placeholder="Grand Total" disabled />
                                            </div>
                                        </div>
                                        <div class="form-group row" style="padding-top: 30px;">
                                            <div class="col-sm-12">
                                                <center>
                                                    <input type="button" class="btn btn-success f-w-100 Accountant" style="width: 70px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnSubmit" value="Submit" onclick="Saveinvoice()" />
                                                    <input type="button" class="btn btn-success f-w-100 Accountant" style="width: 70px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnBack" value="Cancel" onclick="BackToList()" />
                                                </center>

                                            </div>
                                        </div>
                                        <span class="messages" id="SpandrpProductIdCmn" name="spanProduct" style="color: red; font-size: 15px"></span>
                                        <br />
                                        <br />
                                        <span class="messages" id="spanQty" name="spanQty" style="color: red; font-size: 15px"></span>
                                        <br />
                                        <span class="messages" id="spanDis" name="spanDis" style="color: red; font-size: 15px"></span>
                                        <br />
                                        <span class="messages" id="spanStock" name="spanStock" style="color: red; font-size: 15px"></span>
                                        <br />
                                        <span class="messages" id="spanPercentage" name="spanPercentage" style="color: red; font-size: 15px"></span>
                                        <br />
                                        <span class="messages" id="spanFrieghtChargesValue" name="spanFrieghtChargesValue" style="color: red; font-size: 15px"></span>
                                        <br />
                                        <span class="messages" id="spanPrice" name="spanPrice" style="color: red; font-size: 15px"></span>


                                        <input type="hidden" id="InvoiceId" value="0" />
                                        <asp:HiddenField ID="userIdHiddenField" runat="server" />

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
        function refind() {

            var amountElements = document.getElementsByClassName("Amount");
            var sum = 0;

            for (var i = 0; i < amountElements.length; i++) {
                var amount = parseFloat(amountElements[i].value);
                if (!isNaN(amount)) {
                    sum += amount;
                }
            }

            var FrieghtCharges = parseFloat(document.getElementById("txtFrieghtCharges").value);
            var CGSTPercent = parseFloat(document.getElementById("txtCgst").value);
            var SGSTPercent = parseFloat(document.getElementById("txtSgst").value);
            var CGST = (sum * (CGSTPercent / 100));
            var SGST = (sum * (SGSTPercent / 100));
            var Total = sum + CGST + SGST;
            var GrandTotal = Total + FrieghtCharges;

            if (!isNaN(Total) && !isNaN(GrandTotal)) {
                document.getElementById('txtTotalInvoice').value = Total.toFixed(2);
                document.getElementById('txtGrandTotal').value = GrandTotal.toFixed(2);
            } else {
                document.getElementById('txtTotalInvoice').value = '';
                document.getElementById('txtGrandTotal').value = '';
            }
        }

        function reamount() {
            var totalAmount = 0;

            $('.cloneya').each(function () {
                var price = $(this).find('.price').val();
                //var price = $(this).find('[name="namePrice"]').val();
                var quantity = $(this).find('[name="nameQty"]').val();
                var discount = $(this).find('[name="nameDis"]').val();

                var SellingCost = parseFloat(price) + (parseFloat(price) * (parseInt(discount) / 100));
                var amount = SellingCost * quantity;
                $(this).find('[name="nameSellingCost"]').val(SellingCost.toFixed(2));
                $(this).find('[name="nameAmount"]').val(amount.toFixed(2));
                totalAmount += amount;
            });
            var sum = 0;

            $('.Amount').each(function () {
                var amount = parseFloat($(this).val());
                if (!isNaN(amount)) {
                    sum += amount;
                }
            });
            var FrieghtCharges = parseFloat(document.getElementById("txtFrieghtCharges").value);
            var CGSTPercent = parseFloat(document.getElementById("txtCgst").value);
            var SGSTPercent = parseFloat(document.getElementById("txtSgst").value);
            var CGST = (sum * (CGSTPercent / 100));
            var SGST = (sum * (SGSTPercent / 100));
            var Total = sum + CGST + SGST;
            var GrandTotal = Total + FrieghtCharges;

            $("#txtTotalInvoice").val(Total.toFixed(2));
            $("#txtGrandTotal").val(GrandTotal.toFixed(2));

        }


    </script>

    <script type="text/javascript">
        var invoice = function () {
            var self = this;
            this.InvoiceId = ko.observable(0);
            this.SupplierId = ko.observable(0);
            this.LPrice = ko.observable('');
            this.InvoiceNo = ko.observable('');
            this.InvNo = ko.observable('');
            this.PIdType = ko.observable('');
            this.PId = ko.observable('');
            this.NPId = ko.observable('');
            this.CustomerPO = ko.observable('');
            this.PaymentTerms = ko.observable('');
            this.DeliveryPeriod = ko.observable('');
            this.GstNo = ko.observable('');
            this.Address = ko.observable('');
            this.InvType = ko.observable('');
            this.DcNo = ko.observable('');
            this.InvoiceDate = ko.observable('');
            this.FrieghtCharges = ko.observable('');
            this.Cgst = ko.observable('');
            this.Sgst = ko.observable('');
            this.DocFileName = ko.observable('');
            this.Discount = ko.observable('');
            this.Amount = ko.observable('');
            this.Qty = ko.observable('');
            this.ProductsId = ko.observable('');
            this.Size = ko.observable('');
            this.Hsn = ko.observable('');
            this.Description = ko.observable('');


        };
    </script>

</asp:Content>

