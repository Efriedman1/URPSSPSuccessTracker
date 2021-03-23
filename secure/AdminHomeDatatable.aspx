﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminHomeDatatable.aspx.cs" Inherits="URPSSPSuccessTracker.AdminHomeDatatable" %>

<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.6.5/css/buttons.dataTables.min.css" />

    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.5/js/dataTables.buttons.min.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <!--Select multiple at once-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://hr.oop.cmu.ac.th/data/appointment/js/DataTable/media/js/jquery.dataTables.js"></script>



    <style>
        div.dataTables_wrapper {
            margin-bottom: 3em;
        }

        table {
            width: 80%;
            table-layout: fixed;
        }

        th:last-child {
            color: white;
            pointer-events: none;
        }

        thead input {
            width: 100%;
            padding: 3px;
            box-sizing: border-box;
        }

        body {
            padding: 1%;
        }
    </style>


    <script type="text/javascript">
        /*$(document).ready(function() {
            $('table.display').DataTable();
        });
        */
        $(document).ready(function () {
            var table = $('#table2').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'selected',
                    'selectedSingle',
                    'selectAll',
                    'selectNone',
                    'selectRows',
                    'selectColumns',
                    'selectCells'
                ],
                select: true,
                "ajax": "arrays.txt",/*PI*/
                "columnDefs": [{
                    "targets": -1,
                    "data": null,
                    "defaultContent": "<a class='btn btn-outline-secondary' href='PIViewStudentResearch.aspx'>View</a>"
                }]
            });

            $('#table2 tbody').on('click', 'tr', function () {
                $(this).toggleClass('selected');
            });


            /* backend */
            /* $('#table2 tbody').on('click', 'button', function () {
                 var data = table.row($(this).parents('tr')).data();
                 alert(data[0] + "'s salary is: " + data[5]);
             });
 
             $('#table2 thead tr').clone(true).appendTo('#table2 thead');
             //$('#table2 thead tr:eq(1) th').each( function (i) {
             $('table2 thead tr:eq(1) th:not(:last-child)').each(function (i) {
                 var title = $(this).text();
                 $(this).html('<input type="text" placeholder="Search ' + title + '" />');
 
                 $('input', this).on('keyup change', function () {
                     if (table.column(i).search() !== this.value) {
                         table
                             .column(i)
                             .search(this.value)
                             .draw();
                     }
                 });
             }); */
            /* backend */

            /* $('#table2 tbody').on( 'click', 'button', function () {
                 var data = table.row( $(this).parents('tr') ).data();
                 alert( data[0] +"'s salary is: "+ data[ 5 ] );
                 });*/

            $('#table2 thead tr').clone(true).appendTo('#table2 thead');
            $('#table2 thead tr:eq(1) th:not(:last-child)').each(function (i) {
                var title = $(this).text();
                $(this).html('<input type="text" placeholder="Search ' + title + '" />');

                $('input', this).on('keyup change', function () {
                    if (table.column(i).search() !== this.value) {
                        table
                            .column(i)
                            .search(this.value)
                            .draw();
                    }
                });
            });
        });

        var selectedTuids = [];

        $(document).ready(function () {
            var table = $("[id*=gvStudents]").DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'selected',
                    'selectedSingle',
                    'selectAll',
                    'selectNone',
                    'selectRows',
                    'selectColumns',
                    'selectCells'
                ],
                select: true,
                //"ajax": "studentArrays.txt",/*students*/
                "columnDefs": [{
                    "targets": -1,
                    "data": null,
                    "defaultContent": "<a class='btn btn-outline-secondary' href='PIViewStudentResearch.aspx'>View</a>"
                }]
            });

            $('[id*=gvStudents] tbody').on('click', 'button', function () {
                var data = table.row($(this).parents('tr')).data();
                alert(data[0] + "'s salary is: " + data[5]);
            });

            $('[id*=gvStudents] tbody').on('click', 'tr', function () {
                $(this).toggleClass('selected');
                var data = table.row(this).data();
                var count = selectedTuids.length;
                var addFlag = true; //flag to check if we are adding or removing TUID
                for (var i = 0; i < count; i++) {
                    if (selectedTuids[i] == data[0]) {  //if TUID is already in array, aka if user is clicking an already selected user (deselecting), remove from array
                        selectedTuids.splice(i, 1);
                        addFlag = false;    //set flag to false to skip adding the TUID
                    }
                }
                if (addFlag) {  //if we are still adding, add the TUID
                    selectedTuids.push(data[0]);
                }
                //alert(selectedTuids);


            });

            $('[id*=gvStudents] thead tr').clone(true).appendTo('[id*=gvStudents] thead');
            $('[id*=gvStudents] thead tr:eq(1) th:not(:last-child)').each(function (i) {
                var title = $(this).text();
                $(this).html('<input type="text" placeholder="Search ' + title + '" />');

                $('input', this).on('keyup change', function () {
                    if (table.column(i).search() !== this.value) {
                        table
                            .column(i)
                            .search(this.value)
                            .draw();
                    }
                });
            });
        });

        function SelectedEmailClick() {
            //$.ajax({
            //    contentType: 'application/json; charset=utf-8',
            //    type: "POST",
            //    dataType: 'json',
            //    url: "AdminHomeDatatable.aspx/Selected",
            //    data: JSON.stringify({ selected: selectedTuids }),
            //    success: function () {
            //        alert("success");
            //    },
            //    error: function (response) {
            //        alert(response);
            //    }
            //});

            var query = "AdminSendEmail.aspx?";
            for (var i = 0; i < selectedTuids.length; i++)
            {
                query += "id" + i + "=" + selectedTuids[i];
                if (i != selectedTuids.length - 1)
                    query += "&";
            }
            window.location = query;
            return false;
        }
    </script>

