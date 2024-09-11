<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="Outward.aspx.cs" Inherits="Outwards" %>

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
    <!-- feather Awesome -->
    <link rel="stylesheet" type="text/css" href="files/assets/icon/feather/css/feather.css" />
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

    <style type="text/css">
        .input-group-text {
            background-color: #0ac282;
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
                                                <h1 style="padding:5px 0px 5px 10px;">Outward</h1>
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
                                            <div class="col-sm-3">

                                            <label class="col-form-label" style="font-size: 16px;">Customer Name <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                            
                                                <select class="js-example-basic-single col-sm-12" id="drpCustomerNameId">
                                                </select><span class="messages" id="spanCustomerName" style="color: red; font-size: 15px;line-height:30px;"></span>
                                            </div>
                                            

                                        <div class="col-sm-3">
                                            <label class="col-form-label" style="font-size: 16px;">Outward Type <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup></label>
                                            
                                                <select class="js-example-basic-single col-sm-2" id="drpOutwardTypeId">
                                                </select><span class="messages" id="spanOutwardtype" style="color: red; font-size: 15px;line-height:30px;"></span>
                                            </div>
                                            
                                            <div class="col-sm-3">
                                            <label class="col-form-label" style="font-size: 16px;">DC No </label>
                                                <input type="text" class="form-control"  id="Dpnocode" placeholder="DC No" disabled />
                                                <span class="messages" id="" style="color: red; font-size: 15px;line-height:30px;"></span>
                                            </div>
                                            <div class="col-sm-3">
                                            <label class="col-form-label" style="font-size: 16px;">Project Id</label>
                                                <input type="text" class="form-control" autocomplete="off" id="ProjectId" placeholder="Project Id" />
                                                <span class="messages" id="" style="color: red; font-size: 15px; line-height: 30px;"></span>
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
                                <div class="card" style="padding-right:20px;padding-left:20px;">
                                    <div class="card-block" style="padding: 40px;">
                                        <h3 style="padding-bottom: 5px; font-weight: 600;">Product Details</h3>
                                        <div class="form-group row" id="dynamicContainer">
                                            <div class="col-sm-12">
                                                <div class="clone-widget cloneya-wrap original" id="pro">
                                                    <div class="unit widget left-50 right-50 toclone cloneya" style="padding-bottom: 10px;">
                                                        <button type="button" class="btn btn-primary clone-btn-right clone" >
                                                            <i class="icofont icofont-plus"></i>
                                                        </button>
                                                        <tb>
                                                          <button type="button" class="addon-btn adn-50 adn-left delete" >
                                                            <i class="icofont icofont-minus"></i>
                                                                  </button>
                                                            <div class="form-group row">
                                                            <div class="col-sm-3" style="font-size: 16px;">
                                                                Product   <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                                             <select class="drpProduct js-example-basic-single col-sm-12" name="nameProduct" id="drpProduct" ></select>
                                                            </div>
    
                                                            <div class="col-sm-3" style="font-size: 16px;">
                                                                Quantity
                                                            <input type="text" class="form-control Quantity" id="Qty_{{index}}" name="quantity" disabled />
                                                           </div>

                                                            <div class="col-sm-3" style="font-size: 16px;">
                                                                Outward Qty        
                                                             <input type="text" class="form-control Outwarded" placeholder="Outward Qty" name="nameOut" id="txtRe_{{index}}"  autocomplete="off"oninput="$('#spanQuantity').text('')" onkeypress="return ValidateDecimalQty(event);"/>
                                                            <span class="messages" id="spanRev" style="color: red; font-size: 15px;line-height:30px;"></span></div>
                                                            <div class="col-sm-3" style="font-size: 16px;">
                                    Description
                                    <input type="text" class="form-control Description" name="Description" disabled id="Description"/>
                                </div>
                                                        </div>
                                                            <div class="form-group row">
                                
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Net Price
                                                                <input type="text" class="form-control Price" name="Price" disabled id="Price" />
                                                                </div>
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Profit Percentage
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text" id="basic-addon1">%</span>
                                                                        <input type="text" class="form-control Profit" name="Profit"  id="Profit" autocomplete="off" value="0" onkeypress="return ValidateDecimalQty(event);"/>
                                                                    </div>
                                                                
                                                                </div>
                                                                <div class="col-sm-3" style="font-size: 16px;">
                                                                    Final Price / Each
                                                                    <input type="text" class="form-control FinalPriceEach" id="FinalPriceEach" name="FinalPriceEach" disabled />
                                                                </div>
                                                                <div class="col-sm-3" style="font-size: 16px; float:right !important;">
                                                                    Final Price 
                                                                    <input type="text" class="form-control FinalPrice" id="FinalPrice" name="FinalPrice" disabled />
                                                                </div>
                                                                </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row" style="padding-top: 30px;">
                                            <div class="col-sm-1"></div>
                                            <div class="col-sm-11">
                                                <center>
                                                    <input type="button" class="btn btn-success f-w-100" style="width: 70px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnSubmit" value="Submit" onclick="SaveOutward()" />
                                                    <input type="button" class="btn btn-success f-w-100" style="width: 70px; height: auto; margin-top: -3px; padding: 4px 11px;" id="btnBack" value="Cancel" onclick="BackToList()" />
                                                </center>

                                            </div>
                                        </div>


                                        <span class="messages" id="spanOutwardtotal" style="color: red; font-size: 15px"></span>
                                        <span class="messages" id="spanReceived1" style="color: red; font-size: 15px"></span>
                                        <span class="messages" id="spandrpProduct" style="color: red; font-size: 15px"></span>
                                        <span class="messages" id="spanQuantity" style="color: red; font-size: 15px"></span>
                                        <input type="hidden" id="OutwardId" value="0" />
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                    
                </div>

            </div>
        </div>
    </div>

 
    <script type="text/javascript">
   
        $(document).ready(function () {
            var objUrlParams = new URLSearchParams(window.location.search);
            var OutwardId = objUrlParams.get('OutwardId');
            if (OutwardId != null) {
                BindOutward(OutwardId);
            }
            else {
                fnDrpCustomerName(0);
                fnDrpOutwardType(0);
                fnDrpProduct(0,0);
                BindDCNo();


            }
            $("#drpCustomerNameId").change(function () {

                $('#spanCustomerName').text('');
               
            });
            $("#drpOutwardTypeId").change(function () {

                $('#spanOutwardtype').text('');
               
            });

            $(document).on('keyup keydown', '.Outwarded', function (event) {
                var Outwarded = parseFloat($(this).val());
                var quantity = parseFloat($(this).closest('.cloneya').find('.Quantity').val());
                var SpanMessage = $(this).closest('.cloneya').find('.messages');
                var totalOutwarded = 0;
                var drpProduct = $(this).closest('.cloneya').find('.drpProduct').val();

                // Calculate the total received quantity for the specific drpProduct
                $('.cloneya .Outwarded').each(function () {
                    var value = parseFloat($(this).val());
                    var product = $(this).closest('.cloneya').find('.drpProduct').val();
                    if (!isNaN(value) && product === drpProduct) {
                        totalOutwarded += value;
                    }
                });

                if (Outwarded > quantity) {
                    SpanMessage.text('Outward Quantity exceeds');
                } else {
                    SpanMessage.text('');
                }

                // Perform the check against the total received quantity
                var isActiveElement = false; // Flag to track the current active element
                $('.cloneya .Outwarded').each(function () {
                    var product = $(this).closest('.cloneya').find('.drpProduct').val();
                    var messageElement = $(this).closest('.cloneya').find('.messages');
                    if (product === drpProduct) {
                        if ($(this).is(':focus')) {
                            isActiveElement = true;
                            if (totalOutwarded > quantity) {
                                messageElement.text('Total Outward Quantity exceeds');
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

            $(document).on("change", ".drpProduct", function () {
                $("#spandrpProduct").text("");
                $(this).closest('.cloneya').find('.Quantity').val('');
                $(this).closest('.cloneya').find('.Outwarded').val('');

                var ProductsId = $(this).val();
                var OutwardId = $('#OutwardId').val();
                if (ProductsId != '0' && ProductsId != '') {
                    var Quantity = $(this).closest('.cloneya').find('.Quantity');
                    var Price = $(this).closest('.cloneya').find('.Price');
                    var Description = $(this).closest('.cloneya').find('.Description');
                    var Outwarded = $(this).closest('.cloneya').find('.Outwarded').val();
                    var Profit = $(this).closest('.cloneya').find('.Profit').val();
                    var FinalPriceEach = $(this).closest('.cloneya').find('.FinalPriceEach');
                    var FinalPrice = $(this).closest('.cloneya').find('.FinalPrice');

                    Qtyprice(OutwardId, ProductsId, Quantity, Price, Description, Outwarded, Profit, FinalPriceEach, FinalPrice);
                } else {
                    $(this).closest('.cloneya').find('.Quantity').val('');
                    $(this).closest('.cloneya').find('.Outwarded').val('');
                    $(this).closest('.cloneya').find('.Price').val('');
                    $(this).closest('.cloneya').find('.Profit').val(0);
                    $(this).closest('.cloneya').find('.FinalPriceEach').val('');
                    $(this).closest('.cloneya').find('.FinalPrice').val('');
                }
            });

            $(document).on("click", ".clone-btn-right", function () {
                cloneDiv();

            });

            $(document).on("click", ".delete", function () {
                var cloneyaElement = $(this).closest('.cloneya');
                var cloneyaLength = $('.cloneya').length;

                var objUrlParams = new URLSearchParams(window.location.search);
                var InwardId = objUrlParams.get('OutwardId');
                if (InwardId != null && cloneyaLength === 1) {

                    cloneyaElement.find('.Quantity').val('');
                    cloneyaElement.find('.Outwarded').val('');

                    cloneyaElement.find('.Price').val('');
                    cloneyaElement.find('.Profit').val(0);
                    cloneyaElement.find('.FinalPriceEach').val('');
                    cloneyaElement.find('.FinalPrice').val('');
                    fnDrpProduct(0,0);
                }
                else if (cloneyaLength == 1) {
                    cloneyaElement.find('.Quantity').val('');
                    cloneyaElement.find('.Outwarded').val('');

                    cloneyaElement.find('.Price').val('');
                    cloneyaElement.find('.Profit').val(0);
                    cloneyaElement.find('.FinalPriceEach').val('');
                    cloneyaElement.find('.FinalPrice').val('');
                    fnDrpProduct(0,0);
                }
                else {
                    // Remove the current element if it doesn't have the plus button
                    cloneyaElement.remove();

                    // Show the plus button on the last created clone
                    $(".cloneya:last .clone-btn-right").show();
                    cloneyaElement.find('.Quantity').val('');
                    cloneyaElement.find('.Outwarded').val('');
                    cloneyaElement.find('.Price').val('');
                    cloneyaElement.find('.Profit').val(0);
                    cloneyaElement.find('.FinalPriceEach').val('');
                    cloneyaElement.find('.FinalPrice').val('');
                }


            });

            $(document).on("input", ".Price, .Profit, .Outwarded", function () {
                var cloneyaContainer = $(this).closest('.cloneya');
                var Outwarded = parseInt(cloneyaContainer.find('.Outwarded').val());
                var Price = parseFloat(cloneyaContainer.find('.Price').val());
                var Profit = parseFloat(cloneyaContainer.find('.Profit').val());
                var FinalPriceEach = Price + (Price * (Profit / 100)); 
                var FinalPrice = FinalPriceEach * Outwarded;
                cloneyaContainer.find('.FinalPriceEach').val(FinalPriceEach.toFixed(2));
                cloneyaContainer.find('.FinalPrice').val(FinalPrice.toFixed(2));
            });

        });

        function cloneDiv() {
            var template = `
            <div class="col-sm-12 cloneya duplicate">
                <div class="clone-widget cloneya-wrap">
                    <div class="unit widget left-50 right-50 " style="padding-bottom:10px;">
                        <button type="button" class="btn btn-primary clone-btn-right clone" >
                            <i class="icofont icofont-plus"></i>
                        </button><tb>
                            <button type="button" class="addon-btn adn-50 adn-left delete" >
                                <i class="icofont icofont-minus"></i>
                            </button>
                            <div class="form-group row">
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Product <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                    <select class="drpProduct js-example-basic-single col-sm-12" name="nameProduct" id="drpProduct" ></select>
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Quantity
                                    <input type="text" class="form-control Quantity" id="Qty_{{index}}" name="quantity" disabled />
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Outward Qty <span class="messages" id="spanRev" style="color: red; font-size: 15px"></span>
                                    <input type="text" class="form-control Outwarded" placeholder="Outward Qty" name="nameOut" id="txtRe_{{index}}" autocomplete="off" oninput="$('#spanQuantity').text('')" onkeypress="return ValidateDecimalQty(event);" />
                                </div>
<div class="col-sm-3" style="font-size: 16px;">
                                    Description
                                    <input type="text" class="form-control Description" name="Description" disabled id="Description"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Net Price
                                    <input type="text" class="form-control Price" name="Price" disabled id="Price" />
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Profit Percentage
                                    <input type="text" class="form-control Profit" value="0" name="Profit" id="Profit" autocomplete="off" onkeypress="return ValidateDecimalQty(event);"/>
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Final Price / Each
                                    <input type="text" class="form-control FinalPriceEach" id="FinalPriceEach" name="FinalPriceEach" disabled />
                                </div>
                                <div class="col-sm-3" style="font-size: 16px; float:right !important;">
                                                                    Final Price 
                                                                    <input type="text" class="form-control FinalPrice" id="FinalPrice" name="FinalPrice" disabled />
                                                                </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div> `;


            var clonedDiv = $(template);

            clonedDiv.find('.js-example-basic-single').select2();
            $('.clone-btn-right').hide();
            $("#dynamicContainer").append(clonedDiv);
            fnDrpProductClone(0, clonedDiv,0);
        }

        function BindDCNo() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Outward.aspx/BindDCNo",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    if (data.d != null) {
                        if (data.d.DCNo) {

                            $("#Dpnocode").val(data.d.DCNo);


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

        function fnDrpCustomerName(CustomerNameId) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Outward.aspx/BindCustomerName",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    $("#drpCustomerNameId").html("");
                    $("#drpCustomerNameId").append($("<option></option>").val('0').html('Select Customer Name'));
                    $.each(data.d, function (key, value) {
                        $("#drpCustomerNameId").append($("<option></option>").val(value.CID).html(value.CustomerName));
                    });
                    $("#drpCustomerNameId").val(CustomerNameId);
                },
                error: function (result) {
                    alert("Failed to load Customer Name");
                }
            });

        }

        function fnDrpOutwardType(OutwardTypeId) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Outward.aspx/BindOutwardType",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    $("#drpOutwardTypeId").html("");
                    $("#drpOutwardTypeId").append($("<option></option>").val('0').html('Select Outward Type'));
                    $.each(data.d, function (key, value) {
                        $("#drpOutwardTypeId").append($("<option></option>").val(value.Id).html(value.Description));
                    });
                    $("#drpOutwardTypeId").val(OutwardTypeId);
                },
                error: function (result) {
                    alert("Failed to load Outward Type");
                }
            });

        }

        function fnDrpProduct(ProductId, OutwardId) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Outward.aspx/BindProduct",
                data: "{OutwardId: '" + OutwardId + "'}",
                dataType: "json",
                success: function (data) {

                    var dropdownOptions = '<option value="0">Select Product Name</option>';
                    $.each(data.d, function (key, value) {
                        dropdownOptions += "<option value='" + value.InvProductID + "'>" + value.ProductsId + "</option>";
                    });

                    // Apply options to all the dropdowns with class 'drpProduct'
                    $(".drpProduct").html(dropdownOptions);
                    $(".drpProduct").val(ProductId);

                },
                error: function (result) {
                    alert("Failed to load Product Name");
                }
            });
        }
     
        function Qtyprice(OutwardId, ProductsId, Qtyprice, Price, Description, Outwarded, Profit, FinalPriceEach, FinalPrice) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Outward.aspx/getQty",
                data: "{OutwardId: '" + OutwardId + "',ProductsId: '" + ProductsId + "'}",
                dataType: "json",
                success: function (data) {
                    Qtyprice.val(data.d.Qty);
                    Price.val(data.d.Price);
                    Description.val(data.d.Description);
                    var Pri = parseFloat(data.d.Price);
                    var Prof = parseFloat(Profit);
                    var FinalPri = Pri + (Pri * (Prof / 100));

                    FinalPriceEach.val(FinalPri.toFixed(2));
                    FinalPrice.val(FinalPri.toFixed(2) * Outwarded);
                },
                error: function (result) {
                    alert("Failed to load Quantity");
                }
            });
        }

        var isRcQtyOk = true; // Global variable to store the received quantity validity

        function SaveOutward() {
            var isValid = false;

            if (hasddlValue("#drpCustomerNameId", "#spanCustomerName", "Select Customer Name")

                && hasddlValue("#drpOutwardTypeId", "#spanOutwardtype", "Select Outward Type")
                )
                //isValid = true;

                if (isRcQtyOk == true) {
                    isValid = true;
                } else {
                    isValid = false;
                    $('#spanOutwardtotal').text("Outward Quantity exceeds");
                }

           


            if (isValid && isRcQtyOk) {

                var parentContainers = $('#dynamicContainer').find('.cloneya');
                var hasZeroValue = false;
                var hasEmptyTextbox = false; // Initialize as false
                parentContainers.each(function () {
                    var container = $(this);
                    var dropdown = container.find('.drpProduct');
                    var textbox = container.find('.Outwarded');
                    if (dropdown.val() === '0') {
                        hasZeroValue = true;
                        return false;
                    }
                    if (textbox.val() === '') {
                        hasEmptyTextbox = true; // Set hasEmptyTextbox to true if an empty value is found
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
                    $("#spanQuantity").text("Enter the Outward Qty");
                    $("#spandrpProduct").text("");
                    return; 
                }
                //ProductID
                var nameProduct = document.getElementsByName("nameProduct");
                var ProductsId = [];
                for (var i = 0; i < nameProduct.length; i++) {
                    ProductsId.push(nameProduct[i].value);
                }

                //Outwarded
                var nameOut = document.getElementsByName("nameOut");
                var OutwardedQty = [];
                for (var i = 0; i < nameOut.length; i++) {
                    OutwardedQty.push(nameOut[i].value);
                }

                //Qty
                var quantity = document.getElementsByName("quantity");
                var Qty = [];
                for (var i = 0; i < quantity.length; i++) {
                    Qty.push(quantity[i].value);
                }

                //Price
                var namePrice = document.getElementsByName("Price");
                var Price = [];
                for (var i = 0; i < namePrice.length; i++) {
                    Price.push(namePrice[i].value);
                }
                
                // Description
                var nameDescription = document.getElementsByName("Description");
                var Description = [];
                for (var i = 0; i < nameDescription.length; i++) {
                    if (nameDescription[i].value && nameDescription[i].value.trim() !== '') {
                        Description.push(nameDescription[i].value);
                    } else {
                        Description.push('-');
                    }
                }


                //Profit
                var nameProfit = document.getElementsByName("Profit");
                var Profit = [];
                for (var i = 0; i < nameProfit.length; i++) {
                    Profit.push(nameProfit[i].value);
                }
                var OutObj = new Outward();
                OutObj.OutwardId = $('#OutwardId').val();
                OutObj.DCNo = $('#Dpnocode').val();
                OutObj.CustomerId = $('#drpCustomerNameId').val();
                OutObj.OutwardTypeId = $('#drpOutwardTypeId').val();
                OutObj.ProjectId = $('#ProjectId').val();


                OutObj.OutwardedQty = OutwardedQty.toString();
                OutObj.ProductsId = ProductsId.toString();
                OutObj.Qty = Qty.toString();
                OutObj.Price = Price.toString();
                OutObj.Description = Description.toString();
                OutObj.Profit = Profit.toString();

                $("#btnSubmit").attr("disabled", true);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Outward.aspx/SaveOrUpdateOutward",
                    data: "{OutObj : " + ko.toJSON(OutObj) + "}",
                    dataType: "json",
                    success: function (data) {
                        if (data.d != "") {

                            var inserted = data.d;
                            if (inserted != null) {
                                location.href = "OutwardList.aspx?flagId=" + data.d;
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

        function BindOutward(OutwardId) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Outward.aspx/GetOutwardforEdit",
                data: "{OutwardId : " + OutwardId + "}",
                dataType: "json",
                success: function (data) {

                    if (data.d != null) {
                        $('#OutwardId').val(data.d.OutwardId);
                        $('#InwardId').val(data.d.InwardId);
                        $('#Dpnocode').val(data.d.DCNo);
                        $('#ProjectId').val(data.d.ProjectId);


                           
                        fnDrpCustomerName(data.d.CustomerId);
                        fnDrpOutwardType(data.d.OutwardTypeId);
                        //fnDrpProduct(data.d.ProductsId, OutwardId);

                        var ProductsId = data.d.ProductsId.split(",");
                        var Qty = data.d.Qty.split(",");
                        var OutwardedQty = data.d.OutwardedQty.split(",");
                        var Price = data.d.Price.split(",");
                        var Description = data.d.Description.split(",");
                        var Profit = data.d.Profit.split(",");
                        for (var i = 0; i < ProductsId.length; i++) {
                            cloneDivEdit(ProductsId[i], Qty[i], OutwardedQty[i], Price[i], Description[i], Profit[i], OutwardId);

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

        function cloneDivEdit(ProductId, Quantity, Outwarded, Price, Description, Profit, OutwardId) {
            $('#pro').remove();
            var template = `
            <div class="col-sm-12  cloneya duplicate EditDuplicate">
                <div class="clone-widget cloneya-wrap">
                    <div class="unit widget left-50 right-50 " style="padding-bottom:10px;">
                        <button type="button" class="btn btn-primary clone-btn-right clone" >
                            <i class="icofont icofont-plus"></i>
                        </button><tb>
                            <button type="button" class="addon-btn adn-50 adn-left delete" >
                                <i class="icofont icofont-minus"></i>
                            </button>

                            <div class="form-group row">
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Product <sup><i class="fa fa-asterisk" aria-hidden="true" style="color: red; font-size: 10px;"></i></sup>
                                    <select class="drpProduct js-example-basic-single col-sm-12" name="nameProduct" id="drpProduct" ></select>
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Quantity
                                    <input type="text" class="form-control Quantity" id="Qty_{{index}}" name="quantity" disabled />
                                </div>

                                <div class="col-sm-3" style="font-size: 16px;">
                                    Outward Qty
                                    <span class="messages" id="spanOutward" style="color: red; font-size: 15px"></span>
                                    <input type="text" class="form-control Outwarded" placeholder="Outward Qty" name="nameOut" id="txtOut_{{index}}" autocomplete="off" oninput="$('#spanQuantity').text('')" onkeypress="return ValidateDecimalQty(event);" />
                                </div>
<div class="col-sm-3" style="font-size: 16px;">
                                    Description
                                    <input type="text" class="form-control Description" name="Description" disabled id="Description"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Net Price
                                    <input type="text" class="form-control Price" name="Price" disabled id="Price"/>
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Profit Percentage
                                    <input type="text" class="form-control Profit" value="0" name="Profit" id="Profit" autocomplete="off" onkeypress="return ValidateDecimalQty(event);"/>
                                </div>
                                <div class="col-sm-3" style="font-size: 16px;">
                                    Final Price / Each
                                    <input type="text" class="form-control FinalPriceEach" id="FinalPriceEach" name="FinalPriceEach" disabled />
                                </div>
                                <div class="col-sm-3" style="font-size: 16px; float:right !important;">
                                                                    Final Price 
                                                                    <input type="text" class="form-control FinalPrice" id="FinalPrice" name="FinalPrice" disabled />
                                                                </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>`;

            var clonedDiv = $(template);
            
            clonedDiv.find('.js-example-basic-single').select2();
            fnDrpProductClone(ProductId, clonedDiv, OutwardId);
            clonedDiv.find("input[name='quantity']").val(Quantity);
            clonedDiv.find("input[name='nameOut']").val(Outwarded);
            clonedDiv.find("input[name='Price']").val(Price);
            clonedDiv.find("input[name='Description']").val(Description);
            clonedDiv.find("input[name='Profit']").val(Profit);

            var Quantity = clonedDiv.find('.Quantity');
            var Price = clonedDiv.find('.Price');
            var Description = clonedDiv.find('.Description');
            var Outwarded = clonedDiv.find('.Outwarded').val();
            var Profit = clonedDiv.find('.Profit').val();
            var FinalPriceEach = clonedDiv.find('.FinalPriceEach');
            var FinalPrice = clonedDiv.find('.FinalPrice');

            Qtyprice(OutwardId, ProductId, Quantity, Price, Description, Outwarded, Profit, FinalPriceEach, FinalPrice);


            var cloneyaContainer = clonedDiv.closest('.cloneya');
            var Outwarded = parseFloat(cloneyaContainer.find('.Outwarded').val());
            var Price = parseFloat(cloneyaContainer.find('.Price').val());
            var Profit = parseFloat(cloneyaContainer.find('.Profit').val());
            var FinalPriceEach = Price + (Price * (Profit / 100));
            var FinalPrice = FinalPriceEach * Outwarded;
            cloneyaContainer.find('.FinalPriceEach').val(FinalPriceEach.toFixed(2));
            cloneyaContainer.find('.FinalPrice').val(FinalPrice.toFixed(2));
            $('.clone-btn-right').hide();

            $("#dynamicContainer").append(clonedDiv);
        }     

        //cloning the Product Dropdown

        function fnDrpProductClone(ProductId, clonedDiv, OutwardId) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Outward.aspx/BindProduct",
                data: "{OutwardId: '" + OutwardId + "'}",
                dataType: "json",
                success: function (data) {
                    
                    var dropdownOptions = '<option value="0">Select Product Name</option>';
                    $.each(data.d, function (key, value) {
                        dropdownOptions += "<option value='" + value.InvProductID + "'>" + value.ProductsId + "</option>";
                    });

                    // Apply options to all the dropdowns with class 'drpProduct'                     
                    clonedDiv.find(".drpProduct").html(dropdownOptions);
                    clonedDiv.find(".drpProduct").val(ProductId).trigger('change.select2');                  

                },
                error: function (result) {
                    alert("Failed to load Product Name");
                }
            });
        }

        function ValidateDecimalQty(e) {
            
            var nameRev = e.nameRev || e.which;

            var lblError = document.getElementById("OutwardId");
            lblError.nameRev = "input[name = 'nameOut']";

            //Regex for Valid Characters i.e. Alphabets.
            var regex = /^[0-9]*(\.[0-9]{0,2})?$/;

            //Validate TextBox value against the Regex.
            var isValid = regex.test(String.fromCharCode(nameRev));
            if (!isValid) {
                
                hasValue("input[name='nameOut']", "#spanReceived1", "Numbers Only Allowed");
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
            location.href = "OutwardList.aspx";
        }

    </script>

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

    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="files/bower_components/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="files/bower_components/modernizr/modernizr.js"></script>
    <script type="text/javascript" src="files/bower_components/modernizr/feature-detects/css-scrollbars.js"></script>


     <script type="text/javascript">

         var Outward = function () {
             var self = this;
             this.OutwardId = ko.observable(0);
             this.CustomerNameId = ko.observable(0);
             this.Qty = ko.observable('');
             this.Price = ko.observable('');
             this.Profit = ko.observable('');
             this.ProductsId = ko.observable(0);
             this.OutwardedQty = ko.observable(0);
             this.DCNo = ko.observable('');
             this.ProjectId = ko.observable('');

         };

     </script>

</asp:Content>

