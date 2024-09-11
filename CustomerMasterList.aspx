﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="CustomerMasterList.aspx.cs" Inherits="CustomerMasterList" %>

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

    <style type="text/css">
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
                                                <h1 style="padding:5px 0px 5px 10px;">Customer</h1>
                                            </div>
                                            <div class="col-sm-6">
                                           
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="page-body" >
                        <div class="row" >

                            <div class="col-sm-12">
                                <div class="card" style="width: 100%; height: auto;">

                                    <div class="card-block" style="padding-left: 10px; padding-right: 10px;">
                                            <div class="access" style="margin-bottom:-30px;padding-left:10px;">

                                                <button type="button" class="btn btn-success f-w-100" id="downloadButton" style="background-color: #34A0A4; color: #ffffff; border: 1px solid#34A0A4; padding: 4px 11px; border-radius: 2px; margin-top: 10px;">Download</button>
                                                
                                            </div>
                                        <div class="button" style="float:right;">
                                            
                                                    <input type="button" class="btn btn-info" value="Add" onclick="newReq()" />
                                                </div>
                                        
                                        <div class="dt-responsive table-responsive" style="padding-left: 10px; padding-bottom: 10px;" data-bind="with: formDocument">
                                            <table id="basic-btn" class="table table-striped table-bordered nowrap" data-bind="hidden: formDocument().lstCMObj().length > 0" style="width: 100%;">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10%;">Sales Response</th>
                                                        <th style="width: 10%;">Industry Type</th>
                                                        <th style="width: 15%;">Company Name</th>
                                                        <th style="width: 10%;">GST NO</th>
                                                        <th style="width: 15%;">Address</th>
                                                        <th style="width: 10%;">Updated By</th>
                                                        <th style="width: 10%;">Updated Date</th>
                                                        <th style="width: 10%;">Action</th>


                                                    </tr>
                                                </thead>
                                                <tbody data-bind="foreach: lstCMObj" style="width: 100%;">
                                                    <tr>
                                                        <td style="width: 10%;"><span data-bind="text:SalesResponse"></span></td>
                                                        <td style="width: 10%;"><span data-bind="text:IndusTypeId"></span></td>
                                                        <td style="width: 15%;"><span data-bind="text:CompanyName"></span></td>
                                                        <td style="width: 10%;"><span data-bind="text:GstNo"></span></td>
                                                        <td style="width: 15%;"><span data-bind="text:Address"></span></td>
                                                        <td style="width: 10%;"><span data-bind="text:CreatedBy"></span></td>
                                                        <td style="width: 10%; text-align: center;"><span data-bind="text:UpdatedDate"></span></td>
                                                        <td style="text-align: center; width: 10%;">

                                                            <button type="button" name="data" class="btn  btn-success" onclick="EditDate(this)" style="width: 90px; height: auto; background: #009933; margin-top: -3px; padding: 4px 11px;" data-bind="attr: { 'CID': CID}"><i class="ti-pencil" style="font-size:16px !important;"></i>Edit</button>
                                                            <button type="button" name="data" class="btn  btn-success" onclick="DeleteDate(this)" style="width: 90px; height: auto; background: #FF7D7D; border: 1px solid #FF7D7D; margin-top: -3px; padding: 4px 11px;" data-bind="attr: { 'CID': CID}"><i class="ti-trash" style="font-size:16px !important;"></i>Delete</button>




                                                        </td>

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

            BindCustomerM();
            document.getElementById("downloadButton").addEventListener("click", function () {
                // Access the DataTable instance
                var table = $('#basic-btn').DataTable();

                // Get all the data from DataTables
                var tableData = table.rows().data().toArray();

                // Get table headings
                var headings = table.columns().header().toArray().map(function (cell) {
                    return $(cell).text(); // Use jQuery to extract text content
                });

                // Exclude the last column heading
                headings.pop();

                // Modify each row to exclude the last cell and get text content only
                for (var i = 0; i < tableData.length; i++) {
                    tableData[i] = tableData[i].slice(0, -1).map(function (cell) {
                        return $(cell).text(); // Use jQuery to extract text content
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
                XLSX.writeFile(wb, "Customer.xlsx");
            });

        });

        function newReq() {
            location.href = "CustomerMaster.aspx";
        }



        function BindCustomerM() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "CustomerMasterList.aspx/getcustomermaster",
                dataType: "json",
                success: function (data) {
                    formDocument().lstCMObj().constructor();
                    if ($.fn.dataTable.isDataTable('#basic-btn')) {
                        $('#basic-btn').DataTable().clear().destroy();
                    }
                    ko.mapping.fromJS(data.d, null, formDocument);

                    $('#basic-btn').DataTable({
                        "ordering": false,
                        "paging": true,
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



        function EditDate(itemI) {
            location.href = "CustomerMaster.aspx?CID=" + itemI.getAttribute('CID');

        }

        function DeleteDate(itemI) {
            var iInd = itemI.getAttribute('CID');

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
                            url: "CustomerMasterList.aspx/deleteCusMaster",
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
                                        BindCustomerM();
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
        <script src="js/download.js"></script>


    <!-- sweet alert js -->
    <script type="text/javascript" src="files/assets/js/sweetalert.js"></script>
    <script type="text/javascript" src="files/assets/js/modal.js"></script>
    <!-- sweet alert modal.js intialize js -->

    <!-- modalEffects js nifty modal window effects -->
    <script type="text/javascript" src="files/assets/js/modalEffects.js"></script>
    <script type="text/javascript" src="files/assets/js/classie.js"></script>

    <script type="text/javascript">
        var CustomerMobj = function () {
            var self = this;

            this.lstCMObj = ko.observableArray([{
                CID: 0, SalesResponse: '',IndusTypeId: '', CompanyName: '', CPName: '', GstNo: '', CPNumber: '', Address: '', Updatedby: '', UpdatedDate: '', CreatedBy: ''
            }]);
        };
        formDocument = ko.observable(new CustomerMobj());
        ko.applyBindings(new CustomerMobj());
    </script>
</asp:Content>