<!-- <<<<<<< Eric -->

         <div class="d-flex justify-content-between"  style="margin-top: 2%">
              <div>
                  <h2>Search Research Information</h2>
              </div>
            
              <!-- Button trigger modal -->
            <button type="button" class="button infobtn"  data-toggle="modal" data-target="#instructionsModal">Instructions</button>       
         </div>
       <%--<div class="col-xs-12 mb-4" contenteditable="true">
                <fieldset class="border p-2 rounded">
                    <legend class="w-auto">Instructions</legend>
                    You may search by any combination of first name, last name, major, student term, TUID,
                    and status. Select no parameters to view all profiles. Select the 'Student' or 'Principal Investigator' button to view Student or Principal Investigator profiles.
                    Below the search results table, you will find several buttons. Use "Export" to export these students to a spreadsheet,
                    Use "Email Selected" to email the students you selected on the table using the checkboxes. Use "Email All" to send an
                    Email to all students in the table.
                </fieldset>               
            </div> --%>
        <div>

           

<!-- Modal -->
<div class="modal fade" id="instructionsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="instructionsModalLabel">Instructions</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        You may search by any combination of first name, last name, major, student term, TUID,
        and status. Select no parameters to view all profiles. Select the 'Student' or 'Principal Investigator' button to view Student or Principal Investigator profiles.
        Below the search results table, you will find several buttons. Use "Export" to export these students to a spreadsheet,
        Use "Email Selected" to email the students you selected on the table using the checkboxes. Use "Email All" to send an
        Email to all students in the table.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

            <asp:Button class="btn p-2" CssClass="button redbtn" ID="btnStudent" runat="server" Text="Student" OnClick="btnStudent_Click" />
            <asp:Button class="btn p-2" CssClass="button redbtn" ID="btnPI" runat="server" Text="Principal Investigator" OnClick="btnPI_Click"/>
            
            <asp:Panel ID="pnlStudents" runat="server">
              <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="true" OnRowDataBound="example_RowDataBound"></asp:GridView>
