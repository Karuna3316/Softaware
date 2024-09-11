<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="Stock.aspx.cs" Inherits="Stock" %>

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

    <script type="text/javascript">
        $(document).ready(function () {

            BindStock();
            document.getElementById("downloadButton").addEventListener("click", function () {
                var table = $('#basic-btn').DataTable();
                var tableData = table.rows().data().toArray();
                var headings = table.columns().header().toArray().map(function (cell) {
                    return $(cell).text();
                });

                // Identify columns to exclude by class
                var excludedColumns = $(".exclude-column");

                // Get the indexes of excluded columns
                var excludedIndexes = excludedColumns.map(function () {
                    return table.column($(this).index()).index();
                }).toArray();

                // Modify each row to exclude the specified columns
                for (var i = 0; i < tableData.length; i++) {
                    tableData[i] = tableData[i].filter(function (cell, index) {
                        return excludedIndexes.indexOf(index) === -1;
                    }).map(function (cell) {
                        return $(cell).text();
                    });
                }

                headings = headings.filter(function (heading, index) {
                    return excludedIndexes.indexOf(index) === -1;
                });

                // Insert headings as the first row
                tableData.unshift(headings);

                var wb = XLSX.utils.book_new();
                var ws = XLSX.utils.aoa_to_sheet(tableData);
                XLSX.utils.book_append_sheet(wb, ws, "TableData");
                XLSX.writeFile(wb, "Stock.xlsx");
            });

        });


        function BindStock() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Stock.aspx/GetstockList",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    formDocument().lststocksObj().constructor();
                    if ($.fn.dataTable.isDataTable('#basic-btn')) {
                        $('#basic-btn').DataTable().clear().destroy();
                    }
                    ko.mapping.fromJS(data.d, null, formDocument);
                    $('#basic-btn').DataTable({
                        "paging": true,
                        "ordering": false,
                        responsive: true,

                    });
                },

                error: function (response) {
                    alert(response.responseText);
                },
                failure: function (response) {
                    alert(response.responseText);
                }
            });

        }


    </script>
    <style>
        div.dataTables_wrapper div.dataTables_filter input {
            margin-left: 0.5em;
            border: 1px solid #0AC282;
            display: inline-block;
            width: 170px;
            margin-top: 10px;
        }

        th {
            background: #009933 !important;
            color: #ffffff;
            text-align: center !important;
            font-size: 15px !important;
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
                                                <h1 style="padding: 5px 0px 5px 10px;">Stock</h1>
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
                                        <div class="access" style="padding-left: 10px; padding-bottom: 10px;">

                                            <button type="button" class="btn btn-success f-w-100" id="downloadButton" style="background-color: #34A0A4; color: #ffffff; border: 1px solid#34A0A4; padding: 4px 11px; border-radius: 2px; margin-top: 10px;">Download</button>

                                        </div>
                                        <div class="button" style="float: right;">
                                        </div>
                                        <div class="dt-responsive table-responsive" style="padding-left: 10px; padding-bottom: 10px;" data-bind="with: formDocument">
                                            <table id="basic-btn" class="table table-striped table-bordered nowrap" style="width: 100%;">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 25%;">Product Name</th>
                                                        <th style="width: 25%;">Quantity</th>
                                                        <th style="width: 25%;">Net Price</th>
                                                        <th style="width: 25%;">HSN No</th>
                                                        <th style="width: 25%;">Description</th>
                                                    </tr>
                                                </thead>
                                                <tbody data-bind="foreach: formDocument().lststocksObj()" style="width: 100%;">
                                                    <tr>
                                                        <td style="width: 25%;"><span data-bind="text:productname"></span></td>
                                                        <td style="width: 25%; text-align: right;"><span data-bind="text:test"></span></td>
                                                        <td style="width: 25%; text-align: right;"><span data-bind="text:LPrice"></span></td>
                                                        <td style="width: 25%;"><span data-bind="text:HsnNo"></span></td>
                                                        <td style="width: 25%;"><span data-bind="text:Description"></span></td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>
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
    <script src="js/download.js"></script>


    <script type="text/javascript">
        var stocksobj = function () {
            var self = this;
            this.lststocksObj = ko.observableArray([{
                ProductsId: 0, test: '', productname: '', HsnNo: '', LPrice: '', Description: ''
            }]);
        };
        formDocument = ko.observable(new stocksobj());
        ko.applyBindings(new stocksobj());
    </script>
</asp:Content>

