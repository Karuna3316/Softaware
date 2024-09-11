<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="PORequestList.aspx.cs" Inherits="PORequestList" %>

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
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="files/assets/css/style.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/css/jquery.mCustomScrollbar.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/css/sweetalert.css" />

    <link rel="stylesheet" type="text/css" href="files/assets/icon/ion-icon/css/ionicons.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/icofont/css/icofont.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/simple-line-icons/css/simple-line-icons.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/css/sweetalert.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/material-design/css/material-design-iconic-font.min.css" />
    <!-- feather Awesome -->
    <link rel="stylesheet" type="text/css" href="files/assets/icon/feather/css/feather.css " />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.brighttheme.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.buttons.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.history.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.mobile.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/pnotify/notify.css" />

    <!-- Select 2 css -->
    <link rel="stylesheet" href="files/bower_components/select2/dist/css/select2.min.css" />
    <!-- Multi Select css -->
    <link rel="stylesheet" type="text/css"
        href="files/bower_components/bootstrap-multiselect/dist/css/bootstrap-multiselect.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/multiselect/css/multi-select.css" />
    <!-- Data Table Css -->
    <link rel="stylesheet" type="text/css"
        href="files/bower_components/datatables.net-bs4/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/data-table/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" type="text/css"
        href="files/bower_components/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/css/jquery.mCustomScrollbar.css" />
    <link rel="stylesheet" href="files/bower_components/select2/dist/css/select2.min.css" />
    <!-- Multi Select css -->
    <link rel="stylesheet" type="text/css"
        href="files/bower_components/bootstrap-multiselect/dist/css/bootstrap-multiselect.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/multiselect/css/multi-select.css" />

    <script src="files/JS/xlsx.full-0.17.1.min.js"></script>

    <style>
        div.dataTables_wrapper div.dataTables_info {
            display: none;
        }

        th {
            background: #009933 !important;
            color: #ffffff;
            text-align: center !important;
            font-size: 15px !important;
        }

        .table {
            padding: 0px;
            margin: 0px;
            height: auto;
            width: 2040px;
        }

        .table-responsive {
            width: 99%;
            padding: 0px;
            margin: 0px;
            overflow-x: scroll;
            overflow-y: hidden;
            padding-left: 10px;
        }

        #basic-btn_filter {
            display: none;
        }

        .select2-container--default .select2-selection--single {
            background-color: #fff;
            border: 1px solid #aaa;
            border-radius: 4px;
            height: 46px;
        }

        .select2-results__option[aria-selected] {
            cursor: pointer;
            FONT-SIZE: 16PX;
        }

        .select2-container--default .select2-results__group {
            cursor: default;
            display: block;
            padding: 6px;
            font-size: 16px;
        }

        .select2-container--default.select2-container--open .select2-selection--single .select2-selection__arrow b {
            border-color: transparent transparent #FFF transparent;
            border-width: 0 4px 5px 4px;
        }

        .select2-container--default .select2-selection--single .select2-selection__arrow {
            height: 26px;
            position: absolute;
            top: 10px;
            right: 15px;
            width: 20px;
            color: #fff;
        }

        .select2-container--default .select2-search--dropdown .select2-search__field {
            border: 1px solid #aaa;
            font-size: 16px;
        }
    </style>

    <script>
        $(document).ready(function () {

            var objUrlParams = new URLSearchParams(window.location.search);
            var flagId = objUrlParams.get('flagId');
            if (flagId == 1) {
                new PNotify({
                    title: 'Registered',
                    text: 'Saved Successfully...',
                    icon: 'icofont icofont-info-circle',
                    type: 'success'
                });
            }
            else if (flagId == 2) {
                new PNotify({
                    title: 'Updated',
                    text: 'Updated Successfully...',
                    icon: 'icofont icofont-info-circle',
                    type: 'success'
                });
            }
            else if (flagId == 3) {
                new PNotify({
                    title: 'Notification',
                    text: 'It Already exists...',
                    icon: 'icofont icofont-info-circle',
                    type: 'success'
                });
            }

            fnDrpSupplier(0);
            BindSupplierList(0);


            var roleId = $('#<%= userIdHiddenField.ClientID %>').val();
            if (roleId == 2) {
                $("#btnAddNew").attr("hidden", true);
            }
            document.getElementById("downloadButton").addEventListener("click", function () {
                // Access the DataTable instance
                var table = $('#basic-btn').DataTable();

                // Get all the data from DataTables
                var tableData = table.rows().data().toArray();

                // Get table headings
                var headings = table.columns().header().toArray().map(function (cell) {
                    return $(cell).text(); // Use jQuery to extract text content
                });

                // Exclude the first and last column headings
                headings.shift();
                headings.pop();

                // Modify each row to exclude the first and last cells and get text content only
                for (var i = 0; i < tableData.length; i++) {
                    tableData[i] = tableData[i].slice(1, -1).map(function (cell, index) {
                        if (index === 9) {
                            // Extract data from the anchor element
                            return $(cell).find('span').text();
                        } else {
                            return $(cell).text(); // Use jQuery to extract text content
                        }
                    });
                }

                // Insert headings as the first row
                tableData.unshift(headings);

                // Create Excel workbook and worksheet
                var wb = XLSX.utils.book_new();
                var ws = XLSX.utils.aoa_to_sheet(tableData);

                // Add worksheet to workbook
                XLSX.utils.book_append_sheet(wb, ws, "TableData");

                // Save workbook as a file
                XLSX.writeFile(wb, "PORequest.xlsx");
            });


            $("#drpSupplierId").change(function () {
                var SupplierId = $(this).val();
                BindSupplierList(SupplierId);

            });



        });

        function fnDrpSupplier(SupplierId) {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "PORequest.aspx/BindSupplier",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    $("#drpSupplierId").html("");
                    $("#drpSupplierId").append($("<option></option>").val(0).html('Select Supplier Name'));
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
        function BindSupplierList(SupplierId) {
            $.ajax({

                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "PORequestList.aspx/GetSupplierList",
                data: "{SupplierId : " + SupplierId + "}",
                dataType: "json",
                success: function (data) {
                    formDocument().lstSupplierObj().constructor();
                    if ($.fn.dataTable.isDataTable('#basic-btn')) {
                        $('#basic-btn').DataTable().clear().destroy();
                    }
                    ko.mapping.fromJS(data.d, null, formDocument);
                    $('#basic-btn').DataTable({
                        "paging": false,
                        "ordering": false,
                        responsive: true,
                    });
                    var roleId = $('#<%= userIdHiddenField.ClientID %>').val();
                    if (roleId == 2) {
                        $(".Delete").hide();
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
        function Delete(itemI) {
            var iInd = itemI.getAttribute('SuppID');

            swal({
                title: "Are you sure?",
                text: "You will not be able to recover again!",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Yes, Delete It",
                cancelButtonText: "Cancel",
                closeOnConfirm: false,
                closeOnCancel: false
            },
                function (isConfirm) {
                    if (isConfirm) {


                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "PORequestList.aspx/DeleteSupplier",
                            data: "{SuppID : " + iInd + "}",
                            dataType: "json",
                            success: function (data) {
                                if (data.d != "" || data.d > 0 || data.d != null) {
                                    var inserted = data.d;
                                    if (inserted > 0) {
                                        new PNotify({
                                            title: 'Deleted',
                                            text: 'Deleted Successfully...',
                                            icon: 'icofont icofont-info-circle',
                                            type: 'warning'
                                        });
                                        BindSupplierList(0);
                                        swal.close();
                                    }
                                    else
                                        alert('pls verify');
                                }
                            },

                            error: function (response) {
                                alert(response.responseText);
                            },
                            failure: function (response) {
                                alert(response.responseText);
                            }
                        });
                    } else {
                        swal.close();
                    }
                });


        }
        function Edit(itemI) {

            location.href = "PORequest.aspx?SuppID=" + itemI.getAttribute('SuppID');

        }
        function newReq() {
            location.href = "PORequest.aspx";
        }
        function Reset() {
            fnDrpSupplier(0);
            BindSupplierList(0);
        }
        function downloadPCFile(objD) {
            if (objD.childNodes[1].title == "1")
                window.location = "FileDownloadHandler.ashx?fname=" + objD.childNodes[1].innerText;
            else
                alert('file does not exists');
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
                                                <h1 style="padding: 5px 0px 5px 10px;">PO Request</h1>
                                            </div>
                                            <div class="col-sm-6">
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
                                <div class="card" style="width: 100%; height: auto;">
                                    <div class="card-block" style="padding-left: 0px; padding-right: 10px; padding-bottom: 20px;">
                                        <div class="col-sm-3" style="font-size: 16px; line-height: 20px;">
                                            Supplier Name 
                                            <select class="js-example-basic-single col-sm-12" name="" id="drpSupplierId">
                                            </select>
                                            <span class="messages" id="SpanSupplierId" style="color: red; font-size: 15px; line-height: 30px;"></span>
                                        </div>
                                        <div class="col-sm-3" style="line-height: 84px;">
                                            <button type="button" class="btn  btn-success f-w-100" onclick="Reset()" style="height: 47px; width: 100px;">Reset</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="page-body">
                        <div class="row">

                            <div class="col-sm-12">
                                <div class="card" style="width: 100%; height: auto;">
                                    <div class="card-block" style="padding-left: 10px; padding-right: 10px;">
                                        <div class="access" style="margin-bottom: -30px; padding-left: 10px;">

                                            <button type="button" class="btn btn-success f-w-100" id="downloadButton" style="background-color: #34A0A4; color: #ffffff; border: 1px solid#34A0A4; padding: 4px 11px; border-radius: 2px; margin-top: 10px;">Download</button>

                                        </div>
                                        <div class="button" style="float: right; padding-right: 10px">

                                            <input type="button" class="btn btn-info" value="Add" id="btnAddNew" onclick="newReq()" />
                                        </div>
                                        <div class="card-block" style="padding-left: 10px; padding-right: 10px; border: none;">
                                            <div class="access" style="padding: 30px 0px 0px 10px;">

                                                <input id="myInput" type="text" placeholder="Search" autocomplete="off" style="width: 170px; font-size: 16px;height:30px;  float: right;border:1px solid #009933; padding-right: 5px;" />
                                            </div>
                                        </div>


                                        <div class="dt-responsive table-responsive" data-bind="with: formDocument" style="padding-left: 10px; padding-bottom: 10px;">
                                            <table id="basic-btn" class="table table-striped table-bordered nowrap" data-bind="hidden: formDocument().lstSupplierObj().length > 0" style="width: 100%;">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10%;">Action</th>
                                                        <th style="width: 20%;">Supplier Name</th>
                                                        <th style="width: 20%;">Project ID</th>
                                                        <th style="width: 20%;">Product Name</th>
                                                        <th style="width: 20%;">List Price</th>
                                                        <th style="width: 20%;">Quantity</th>
                                                        <th style="width: 20%;">Description</th>
                                                        <th style="width: 20%;">Hsn No</th>
                                                        <th style="width: 10%;">P.O Request No</th>
                                                        <th style="width: 10%;">P.O No</th>
                                                        <th style="width: 8%;">P.O Date</th>
                                                        <th style="width: 12%;">P.O File</th>
                                                        <th style="width: 10%;">Payment Terms</th>
                                                        <th style="width: 10%;">Delivery Period</th>
                                                        <th style="width: 10%;">Gst</th>
                                                        <th style="width: 10%;">Address</th>
                                                        <th style="width: 10%;">Status</th>
                                                        <th style="width: 10%;" class="Delete">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody data-bind="foreach:lstSupplierObj()" style="width: 100%;" id="body">
                                                    <tr>
                                                        <td style="text-align: center; width: 10%;">
                                                            <button type="button" name="data" class="btn  btn-success" onclick="Edit(this)" style="width: 90px; height: auto; background: #009933; margin-top: -3px; padding: 4px 11px;" data-bind="attr: { 'SuppID': SuppID,Disabled: btnedit}"><i class="ti-pencil" style="font-size: 16px;"></i>Edit</button>
                                                        </td>
                                                        <td style="width: 20%;"><span data-bind="text: SupplierId"></span></td>
                                                        <td style="width: 20%;"><span data-bind="text: ProductsId"></span></td>
                                                        <td style="width: 20%;"><span data-bind="text: ProductName"></span></td>
                                                        <td style="width: 20%; text-align: right;"><span data-bind="text: LPrice"></span></td>
                                                        <td style="width: 20%; text-align: right;"><span data-bind="text: Qty"></span></td>
                                                        <td style="width: 20%;"><span data-bind="text: Size"></span></td>
                                                        <td style="width: 20%;"><span data-bind="text: Hsn"></span></td>
                                                        <td style="width: 10%;"><span data-bind="text: PONumber"></span></td>
                                                        <td style="width: 10%;"><span data-bind="text: SPoNumber"></span></td>
                                                        <td style="width: 8%; text-align: center;"><span data-bind="text: PODate"></span></td>
                                                        <td style="text-align: left; width: 12%;">
                                                            <a href="#" onclick="downloadPCFile(this);">
                                                                <span id="fExists" data-bind="text: FileName, attr: { title: $data.fExists }"></span></a>
                                                        </td>
                                                        <td style="width: 10%; text-align: left;"><span data-bind="text: PaymentTerms"></span></td>

                                                        <td style="width: 10%; text-align: left;"><span data-bind="text: DeliveryPeriod"></span></td>
                                                        <td style="width: 10%; text-align: left;"><span data-bind="text: Gst"></span></td>
                                                        <td style="width: 10%; text-align: left;"><span data-bind="text: Address"></span></td>
                                                        <td style="width: 10%;"><span data-bind="text: Status"></span></td>
                                                        <td style="text-align: center; width: 10%;" class="Delete">
                                                            <button type="button" name="data" class="btn  btn-success" onclick="Delete(this)" style="width: 90px; height: auto; background: #FF7D7D; border: 1px solid #FF7D7D; margin-top: -3px; padding: 4px 11px;" data-bind="attr: { 'SuppID': SuppID,Disabled: btnDelete}"><i class="ti-trash" style="font-size: 16px;"></i>Delete</button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>

                                        <input type="hidden" id="roleId" value="0" />
                                        <input type="hidden" id="RoleName" value="0" />
                                        <asp:HiddenField ID="userIdHiddenField" runat="server" />


                                    </div>
                                    <!-- HTML5 Export Buttons end -->
                                </div>
                            </div>


                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>


    <!-- pnotify js -->
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.js"></script>
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.desktop.js"></script>
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.buttons.js"></script>
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.confirm.js"></script>
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.callbacks.js"></script>
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.animate.js"></script>
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.history.js"></script>
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.mobile.js"></script>
    <script type="text/javascript" src="files/bower_components/pnotify/dist/pnotify.nonblock.js"></script>
    <script type="text/javascript" src="files/assets/pages/pnotify/notify.js"></script>
    <!-- Select 2 js -->
    <script type="text/javascript" src="../files/bower_components/select2/dist/js/select2.full.min.js"></script>
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



    <!-- sweet alert js -->
    <script type="text/javascript" src="files/assets/js/sweetalert.js"></script>
    <script type="text/javascript" src="files/assets/js/modal.js"></script>
    <!-- sweet alert modal.js intialize js -->

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
    <script type="text/javascript" src="files/bower_components/select2/dist/js/select2.full.min.js"></script>
    <!-- Multiselect js -->
    <script type="text/javascript"
        src="files/bower_components/bootstrap-multiselect/dist/js/bootstrap-multiselect.js">


    </script>
    <script type="text/javascript" src="files/bower_components/multiselect/js/jquery.multi-select.js"></script>
    <script type="text/javascript" src="files/assets/js/jquery.quicksearch.js"></script>
    <!-- Custom js -->
    <script type="text/javascript" src="files/assets/pages/advance-elements/select2-custom.js"></script>
    <!-- Select 2 js -->
    <script type="text/javascript" src="files/bower_components/select2/dist/js/select2.full.min.js"></script>
    <!-- Multiselect js -->
    <script type="text/javascript"
        src="files/bower_components/bootstrap-multiselect/dist/js/bootstrap-multiselect.js">
    </script>
    <script type="text/javascript" src="files/bower_components/multiselect/js/jquery.multi-select.js"></script>
    <script type="text/javascript" src="files/assets/js/jquery.quicksearch.js"></script>

    <script>

        (function (root, factory) {
            if (typeof define === 'function' && define.amd) {
                define(['exports'], factory);
            } else if (typeof exports !== 'undefined') {
                factory(exports);
            } else {
                factory((root.dragscroll = {}));
            }
        }(this, function (exports) {
            var _window = window;
            var _document = document;
            var mousemove = 'mousemove';
            var mouseup = 'mouseup';
            var mousedown = 'mousedown';
            var EventListener = 'EventListener';
            var addEventListener = 'add' + EventListener;
            var removeEventListener = 'remove' + EventListener;
            var newScrollX, newScrollY;

            var dragged = [];
            var reset = function (i, el) {
                for (i = 0; i < dragged.length;) {
                    el = dragged[i++];
                    el = el.container || el;
                    el[removeEventListener](mousedown, el.md, 0);
                    _window[removeEventListener](mouseup, el.mu, 0);
                    _window[removeEventListener](mousemove, el.mm, 0);
                }

                // cloning into array since HTMLCollection is updated dynamically
                dragged = [].slice.call(_document.getElementsByClassName('table-responsive'));
                for (i = 0; i < dragged.length;) {
                    (function (el, lastClientX, lastClientY, pushed, scroller, cont) {
                        (cont = el.container || el)[addEventListener](
                            mousedown,
                            cont.md = function (e) {
                                if (!el.hasAttribute('nochilddrag') ||
                                    _document.elementFromPoint(
                                        e.pageX, e.pageY
                                    ) == cont
                                ) {
                                    pushed = 1;
                                    lastClientX = e.clientX;
                                    lastClientY = e.clientY;

                                    e.preventDefault();
                                }
                            }, 0
                        );

                        _window[addEventListener](
                            mouseup, cont.mu = function () { pushed = 0; }, 0
                        );

                        _window[addEventListener](
                            mousemove,
                            cont.mm = function (e) {
                                if (pushed) {
                                    (scroller = el.scroller || el).scrollLeft -=
                                        newScrollX = (-lastClientX + (lastClientX = e.clientX));
                                    scroller.scrollTop -=
                                        newScrollY = (-lastClientY + (lastClientY = e.clientY));
                                    if (el == _document.body) {
                                        (scroller = _document.documentElement).scrollLeft -= newScrollX;
                                        scroller.scrollTop -= newScrollY;
                                    }
                                }
                            }, 0
                        );
                    })(dragged[i++]);
                }
            }


            if (_document.readyState == 'complete') {
                reset();
            } else {
                _window[addEventListener]('load', reset, 0);
            }

            exports.reset = reset;
        }));

        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#body tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });

    </script>


    <script>
        var lstSuppliers_FDSS = function () {
            var self = this;

            this.lstSupplierObj = ko.observableArray([{
                SuppID: 0, SupplierId: '', PONumber: '', SPoNumber: '', PODate: '', FileName: '', fExists: '', Status: '', poamount: '', ProductName: '', ProductsId: '', LPrice: '',
                Size: '', Hsn: '', PaymentTerms: '', DeliveryPeriod: '', Gst: '', Address: '', btnedit: false, btnDelete: false, Qty:''
            }]);
        };
        formDocument = ko.observable(new lstSuppliers_FDSS());
        ko.applyBindings(new lstSuppliers_FDSS());
    </script>
</asp:Content>

