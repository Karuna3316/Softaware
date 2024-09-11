<%@ Page Title="" Language="C#" MasterPageFile="~/FDSS.master" AutoEventWireup="true" CodeFile="Products_Bulk.aspx.cs" Inherits="Products_Bulk" %>

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

    <!-- Icon Links Start -->
    <link rel="stylesheet" type="text/css" href="files/assets/icon/simple-line-icons/css/simple-line-icons.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/material-design/css/material-design-iconic-font.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/feather/css/feather.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/themify-icons/themify-icons.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/ion-icon/css/ionicons.min.css" />
    <link rel="stylesheet" type="text/css" href="files/assets/icon/icofont/css/icofont.css" />
    <!-- jQuery library -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- XLSX library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>

    <script src="js/knockout-3.3.0.js" type="text/javascript"></script>
    <script src="js/knockout.mapping-latest.js" type="text/javascript"></script>

    <script src="js/knockout.validation.js" type="text/javascript"></script>
    <style>
        /* CSS styles for odd rows */
        .odd {
            background-color: #F2F2F2;
        }

        /* CSS styles for even rows */
        .even {
            background-color: #FFFFFF;
        }

        /* CSS styles for table header */
        #dataTable thead th {
            background-color: #009933;
            font-weight: bold;
            color: #fff;
            text-align: center;
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

        .container-fluid, .container-lg, .container-md, .container-sm, .container-xl {
            width: auto;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
            background: #f5f3f4;
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
                                                <h1 style="padding:5px 0px 5px 10px;">Product Bulk</h1>
                                            </div>
                                            <div class="col-sm-6">
                                                <%--<div class="button" style="float:right;">
                                                    <input type="button" class="btn btn-info" value="Add"/>
                                                </div>--%>
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
                                            <div class="col-sm-3 col-form-label">File Upload</div>
                                            <div class="col-sm-7">
                                                <input type="file" id="excelFileInput" class="form-control" style="padding: 7px;" /><br />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-12">
                                                <center>
                                                        <button onclick="uploadExcel(event)" class="btn btn-success f-w-100" style="width:70px;">View</button>
                                                        <button onclick="saveButtonClicked()" class="btn btn-success f-w-100" style="width:70px;">Save</button>
                                                        <button onclick="clearPage()" class="btn btn-success f-w-100" style="width:70px;">Clear</button>

                                                    </center>
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
                                <div class="card" id="dataTables">
                                    <div class="card-block" style="padding: 20px;">
                                        <div class="dt-responsive table-responsive" style="padding-bottom: 10px;">
                                            <table id="dataTable" class="table table-striped table-bordered nowrap" style="background-color: #fff; width: 100%;"></table>
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

    <script type="text/javascript">
        $(document).ready(function () {
            $("#dataTables").hide();
        });
        var jsonDataToSend; // Define a variable to store the jsonDataToSend

        function saveButtonClicked() {
            // Get the data and pass it to the saveToDatabase function
            saveToDatabase(jsonDataToSend);
        }

        function uploadExcel(event) {
            debugger;
            $("#dataTables").show();
            event.preventDefault(); // Prevent form submission

            var fileInput = document.getElementById('excelFileInput');
            var file = fileInput.files[0];

            var reader = new FileReader();
            reader.onload = function (e) {
                var data = new Uint8Array(e.target.result);
                var workbook = XLSX.read(data, { type: 'array' });
                var worksheet = workbook.Sheets[workbook.SheetNames[0]];

                // Convert worksheet data to JSON with formatting options
                var jsonData = XLSX.utils.sheet_to_json(worksheet, {
                    header: 1, // Treat the first row as header
                    raw: false, // Convert formatted cell values instead of raw cell values
                    defval: '', // Replace empty cells with an empty string
                    blankrows: false // Exclude blank rows from the result
                });

                displayData(jsonData);
                // Prepare the DeviceMappingBulk array to store the extracted data
                var DeviceMappingBulkArray = [];

                // Extract the date and description values from the jsonData array (starting from index 1 to omit header)
                for (var i = 1; i < jsonData.length; i++) {
                    var rowData = jsonData[i];
                    var Make = rowData[0];
                    var Supplier = rowData[1];
                    var Product = rowData[2];
                    var Size = rowData[3];
                    var HSN = rowData[4];
                    var Qty = rowData[5];
                    var LPrice = rowData[6];

                    // Create a DeviceMappingBulk object and add it to the array
                    var DeviceMappingBulk = {
                        Make: Make,
                        Supplier: Supplier,
                        Product: Product,
                        Size: Size,
                        HSN: HSN,
                        Qty: Qty,
                        LPrice: LPrice,
                    };

                    DeviceMappingBulkArray.push(DeviceMappingBulk);
                }

                // Convert the DeviceMappingBulkArray to JSON
                jsonDataToSend = JSON.stringify(DeviceMappingBulkArray);
            };
            reader.readAsArrayBuffer(file);
        }


        // Function to save data to the database (server-side)
        function saveToDatabase(jsonData) {
            debugger;
            $.ajax({
                url: 'Products_Bulk.aspx/SaveData',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ jsonData: jsonData }),

                success: function (response) {
                    // Handle the response from the server
                    alert('Saved successfully');
                    return;
                },
                error: function (error) {
                    // Handle any errors that occur during the request
                    alert('Failed to upload into Database');
                }
            });
        }

        // Function to display data in a table
        function displayData(data) {
            var table = document.getElementById('dataTable');
            table.innerHTML = '';

            // Create the table header
            var thead = document.createElement('thead');
            var headerRow = document.createElement('tr');
            var headerData = data[0];

            headerData.forEach(function (cellData) {
                var th = document.createElement('th');
                th.textContent = cellData;
                headerRow.appendChild(th);
            });

            thead.appendChild(headerRow);
            table.appendChild(thead);

            // Create the table body
            var tbody = document.createElement('tbody');
            var rowData = data.slice(1); // Exclude the header row

            rowData.forEach(function (row, index) {
                var tr = document.createElement('tr');

                if (index % 2 === 0) {
                    tr.classList.add('even'); // Add "even" class to even rows
                } else {
                    tr.classList.add('odd'); // Add "odd" class to odd rows
                }

                row.forEach(function (cellData) {
                    var td = document.createElement('td');

                    // Check for empty or null values
                    if (cellData !== null && cellData !== "") {
                        td.textContent = cellData;
                    } else {
                        td.innerHTML = "&nbsp;"; // Display empty cell as non-breaking space
                    }

                    tr.appendChild(td);
                });

                tbody.appendChild(tr);
            });

            table.appendChild(tbody);



        }

        function clearPage() {
            // Reload the page
            location.reload();
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
    <script src="files/assets/pages/data-table/js/jszip.min.js"></script>
    <script src="files/assets/pages/data-table/js/pdfmake.min.js"></script>
    <script src="files/assets/pages/data-table/js/vfs_fonts.js"></script>
    <script src="files/bower_components/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="files/assets/pages/data-table/js/dataTables.bootstrap4.min.js"></script>
</asp:Content>
