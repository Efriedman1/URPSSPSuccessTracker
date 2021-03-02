<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminHomeDatatable.aspx.cs" Inherits="URPSSPSuccessTracker.AdminHomeDatatable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.6.5/css/buttons.dataTables.min.css"/>

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
        width:80%;
        table-layout:fixed;
        }
        th:last-child{
            color:white;
            pointer-events:none;
        }
    </style>

     <script>
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
                    "ajax": "data/arrays.txt",/*PI*/
                    "columnDefs": [ {
                    "targets": -1,
                    "data": null,
                    "defaultContent": "<a class='btn btn-outline-secondary' href='AdminSendEmail.aspx'>View</a>"
                } ]
            });

            $('#table2 tbody').on('click', 'tr', function () {
                $(this).toggleClass('selected');
            } ); 

            
        $('#table2 tbody').on( 'click', 'button', function () {
            var data = table.row( $(this).parents('tr') ).data();
            alert( data[0] +"'s salary is: "+ data[ 5 ] );
            });

        $('#table2 thead tr').clone(true).appendTo( '#table2 thead' );
        //$('#table2 thead tr:eq(1) th').each( function (i) {
        $('table2 thead tr:eq(1) th:not(:last-child)').each(function (i) {
            var title = $(this).text();
            $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
 
            $( 'input', this ).on( 'keyup change', function () {
                if ( table.column(i).search() !== this.value ) {
                    table
                        .column(i)
                        .search( this.value )
                        .draw();
                }
            } );
        } );
        });
        
        
        $(document).ready(function() {
            var table = $('#example').DataTable({
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
                    "ajax": "data/studentArrays.txt",/*students*/
                    "columnDefs": [ {
                    "targets": -1,
                    "data": null,
                    "defaultContent": "<a class='btn btn-outline-secondary' href='AdminSendEmail.aspx'>View</a>"
                } ]
            } );
 
        $('#example tbody').on( 'click', 'button', function () {
            var data = table.row( $(this).parents('tr') ).data();
            alert( data[0] +"'s salary is: "+ data[ 5 ] );
            });



        $('#example tbody').on( 'click', 'tr', function () {
            $(this).toggleClass('selected');
        } );
 
            

        $('#example thead tr').clone(true).appendTo( '#example thead' );
        $('#example thead tr:eq(1) th:not(:last-child)').each( function (i) {
            var title = $(this).text();
            $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
 
            $( 'input', this ).on( 'keyup change', function () {
                if ( table.column(i).search() !== this.value ) {
                    table
                        .column(i)
                        .search( this.value )
                        .draw();
                }
            } );
        } );
        });
        
    </script>

     <div class="d-flex justify-content-between">
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
            <asp:Button class="btn p-2" CssClass="btn redbtn" ID="btnPI" runat="server" Text="PI" OnClick="btnPI_Click"/>
            
            <asp:Panel ID="pnlStudents" runat="server">
                 <table id="example" class="display" style="width:100%">
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
                </table>
                </asp:Panel>
        </div>
        <div class="d-flex justify-content-between">
                <div>
                    <asp:Button class="btn" CssClass="btn redbtn" ID="btnEmail" runat="server" Text="Email All"  />
                    <asp:Button class="btn" CssClass="btn redbtn" ID="btnEmailChecked" runat="server" Text="Email Selected" />
                </div>
                <asp:Button class="btn" CssClass="btn redbtn" ID="btnExport" runat="server" Text="Export" />
            </div>
</asp:Content>
