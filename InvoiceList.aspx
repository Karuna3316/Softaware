<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="InvoiceList.aspx.cs" Inherits="InvoiceList" %>

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
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.brighttheme.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.buttons.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.history.css" />
    <link rel="stylesheet" type="text/css" href="files/bower_components/pnotify/dist/pnotify.mobile.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/pages/pnotify/notify.css" />
    <script src="files/JS/xlsx.full-0.17.1.min.js"></script>

    <script type="text/javascript">
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
                    text: 'It already exists...',
                    icon: 'icofont icofont-info-circle',
                    type: 'success'
                });
            }

            BindInvoice();

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

                        if (roleId == 2 && $(cell).hasClass("Accountant")) {
                            return ""; // If roleId is 2 and cell has "Accountant" class, return empty string
                        } else if (index == 5) {
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
                XLSX.writeFile(wb, "Invoice.xlsx");
            });

            var roleId = $('#<%= userIdHiddenField.ClientID %>').val();
            if (roleId == 2) {
                $("#btnAddNew").attr("hidden", true);
            }


        });

        function newReq() {
            location.href = "Invoice.aspx";

        }

        function downloadPCFile(objD) {
            if (objD.childNodes[1].title == "1")
                window.location = "FileDownloadHandler.ashx?fname=" + objD.childNodes[1].innerText;
            else
                alert('file does not exists');
        }

        function EditInvoice(itemI) {
            location.href = "Invoice.aspx?InvoiceId=" + itemI.getAttribute('InvoiceId');

        }

        function BindInvoice() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "InvoiceList.aspx/getinvoice",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    formDocument().lstInObj().constructor();
                    if ($.fn.dataTable.isDataTable('#basic-btn')) {
                        $('#basic-btn').DataTable().clear().destroy();
                    }
                    ko.mapping.fromJS(data.d, null, formDocument);
                    $('#basic-btn').DataTable({
                        "paging": false,
                        "ordering": false,
                        responsive: false,
                    });
                    var roleId = $('#<%= userIdHiddenField.ClientID %>').val();
                    if (roleId == 2) {
                        $(".Accountant").hide();
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

        function DeleteDate(itemI) {
            var iInd = itemI.getAttribute('InvoiceId');
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
                            url: "InvoiceList.aspx/deleteInvoice",
                            data: "{lReqId : " + iInd + "}",
                            dataType: "json",
                            success: function (data) {
                                if (data.d != "") {
                                    var inserted = data.d;
                                    if (inserted > 0) {

                                        new PNotify({
                                            title: 'Deleted',
                                            text: 'Deleted Successfully...',
                                            icon: 'icofont icofont-info-circle',
                                            type: 'warning'
                                        });
                                        BindInvoice();
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

    </script>

    <style type="text/css">
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

        div.dataTables_wrapper div.dataTables_filter {
            text-align: right;
            display: none;
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
                                                <h1 style="padding: 5px 0px 5px 10px;">Invoice</h1>
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

                                    <div class="card-block" style="padding-left: 10px; padding-right: 10px;">
                                        <div class="access" style="margin-bottom: -30px; padding-left: 10px;">

                                            <button type="button" class="btn btn-success f-w-100" id="downloadButton" style="background-color: #34A0A4; color: #ffffff; border: 1px solid#34A0A4; padding: 4px 11px; border-radius: 2px; margin-top: 10px;">Download</button>

                                        </div>
                                        <div class="button" style="float: right; padding-right: 10px">

                                            <input type="button" class="btn btn-info" id="btnAddNew" value="Add" onclick="location.href='Invoice.aspx'" />
                                        </div>
                                        <div class="card-block" style="padding-left: 0px; padding-right: 10px; border: none;">
                                            <div class="access" style="padding: 30px 0px 0px 10px;">

                                                <input id="myInput" type="text" placeholder="Search" autocomplete="off" style="width: 170px; font-size: 16px; height: 30px; float: right; border: 1px solid #009933; padding-right: 5px;" />

                                            </div>
                                        </div>
                                        <br />
                                        <div class="dt-responsive table-responsive" style="padding-left: 10px; padding-bottom: 10px;" data-bind="with: formDocument">
                                            <table id="basic-btn" class="table table-striped table-bordered nowrap" data-bind="hidden: formDocument().lstInObj().length > 0" style="width: 100%;">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10%;">Action</th>
                                                        <th style="width: 10%;">Customer Name</th>
                                                        <th style="width: 10%;">Invoice Request No</th>
                                                        <th style="width: 10%;">Invoice Type</th>
                                                        <th style="width: 10%;">Invoice No</th>
                                                        <th style="width: 10%;">Invoice Date</th>
                                                        <th style="width: 10%;">Invoice File</th>
                                                        <th style="width: 10%;">Product Name</th>
                                                        <th style="width: 10%;">Description</th>
                                                        <th style="width: 10%;">Make</th>
                                                        <th style="width: 10%;" class="Accountant">Each Price</th>
                                                        <th style="width: 10%;">Quantity</th>
                                                        <th style="width: 10%;" class="Accountant">Profit Percentage (%)</th>
                                                        <th style="width: 10%;">Total Price</th>
                                                        <th style="width: 10%;">HSN</th>
                                                        <th style="width: 10%;">Gst No</th>
                                                        <th style="width: 10%;">Address</th>
                                                        <th style="width: 10%;">Status</th>
                                                        <th style="width: 10%;" class="Accountant">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody data-bind="foreach: formDocument().lstInObj()" style="width: 100%;" id="body">
                                                    <tr>
                                                        <td style="text-align: center; width: 10%;">
                                                            <button type="button" name="data" class="btn  btn-success" onclick="EditInvoice(this)" style="width: 90px; height: auto; background: #009933; margin-top: -3px; padding: 4px 11px;" data-bind="attr: { 'InvoiceId': InvoiceId,Disabled: btnedit}"><i class="ti-pencil" style="font-size: 16px;"></i>Edit</button>
                                                        </td>
                                                        <td style="text-align: left; width: 10%;"><span data-bind="text:SupplierName"></span></td>
                                                        <td style="text-align: left; width: 10%;"><span data-bind="text:InvoiceNo"></span></td>
                                                        <td style="text-align: left; width: 10%;"><span data-bind="text:InvType"></span></td>
                                                        <td style="text-align: left; width: 10%;"><span data-bind="text:InvNo"></span></td>
                                                        <td style="text-align: center; width: 10%;"><span data-bind="text:InvoiceDate"></span></td>
                                                        <td style="text-align: left; width: 15%;">
                                                            <a href="#" onclick="downloadPCFile(this);">
                                                                <span id="fExists" data-bind="text: DocFileName, attr: { title: $data.fExists }"></span></a>
                                                        </td>
                                                        <td style="text-align: left; width: 10%;"><span data-bind="text:ProductName"></span></td>
                                                        <td style="text-align: left; width: 10%;"><span data-bind="text:Description"></span></td>
                                                        <td style="text-align: left; width: 10%;"><span data-bind="text:Make"></span></td>
                                                        <td style="text-align: right; width: 10%;" class="Accountant"><span data-bind="text:LPrice"></span></td>
                                                        <td style="text-align: right; width: 10%;"><span data-bind="text:Qty"></span></td>
                                                        <td style="text-align: right; width: 10%;" class="Accountant"><span data-bind="text:Discount"></span></td>
                                                        <td style="text-align: right; width: 10%;"><span data-bind="text:TotalAmount"></span></td>
                                                        <td style="text-align: left; width: 10%;"><span data-bind="text:Hsn"></span></td>
                                                        <td style="text-align: left; width: 10%;"><span data-bind="text:GstNo"></span></td>
                                                        <td style="text-align: left; width: 10%;"><span data-bind="text:Address"></span></td>
                                                        <td style="text-align: left; width: 10%;"><span data-bind="text:Status"></span></td>
                                                        <td style="text-align: center; width: 10%;" class="Accountant">
                                                            <button type="button" name="data" class="btn  btn-success" onclick="DeleteDate(this)" style="width: 90px; height: auto; background: #FF7D7D; border: 1px solid #FF7D7D; margin-top: -3px; padding: 4px 11px;" data-bind="attr: { 'InvoiceId': InvoiceId,Disabled: btnDelete}"><i class="ti-trash" style="font-size: 16px;"></i>Delete</button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>
                                        <input type="hidden" id="roleId" value="0">
                                        <input type="hidden" id="RoleName" value="0">
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

    <!-- data-table js -->
    <script src="files/assets/pages/data-table/extensions/buttons/js/dataTables.buttons.min.js"></script>
    <script src="files/assets/pages/data-table/extensions/buttons/js/buttons.flash.min.js"></script>
    <script src="files/assets/pages/data-table/extensions/buttons/js/jszip.min.js"></script>
    <script src="files/assets/pages/data-table/extensions/buttons/js/vfs_fonts.js"></script>
    <script src="files/assets/pages/data-table/extensions/buttons/js/buttons.colVis.min.js"></script>
    <script src="files/bower_components/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="files/bower_components/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="files/bower_components/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>

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
    <!-- sweet alert js -->
    <script type="text/javascript" src="files/assets/js/sweetalert.js"></script>
    <script type="text/javascript" src="files/assets/js/modal.js"></script>

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

    <script type="text/javascript">
        var Invoiceobj = function () {
            var self = this;
            this.lstInObj = ko.observableArray([{
                InvoiceId: 0, SupplierName: '', InvoiceNo: '', InvoiceDate: '', poAmount: '', Podate: '', Grandtotal: '', DocFileName: '', createddate: '', Createdby: '', Status: '',
                InvNo: '', ProductName: '', Description: '', Make: '', LPrice: '', TotalAmount: '', Qty: '', Discount: '', Hsn: '', Address: '', GstNo: '', InvType: '', btnedit: false, btnDelete: false
            }]);
        };
        formDocument = ko.observable(new Invoiceobj());
        ko.applyBindings(new Invoiceobj());
    </script>
</asp:Content>

