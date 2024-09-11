<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="PORequest.aspx.cs" Inherits="PORequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Style.css Start -->
    <link rel="stylesheet" type="text/css" href="files/bower_components/datatables.net-bs4/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/data-table/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/data-table/extensions/buttons/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/chart/radial/css/radial.css" media="all" />
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
            var SuppID = objUrlParams.get('SuppID');
            if (SuppID != null) {
                BindSupplierForEdit(SuppID);
            }
            else {
                BindPORequest();
                fnDrpSupplier(0);
                fnDrpProduct(0, 0);
                fnDrpProject(0);
            }
            
            $("#dtPODate").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: false,
                changeYear: false,
                yearRange: '1924:' + (new Date).getFullYear()

            });

            $("#drpSupplierId").change(function () {

                var Supplier = $("#drpSupplierId").val();

                if (Supplier != '') {
                    $('#SpanSupplierId')[0].innerText = "";
                }
                else {
                    $('#SpanSupplierId')[0].innerText = "Select Supplier Name";
                }

            });

            $("#txtSPoNumber").keyup(function () {
                var txtponumber = $(this).val();
                if (txtponumber != '') {
                    $("#SpanPONoNew").text("");

                }
            });

            $("#dtPODate").click(function () {
                var PODate = $(this).val();
                if (PODate > 0 || PODate != null || PODate != '') {
                    $("#SpanPOdate").text("");

                }

            });

            var max = 250;
            var el = document.getElementById('txtPaymentTerms');

            $('#txtPaymentTerms').keypress(function (event) {
                var Length = $("#txtPaymentTerms").val().length;
                var AmountLeft = max - Length;
                $('#txtPaymentTerms-length-left').html(AmountLeft);
                if (Length >= max) {
                    if (event.which != 8) {
                        $('#SpanPayment').text('Only Allowed 250 Characters');

                        return false;
                    }
                } else {
                    $('#SpanPayment').text('');
                    el.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {

                            $('#SpanPayment').html('');
                        }

                    });
                }


            });

            var maxl = 250;
            var ela = document.getElementById('txtDeliveryPeriod');

            $('#txtDeliveryPeriod').keypress(function (event) {
                var Length = $("#txtDeliveryPeriod").val().length;
                var AmountLeft = maxl - Length;
                $('#txtDeliveryPeriod-length-left').html(AmountLeft);
                if (Length >= maxl) {
                    if (event.which != 8) {
                        $('#Spandelivery').text('Only Allowed 250 Characters');

                        return false;
                    }
                } else {
                    $('#Spandelivery').text('');
                    ela.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {

                            $('#Spandelivery').html('');
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
            var elb = document.getElementById('txtSPoNumber');

            $('#txtSPoNumber').keypress(function (event) {
                var Length = $("#txtSPoNumber").val().length;
                var AmountLeft = maxle - Length;
                $('#txtSPoNumber-length-left').html(AmountLeft);
                if (Length >= maxle) {
                    if (event.which != 8) {
                        $('#SpanPONoNews').text('Only Allowed 250 Characters');

                        return false;
                    }
                } else {
                    $('#SpanPONoNews').text('');
                    elb.addEventListener('keydown', function (event) {

                        if (event.keyCode == 8) {

                            $('#SpanPONoNews').html('');
                        }

                    });
                }


            });



            $(document).on("change", "#drpSupplierId", function () {
                $('.price').val('');
                $('.Hsn').val('');
                $('.Amount').val('');
                $('.Quantity').val(1);
                $('.Discount').val(0);

                var selectedOption = $(this).find(':selected');
                var selectedGST = selectedOption.data('drpGST');         // Get GST value from data attribute
                var selectedAddress = selectedOption.data('drpAddress'); // Get Address value from data attribute

                $('#txtGst').val(selectedGST);
                $('#txtAddress').val(selectedAddress);

                var feCount = $("#drpSupplierId").val();

                var objUrlParams = new URLSearchParams(window.location.search);
                var SuppID = objUrlParams.get('SuppID');

                if (SuppID != null) {
                    cloneDiv();
                } else {
                    $('.duplicate').remove();
                }

                if (feCount != '0' && feCount != '') {
                    fnDrpProduct(feCount, 0);


                    $('.duplicate').remove();
                    $(".clone-btn-right").show();

                    $('.price').val('');
                    $('.Hsn').val('');
                    $('.Amount').val('');
                    $('.Quantity').val(1);
                    $('.Discount').val(0);

                    cloneDiv()
                    $('.original').remove();

                }
                else {
                    fnDrpProduct(0, 0);

                    $('.duplicate').remove();
                    $(".clone-btn-right").show();

                    $('.price').val('');
                    $('.Hsn').val('');
                    $('.Amount').val('');
                    $('.Quantity').val(1);
                    $('.Discount').val(0);

                    cloneDiv()
                    $('.original').remove();

                }




            });

            $(document).on("change", ".drpProduct", function () {
                $("#SpandrpProductIdCmn").text("");

                $(this).closest('.cloneya').find('.price').val('');
                $(this).closest('.cloneya').find('.Quantity').val(1);
                $(this).closest('.cloneya').find('.Discount').val(0);
                $(this).closest('.cloneya').find('.Amount').val('');

                var feCo = $("#drpSupplierId").val();
                var feCoyt = $(this).val();
                if (feCoyt != '0' && feCoyt != '') {
                    var priceField = $(this).closest('.cloneya').find('.price');
                    var Hsn = $(this).closest('.cloneya').find('.Hsn');
                    var lastpriceField = $(this).closest('.cloneya').find('.lastprice');
                    var AmountField = $(this).closest('.cloneya').find('.Amount');
                    var Description = $(this).closest('.cloneya').find('.Description');
                    productprice(feCo, feCoyt, priceField, Hsn, AmountField, Description);
                    lastproductprice(feCoyt, lastpriceField);
                } else {
                    $(this).closest('.cloneya').find('.price').val('');
                    $(this).closest('.cloneya').find('.Hsn').val('');
                    $(this).closest('.cloneya').find('.Description').val('');
                    $(this).closest('.cloneya').find('.Quantity').val(1);
                    $(this).closest('.cloneya').find('.Discount').val(0);
                    $(this).closest('.cloneya').find('.Amount').val('');
                    $(this).closest('.cloneya').find('.lastprice').val('');
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
                var SuppID = objUrlParams.get('SuppID');
                if (SuppID == null && originallength == 1) {
                    original.remove();
                    cloneyaElement.remove();
                    cloneDiv();

                }
                else if (SuppID == null && originallength != 1 && cloneyaLength == 1) {
                    cloneyaElement.remove();
                    cloneDiv();

                }
                else if ((drpSupplierId != 0 || drpSupplierId == 0) && SuppID != null && cloneyaLength == 1 && originallength == 1) {
                    original.remove();
                    cloneyaElement.remove();
                    cloneDiv();
                }
                else if ((drpSupplierId != 0 || drpSupplierId == 0) && SuppID != null && cloneyaLength == 1 && originallength == 0) {
                    cloneyaElement.remove();
                    cloneDiv();
                }
                else {
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

            $(document).on("input", "input[name='nameDis']", function () {
                var Discount = $(this).val();
                validateDiscountPercentage(Discount, this);

                // Ensure the entered value is within the range of 0 to 100
                Discount = Math.min(100, Math.max(0, Discount));

                // Update the input value with the adjusted value
                $(this).val(Discount);
            });


        });
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
        function validateDiscountPercentage(value, fieldId) {
            var errorMessage = $("#spanPercentage");

            if (isNaN(value) || value < 0 || value > 100) {
                errorMessage.text("Discount Percentage should be between 0 and 100");
                setTimeout(function () {
                    errorMessage.text("");
                }, 5000);
            } else {
                errorMessage.text("");
            }
        }


        function cloneDiv() {
            var template = `
            <div class="col-sm-12 cloneya duplicate">
                <div class="clone-widget cloneya-wrap">
                    <div class="unit widget left-50 right-50 " style="padding-bottom:10px;">
                        <button type="button" class="btn btn-primary clone-btn-right clone" style="font-size: 10px;margin-top: -7px;">
                            <i class="icofont icofont-plus"></i>
                        </button>
                        <tb>
                            <button type="button" class="addon-btn adn-50 adn-left delete" >
                                <i class="icofont icofont-minus"></i>
                            </button>
                            <div class="form-group row">
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Product <span class="messages" id="SpandrpProductId" name="spanProduct" style="color: red; font-size: 15px"></span><br />
                                    <select class="drpProduct js-example-basic-single col-sm-12" name="nameProduct" id="drpProduct" onchange="reamount();"></select>
                                </div>
                                <div class="col-sm-3" style="font-size:16px;">List Price
                                    <input type="text" class="form-control price" id="price_{{index}}" oninput="validateInput(this)" name="namePrice" onkeyup="reamount();" autocomplete="off" />
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    HSN
                                    <input type="text" class="form-control Hsn" id="Hsn_{{index}}" name="nameHsn" autocomplete="off" disabled />
                                </div>
                                <div class="col-sm-3" style="font-size:16px;">Last Purchase Price
                                    <input type="text" class="form-control lastprice" id="lastprice" name="LastPurchasePrice" disabled />
                                </div>
                            </div>
                            <div class="form-group row" >
                                <div class="col-sm-3" style="font-size:16px;">Description
                                    <textarea type="text" class="form-control Description" id="Description" name="Description" disabled ></textarea>
                                </div>
                                <div class="col-sm-3" style="font-size:16px;">Quantity
                                    <input type="text" class="form-control Quantity" value="1" placeholder="Quantity" autocomplete="off" name="nameQty" id="txtqty_{{index}}" onkeyup="reamount();" onkeypress="return ValidateDecimalQty(event);" />
                                </div>
                                <div class="col-sm-3" style="font-size:16px;">Discount
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon2">%</span>
                                        </div>
                                        <input type="text" class="form-control Discount" value="0" placeholder="Discount" name="nameDis" id="txtdis_{{index}}" oninput="validateDecimalInput(this)" onkeyup="reamount();" autocomplete="off" />
                                    </div>
                                </div>
                                <div class="col-sm-3" style="font-size:16px;">Amount
                                    <input type="text" class="form-control Amount" name="nameAmount" id="txtamount_{{index}}" disabled />
                                </div>
                            </div>
                    </div>
                </div>
            </div> `;

            var clonedDiv = $(template);

            clonedDiv.find('.js-example-basic-single').select2();

            // Remove the plus button from existing elements
            $('.clone-btn-right').hide();

            $("#dynamicContainer").append(clonedDiv);
            var drpSupplierId = $("#drpSupplierId").val();
            fnDrpProductClone(drpSupplierId, 0, clonedDiv);
        }

        function BindPORequest() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "PORequest.aspx/BindPORequest",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    if (data.d != null) {
                        if (data.d.PONumber) {

                            $("#txtPONO").val(data.d.PONumber);

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
                url: "PORequest.aspx/BindSupplier",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    $("#drpSupplierId").html("");
                    $("#drpSupplierId").append($("<option></option>").val('0').html('Select Supplier Name'));
                    $.each(data.d, function (key, value) {
                        $("#drpSupplierId").append($("<option></option>")
                            .val(value.SID)
                            .html(value.SName)
                            .data('drpGST', value.drpGST)
                            .data('drpAddress', value.drpAddress)
                        );
                    });
                    $("#drpSupplierId").val(SupplierId);
                },
                error: function (result) {
                    alert("Failed to load Supplier Name");
                }
            });
        }


        function fnDrpProject(Project) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "PORequest.aspx/GetProject",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    $("#drpProjectId").html("");
                    $("#drpProjectId").append($("<option></option>").val(0).html('Select Project Name'));
                    $.each(data.d, function (key, value) {
                        $("#drpProjectId").append($("<option></option>").val(value.ProjectID).html(value.Project));
                    });
                    $("#drpProjectId").val(Project);
                },
                error: function (result) {
                    alert("Failed to load Project Name");
                }
            });

        }

        function fnDrpProduct(SupplierId, Products) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "PORequest.aspx/GetProduct",
                data: "{SupplierId: '" + SupplierId + "'}",
                dataType: "json",
                success: function (data) {
                    var dropdownOptions = '<option value="0">Select Product Name</option>';
                    $.each(data.d, function (key, value) {
                        dropdownOptions += "<option value='" + value.PID + "'>" + value.PName + "</option>";
                    });

                    // Apply options to all the dropdowns with class 'drpProduct'
                    $(".drpProduct").html(dropdownOptions);
                    $(".drpProduct").val(Products);
                    reamount();
                },
                error: function (result) {
                    alert("Failed to load Product Name");
                }
            });
        }

        function productprice(SupplierId, ProductsID, priceField, Hsn, AmountField, Description) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "PORequest.aspx/GetPrice",
                data: "{SupplierId: '" + SupplierId + "',ProductsID: '" + ProductsID + "'}",
                dataType: "json",
                success: function (data) {
                    priceField.val(data.d.LPrice);
                    Hsn.val(data.d.Hsn);
                    AmountField.val(data.d.LPrice);
                    Description.val(data.d.Size);
                    reamount();
                },
                error: function (result) {
                    alert("Failed to load Product Price");
                }
            });
        }

        function lastproductprice(ProductsId, lastpriceField) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "PORequest.aspx/Getlastprice",
                data: "{ProductsId: '" + ProductsId + "'}",
                dataType: "json",
                success: function (data) {
                    lastpriceField.val(data.d.LastPrice);
                },
                error: function (result) {
                    alert("Failed to load last Product Price");
                }
            });
        }



        function BindSupplierForEdit(SuppID) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "PORequest.aspx/BindSupplierForEdit",
                data: "{ 'SuppID': " + SuppID + " }",
                dataType: "json",
                success: function (data) {
                    if (data.d != null) {
                        $('#SuppID').val(data.d.SuppID);
                        $('#txtPONO').val(data.d.PONumber);
                        $('#txtSPoNumber').val(data.d.SPoNumber);
                        $('#dtPODate').val(data.d.PODate);
                        $('#hdnF').val(data.d.FileName);
                        $('#fExists').text(data.d.FileName);
                        $('#txtPaymentTerms').val(data.d.PaymentTerms);
                        $('#txtDeliveryPeriod').val(data.d.DeliveryPeriod);
                        $('#txtGst').val(data.d.Gst);
                        $('#txtAddress').val(data.d.Address);
                        $('#txtFrieghtCharges').val(data.d.FrieghtCharges);
                        $('#txtCgst').val(data.d.Cgst);
                        $('#txtSgst').val(data.d.Sgst);
                        fnDrpProject(data.d.ProjectID);
                        fnDrpSupplier(data.d.SupplierId);

                        var ProductsId = data.d.ProductsId.split(",");
                        var Lprice = data.d.LPrice.split(",");
                        var Hsn = data.d.Hsn.split(",");
                        var Description = data.d.Size.split(",");
                        var Qty = data.d.Qty.split(",");
                        var LastPrice = data.d.LastPrice.split(",");
                        var Discount = data.d.Discount.split(",");
                        var SupplierId = data.d.SupplierId


                        if (data.d.ProductsId == "" || data.d.ProductsId == null) {
                            fnDrpProduct(data.d.SupplierId, 0);
                        }

                        if (data.d.ProductsId != "" || data.d.ProductsId != null) {
                            for (var i = 0; i < ProductsId.length; i++) {
                                cloneDivEdit(SupplierId, ProductsId[i], Lprice[i], Hsn[i], Description[i], Qty[i], Discount[i], LastPrice[i]);
                            }
                        }
                    } else {
                        alert('Failed to load data');
                    }
                },
                error: function (result) {
                    alert("Failed to load data");
                }
            });
        }

        function SaveReq() {
            var rlid = $('#<%= userIdHiddenField.ClientID %>').val();
            var isValid = true;

            if (rlid == 2) {
                isValid = isValid && hasValue("#dtPODate", "#SpanPOdate", "Choose the PO Date");
                isValid = isValid && hasValue("#txtSPoNumber", "#SpanPONoNew", "Enter the PO Number");
                isValid = isValid && hasValue("#hdnF", "#Spanpoupload", "Upload the PO file");
            } else {
                isValid = isValid && hasddlValue("#drpSupplierId", "#SpanSupplierId", "Select Supplier Name");
            }

            if (isValid) {
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

                if (hasZeroValue) {
                    isValid = false;
                    $("#SpandrpProductIdCmn").text("Select Product Name");
                    return;
                }

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

                // Size
                var nameSize = document.getElementsByName("Description");
                var Size = [];
                for (var i = 0; i < nameSize.length; i++) {
                    var value = nameSize[i].value.trim(); 
                    Size.push(value ? value : '-'); 
                }


                //Qty
                var nameQty = document.getElementsByName("nameQty");
                var Qty = [];
                for (var i = 0; i < nameQty.length; i++) {
                    Qty.push(nameQty[i].value);
                }

                //Discount
                var nameDis = document.getElementsByName("nameDis");
                var Discount = [];
                for (var i = 0; i < nameDis.length; i++) {
                    Discount.push(nameDis[i].value);
                }

                var SupplierObj = new Supplier_FDSS();
                SupplierObj.SuppID = $('#SuppID').val();
                SupplierObj.ProjectID = $('#drpProjectId').val();
                SupplierObj.roleId = $('#<%= userIdHiddenField.ClientID %>').val();
                SupplierObj.SupplierId = $('#drpSupplierId').val();
                SupplierObj.PONumber = $('#txtPONO').val();
                SupplierObj.PODate = $('#dtPODate').val();
                SupplierObj.SPoNumber = $('#txtSPoNumber').val();
                SupplierObj.FileName = $('#hdnF').val();
                SupplierObj.PaymentTerms = $('#txtPaymentTerms').val();
                SupplierObj.DeliveryPeriod = $('#txtDeliveryPeriod').val();
                SupplierObj.Gst = $('#txtGst').val();
                SupplierObj.Address = $('#txtAddress').val();
                SupplierObj.FrieghtCharges = $('#txtFrieghtCharges').val();
                SupplierObj.Cgst = $('#txtCgst').val();
                SupplierObj.Sgst = $('#txtSgst').val();
                SupplierObj.ProductsId = ProductsId.toString();
                SupplierObj.LPrice = LPrice.toString();
                SupplierObj.Hsn = Hsn.toString();
                SupplierObj.Size = Size.toString();
                SupplierObj.Qty = Qty.toString();
                SupplierObj.Discount = Discount.toString();
                $("#btnSubmit").attr("disabled", true);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "PORequest.aspx/SaveOrUpdateSupplier",
                    data: "{SupplierObj : " + ko.toJSON(SupplierObj) + "}",
                    dataType: "json",
                    success: function (data) {
                        if (data.d != "") {

                            var inserted = data.d;
                            if (inserted != null) {
                                location.href = "PORequestList.aspx?flagId=" + data.d;
                                ValidateDecimalCGST(e);
                                ValidateDecimalSGST(e);
                                ValidateDecimalQty(e);
                                ValidateDecimalDis(e);
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

        function cloneDivEdit(SupplierId, productId, listPrice, Hsn, Description, quantity, discount) {
            $('#pro').remove();
            var template = `
            <div class="col-sm-12 cloneya duplicate EditDuplicate">
                <div class="clone-widget cloneya-wrap">
                    <div class="unit widget left-50 right-50 " style="padding-bottom:10px;">
                        <button type="button" class="btn btn-primary clone-btn-right clone" style="font-size: 10px;margin-top: -7px;">
                            <i class="icofont icofont-plus"></i>
                        </button>
                        <tb>
                            <button type="button" class="addon-btn adn-50 adn-left delete">
                                <i class="icofont icofont-minus"></i>
                            </button>
                            <div class="form-group row" >
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Product  <span class="messages" id="SpandrpProductId" name="spanProduct" style="color: red; font-size: 15px"></span><br />
                                    <select class="drpProduct js-example-basic-single col-sm-12" name="nameProduct" id="drpProduct" onchange="reamount();"></select>
                                </div>
                                <div class="col-sm-3" style="font-size:16px;">List Price
                                    <input type="text" class="form-control price" id="price_{{index}}" oninput="validateInput(this)" onkeyup="reamount();"name="namePrice" autocomplete="off" />
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    HSN
                                    <input type="text" class="form-control Hsn" id="Hsn_{{index}}" name="nameHsn" autocomplete="off" disabled />
                                </div>
                                <div class="col-sm-3" style="font-size:16px;">Last Purchase Price
                                    <input type="text" class="form-control lastprice" id="lastprice" name="LastPurchasePrice" disabled />
                                </div>
                            </div>
                            <div class="form-group row" >
                                <div class="col-sm-3" style="font-size:16px;">Description
                                    <textarea type="text" class="form-control Description" id="Description" name="Description" disabled ></textarea>
                                </div>
                                <div class="col-sm-3" style="font-size:16px;">Quantity
                                    <input type="text" class="form-control Quantity" value="1" placeholder="Quantity" name="nameQty" autocomplete="off" id="txtqty_{{index}}" onkeyup="reamount();" onkeypress="return ValidateDecimalQty(event);" />
                                </div>
                                <div class="col-sm-3" style="font-size:16px;">Discount
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon2">%</span>
                                        </div>
                                        <input type="text" class="form-control Discount" value="0" placeholder="Discount" name="nameDis" id="txtdis_{{index}}" oninput="validateDecimalInput(this)" onkeyup="reamount();" autocomplete="off" />
                                    </div>
                                </div>
                                <div class="col-sm-3" style="font-size:16px;">Amount
                                    <input type="text" class="form-control Amount" name="nameAmount" id="txtamount_{{index}}" disabled />
                                </div>
                            </div>
                    </div>
                </div>
            </div>
     </div > `;

            var clonedDiv = $(template);

            clonedDiv.find('.js-example-basic-single').select2();
            fnDrpProductClone(SupplierId, productId, clonedDiv);
            clonedDiv.find("input[name='namePrice']").val(listPrice);
            clonedDiv.find("input[name='nameHsn']").val(Hsn);
            clonedDiv.find("textarea[name='Description']").val(Description);
            lastpriceField = clonedDiv.find("input[name='LastPurchasePrice']");
            lastproductprice(productId, lastpriceField);
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

        function fnDrpProductClone(SupplierId, Products, clonedDiv) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "PORequest.aspx/GetProduct",
                data: "{SupplierId: '" + SupplierId + "'}",
                dataType: "json",
                success: function (data) {
                    var dropdownOptions = '<option value="0">Select Product Name</option>';
                    $.each(data.d, function (key, value) {
                        dropdownOptions += "<option value='" + value.PID + "'>" + value.PName + "</option>";
                    });

                    // Apply options to all the dropdowns with class 'drpProduct'
                    clonedDiv.find(".drpProduct").html(dropdownOptions);
                    clonedDiv.find(".drpProduct").val(Products);
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

        function BackToList() {
            location.href = "PORequestList.aspx";
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

        function ValidateDecimalQty(e) {
            var nameQty = e.nameQty || e.which;

            var lblError = document.getElementById("SuppID");
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

            var lblError = document.getElementById("SuppID");
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

        function ValidateDecimalCGST(e) {
            var Cgst = e.Cgst || e.which;

            var lblError = document.getElementById("SuppID");
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

            var lblError = document.getElementById("SuppID");
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
                $(inputElement).closest('.cloneya').find('.Discount').val(0);

            } else {
                errorMessage.textContent = '';
            }

            // Update the input value with the numeric-only value
            inputElement.value = numericValue;
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

            .form-control:hover {
                font-size: 16px;
                border-radius: 2px;
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

        select {
            display: none !important;
        }

        .addBtn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 16px;
            margin-bottom: 10px;
            border-radius: 3px;
        }

        .minusBtn {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            font-size: 16px;
            position: absolute;
            right: 0;
            top: 0;
            border-radius: 3px;
        }
        .btn {
    border-radius: 2px;
    text-transform: capitalize;
    font-size: 15px;
    padding: 2px 1px 1px 1px;
    cursor: pointer;
}
        .addon-btn {
            font-size:16px;
            margin-left:0px;
            border:1px solid #999;
            padding:2px 2px 1px 2px ;
        }
        .clone-btn-right {
            font-size:11px;
            margin-top: -8px;
            padding: 2px 2px 2px 2px;
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

        hr {
            margin-top: 1rem;
            margin-bottom: 1rem;
            border: 0;
            border-top: 3px solid rgb(0 0 0);
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
                                                <h1 style="padding: 5px 0px 5px 10px;">PO Request</h1>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="button" style="float: right;">
                                                    <input type="button" class="btn btn-info  Accountant" value="Back" onclick="BackToList()" />
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
                                            <div class="col-sm-4" style="font-size: 16px;">
                                                Project Id
                                                <span class="messages" id="spanProjectId" style="color: red; font-size: 15px;"></span>
                                                <select class="js-example-basic-single col-sm-2" name="" id="drpProjectId">
                                                </select>
                                            </div>
                                            <div class="col-sm-4" style="font-size: 16px;">
                                                Supplier Name <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>

                                                <select class="js-example-basic-single col-sm-2" name="" id="drpSupplierId">
                                                </select><span class="messages" id="SpanSupplierId" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-4" style="font-size: 16px;">
                                                P.O Request No
                                                
                                                <input id="txtPONO" type="text" class="form-control" placeholder="P.O Request No" autocomplete="off" disabled />
                                                <span class="messages" id="SpanPONo" style="color: red; font-size: 15px; line-height: 30px;"></span>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-3" style="font-size: 16px;">
                                                P.O Date <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                <div class="input-group" style="margin-bottom: 0px;">
                                                    <input class="form-control Accountant" type="text" id="dtPODate" readonly autocomplete="off" />
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="Span1" style="color: #fff; font-size: 16px;"><i class="fa fa-calendar-check-o"></i></span>
                                                    </div>
                                                </div>
                                                <span class="messages" id="SpanPOdate" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-3" style="font-size: 16px;">
                                                P.O No <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>

                                                <input id="txtSPoNumber" type="text" class="form-control Accountant" placeholder="P.O No" autocomplete="off" maxlength="250" />
                                                <span class="messages" id="SpanPONoNews" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                                <span class="messages" id="SpanPONoNew" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-3" style="font-size: 16px;">
                                                P.O File <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                <input type="file" class="form-control Accountant" style="padding: 6px;" accept="application/pdf" id="File1" onchange="UploadFile(this);" />
                                                <input type="hidden" id="hdnF" />
                                                <a href="#" onclick="downloadPCFile(this);">
                                                    <span id="fExists" data-bind="text: fName, attr: { title: $data.fExists }"></span></a>
                                                <span class="messages" id="Spanpoupload" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                            </div>
                                            <div class="col-sm-3" style="font-size: 16px;">
                                                Payment Terms
                                                <input class="form-control" type="text" id="txtPaymentTerms" autocomplete="off" maxlength="250" />
                                                <span class="messages" id="SpanPayment" style="color: red; font-size: 15px; line-height: 30px;"></span>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-4" style="font-size: 16px;">
                                                Delivery Period
                                                      <input class="form-control" type="text" id="txtDeliveryPeriod" autocomplete="off" maxlength="250" />
                                                <span class="messages" id="Spandelivery" style="color: red; font-size: 15px; line-height: 30px;"></span>

                                            </div>
                                            <div class="col-sm-4" style="font-size: 16px;">
                                                GST Number
                                                      <input class="form-control" type="text" id="txtGst" autocomplete="off" maxlength="50" disabled />
                                                <span class="messages" id="SpanGST" style="color: red; font-size: 15px; line-height: 30px;"></span>

                                            </div>
                                            <div class="col-sm-4" style="font-size: 16px;">
                                                Address
                                              <textarea type="text" class="form-control Address" id="txtAddress" name="Address" disabled></textarea>
                                                <span class="messages" id="SpanAddress" style="color: red; font-size: 15px; line-height: 30px;"></span>

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
                                                <div class="clone-widget cloneya-wrap original">
                                                    <div class="unit widget left-50 right-50 toclone cloneya" id="pro" style="padding-bottom: 10px;">
                                                        <button type="button" class="btn btn-primary clone-btn-right clone" style="font-size: 10px; margin-top: -7px;">
                                                            <i class="icofont icofont-plus"></i>
                                                        </button>
                                                        <tb>
                                                            <button type="button" class="addon-btn adn-50 adn-left delete">
                                                                <i class="icofont icofont-minus"></i>
                                                            </button>
                                                            <div class="form-group row">
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Product      <span class="messages" id="SpandrpProductId" name="spanProduct" style="color: red; font-size: 15px"></span>
                                                                    <br />

                                                                    <select class="drpProduct js-example-basic-single col-sm-12" name="nameProduct" id="drpProduct" onchange="reamount();"></select>
                                                                </div>
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    List Price
        <input type="text" class="form-control price" id="price_{{index}}" oninput="validateInput(this)" onkeyup="reamount();" name="namePrice" autocomplete="off" />
                                                                </div>
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    HSN
        <input type="text" class="form-control Hsn" id="Hsn_{{index}}" name="nameHsn" autocomplete="off" disabled />
                                                                </div>
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Last Purchase Price
         <input type="text" class="form-control lastprice" id="lastprice" name="LastPurchasePrice" disabled />
                                                                </div>

                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Description
         <textarea type="text" class="form-control Description" id="Description" name="Description" disabled></textarea>
                                                                </div>
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Quantity
              <input type="text" class="form-control Quantity" value="1" placeholder="Quantity" name="nameQty" id="txtqty_{{index}}" onkeyup="reamount();" autocomplete="off" onkeypress="return ValidateDecimalQty(event);" />
                                                                </div>
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Discount
              <div class="input-group">
                  <div class="input-group-prepend">
                      <span class="input-group-text" id="basic-addon2">%</span>
                  </div>
                  <input type="text" class="form-control Discount" value="0" placeholder="Discount" name="nameDis" id="txtdis_{{index}}" oninput="validateDecimalInput(this)" onkeyup="reamount();" autocomplete="off" />
              </div>
                                                                </div>
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Amount
              <input type="text" class="form-control Amount" name="nameAmount" id="txtamount_{{index}}" disabled />
                                                                </div>
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="form-group row">
                                            <div class="col-sm-4" style="font-size: 16px;">
                                                CGST&nbsp<span class="messages" id="spantxtCgst" style="color: red; font-size: 15px"></span><span class="messages" id="spanDcgst" style="color: red; font-size: 15px"></span>

                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon">%</span>
                                                    </div>
                                                    <input type="text" class="form-control" value="9" placeholder="CGST" id="txtCgst" onkeyup="refind();" autocomplete="off" maxlength="18" onkeypress="return ValidateDecimalCGST(event);" />

                                                </div>
                                            </div>

                                            <div class="col-sm-4" style="font-size: 16px;">
                                                SGST&nbsp<span class="messages" id="spantxtSgst" style="color: red; font-size: 15px"></span> <span class="messages" id="spanDsgst" style="color: red; font-size: 15px"></span>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1">%</span>
                                                    </div>
                                                    <input type="text" class="form-control" value="9" placeholder="SGST" id="txtSgst" onkeyup="refind();" autocomplete="off" maxlength="18" onkeypress="return ValidateDecimalSGST(event);" />

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
                                                <input type="text" class="form-control" id="txtFrieghtCharges" onkeyup="refind();" value="0" placeholder="Frieght Charges" autocomplete="off" />
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
                                            <div class="col-sm-1"></div>
                                            <div class="col-sm-11">
                                                <center>
                                                    <input type="button" class="btn btn-success f-w-100 Accountant" style="width: 70px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnSubmit" value="Submit" onclick="SaveReq()" />
                                                    <input type="button" class="btn btn-success f-w-100 Accountant" style="width: 70px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnBack" value="Cancel" onclick="BackToList()" />
                                                </center>
                                            </div>
                                        </div>

                                        <span class="messages" id="SpandrpProductIdCmn" name="spanProduct" style="color: red; font-size: 15px"></span>
                                        <br />
                                        <br />
                                        <span class="messages" id="spanQty" name="spanQty" style="color: red; font-size: 15px"></span>
                                        <br />
                                        <span class="messages" id="spanPrice" name="spanPrice" style="color: red; font-size: 15px"></span>
                                        <br />
                                        <span class="messages" id="spanDis" name="spanDis" style="color: red; font-size: 15px"></span>
                                        <br />
                                        <span class="messages" id="spanPercentage" name="spanPercentage" style="color: red; font-size: 15px"></span>
                                        <br />
                                        <span class="messages" id="spanFrieghtChargesValue" name="spanFrieghtChargesValue" style="color: red; font-size: 15px"></span>
                                    </div>

                                    <input type="hidden" id="SuppID" value="0">
                                    <asp:HiddenField ID="userIdHiddenField" runat="server" />
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
            var sum = 0;

            $('.cloneya').each(function () {
                var price = $(this).find('.price').val();
                var quantity = $(this).find('[name="nameQty"]').val();
                var discount = $(this).find('[name="nameDis"]').val();

                var amount = (price * quantity) - (price * quantity * (discount / 100));
                $(this).find('[name="nameAmount"]').val(amount.toFixed(2));
                totalAmount += amount;
            });
            $('#txtTotalAmount').val(totalAmount.toFixed(2));


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
        var DrpProduct = function (name, value) {
            var self = this;
            self.PName = name;
            self.PID = value;
        };

        var DrpSupplier = function (name, value) {
            var self = this;
            self.SName = name;
            self.SID = value;
        };

        var Supplier_FDSS = function () {
            var self = this;
            this.SuppID = ko.observable(0);
            this.SupplierId = ko.observable('');
            this.PONumber = ko.observable('');
            this.PODate = ko.observable('');
            this.SPoNumber = ko.observable('');
            this.FileName = ko.observable('');
            this.PaymentTerms = ko.observable('');
            this.DeliveryPeriod = ko.observable('');
            this.Gst = ko.observable('');
            this.Address = ko.observable('');
            this.ProductsId = ko.observable('');
            this.LPrice = ko.observable('');
            this.Size = ko.observable('');
            this.Hsn = ko.observable('');
            this.Qty = ko.observable('');
            this.Discount = ko.observable('');
            this.LastPrice = ko.observable('');
            this.FrieghtCharges = ko.observable('');
            this.Cgst = ko.observable('');
            this.Sgst = ko.observable('');
        };

    </script>


</asp:Content>