<!--                  <table id="example" class="display" style="width:100%">
        <thead> 
            <tr>
                <th>TUID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Major</th>
                <th>Type</th>
                <th>Principal Investigator</th>
                <th>Status</th>
                <th>View</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>TUID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Major</th>
                <th>Type</th>
                <th>Principal Investigator</th>
                <th>Status</th>
                <th>View</th>
            </tr>
        </tfoot>
    </table>
            </asp:Panel>
            <asp:Panel ID="pnlPI" runat="server">
                <table id="table2" class="display" style="width:100%">
                    <thead>
                        <tr>
                            <th>TUID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Department</th>
                            <th>View</th>
                        </tr>
                    </thead>
                  
                    <tfoot>
                        <tr>
                            <th>TUID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Department</th>
                            <th>View</th>
                        </tr>
                    </tfoot>
                </table> -->
                </asp:Panel>
        </div>
        <div class="d-flex justify-content-between">
                <div>
                    <asp:Button class="btn" CssClass="button redbtn" ID="btnEmail" OnClick="btnEmail_Click" runat="server" Text="Email All"  />
                    <asp:Button class="btn" CssClass="button redbtn" ID="btnEmailChecked" OnClick="btnEmailChecked_Click" runat="server" Text="Email Selected" />
                </div>
                <asp:Button class="btn" CssClass="button redbtn" ID="btnExport" runat="server" Text="Export" />
            </div>
<!-- ======= -->
<!--     <div class="d-flex justify-content-between">
        <h2>Search Research Information</h2>
    </div>
    <div class="col-6 mb-4" contenteditable="true">
        <fieldset class="border p-2 rounded">
            <legend class="w-auto">Instructions</legend>
            You may search by any combination of first name, last name, major, student term, TUID,
                    and status. Select no parameters to view all profiles. Select the Student or PI button to view Student or PI profiles.
                    Below the search results table, you will find several buttons. Use "Export" to export these students to a spreadsheet,
                    Use "Email Selected" to email the students you selected on the table using the checkboxes. Use "Email All" to send an
                    Email to all students in the table.
        </fieldset>

    </div>
    <div>

        <asp:Button class="btn p-2" CssClass="btn redbtn" ID="btnStudent" runat="server" Text="Student" OnClick="btnStudent_Click" />
        <asp:Button class="btn p-2" CssClass="btn redbtn" ID="btnPI" runat="server" Text="PI" OnClick="btnPI_Click" />

        <asp:Panel ID="pnlStudents" runat="server">

            <%--<table id="example" class="display" style="width: 100%">
                <thead>
                    <tr>
                        <th>TUID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Major</th>
                        <th>Type</th>
                        <th>Principal Investigator</th>
                        <th>Status</th>
                        <th>View</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>TUID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Major</th>
                        <th>Type</th>
                        <th>Principal Investigator</th>
                        <th>Status</th>
                        <th>View</th>
                    </tr>
                </tfoot>
            </table>--%>
<!--         </asp:Panel>
        <asp:Panel ID="pnlPI" runat="server">
            <table id="table2" class="display" style="width: 100%">
                <thead>
                    <tr>
                        <th>TUID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Department</th>
                        <th>View</th>
                    </tr>
                </thead>

                <tfoot>
                    <tr>
                        <th>TUID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Department</th>
                        <th>View</th>
                    </tr>
                </tfoot>
            </table>
        </asp:Panel>
    </div>
    <div class="d-flex justify-content-between">
        <div>
            <asp:Button class="btn" CssClass="btn redbtn" ID="btnEmail" OnClick="btnEmail_Click" runat="server" Text="Email All" />
            <asp:Button class="btn" CssClass="btn redbtn" ID="btnEmailChecked" OnClientClick="return SelectedEmailClick()" runat="server" Text="Email Selected" />
        </div>
        <asp:Button class="btn" CssClass="btn redbtn" ID="btnExport" runat="server" Text="Export" />
    </div> -->
<!-- >>>>>>> main -->
</asp:Content>
