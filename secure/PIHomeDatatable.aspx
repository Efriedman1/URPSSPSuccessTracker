<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PIHomeDatatable.aspx.cs" Inherits="URPSSPSuccessTracker.secure.PIHomeDatatable" %>
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

        th:last-child {

          color: white;

          pointer-events:none;

        }

    </style>



    <script>

        $(document).ready(function() {

            var table = $('#example').DataTable({

                /*dom: 'Bfrtip',

                buttons: [

                    'selected',

                    'selectedSingle',

                    'selectAll',

                    'selectNone',

                    'selectRows',

                    'selectColumns',

                    'selectCells'

                ],

                select: true,*/

                "ajax": "arrays.txt",

                "columnDefs": [ {

                    "targets": -1,

                    "data": null,

                    "defaultContent": "<a class='btn btn-outline-secondary' href='PIViewStudentResearch.aspx'>View</a>"

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


            

        //$('#example thead tr:eq(1) th').each( function (i) {

            $('#table2 thead tr:eq(1) th:not(:last-child)').each( function (i) {

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

         <div class="flex-container m-5">

        <div class="row mt-3">

            <div class="col-md-2 md-offset-">

                <h2>PI Dashboard</h2>

            </div>

            <div class="col-md-2 mt-2">

                <asp:Label ID="Label8" runat="server" Text="TUID:  " Style="font-size: 20px;"></asp:Label>

                <asp:Label ID="Label9" runat="server" Text="918467732" Style="font-size: 20px;"></asp:Label>

            </div>

            <div class="col-md-3 mt-2">

                <asp:Label ID="Label3" runat="server" Text="Email:  " Style="font-size: 20px;"></asp:Label>

                <asp:Label ID="Label4" runat="server" Text="BPerkins@temple.edu" Style="font-size: 20px;"></asp:Label>

            </div>

            <div class="col-md-2"></div>

        </div>

        <div class="row text-center mt-3">

            <!--

            <div class="col-md-4 justify-content-center">

                <img src="images/ProfilePic.jpg" class="rounded-circle center-block border border-secondary" style="width: 125px; height: 125px; border-radius: 5px;" /><br />

                <p class="text-center mt-3">

                    <asp:Label ID="Label1" runat="server" Text="Bill Perkins" Style="font-size: 30px;"></asp:Label>

                </p>

            </div>

            -->

            <div class="col-md-2"></div>

        </div>

        <div class="row text-center mt-3">

                        <div class="col-md-2"></div>

            <div class="col-md-2 md-offset-">

                <div class="row">

                    <label>Term: </label>

                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">

                        <asp:ListItem Selected="True">FALL 2020</asp:ListItem>

                        <asp:ListItem>SPRING 2020</asp:ListItem>

                        <asp:ListItem>FALL 2019</asp:ListItem>

                        <asp:ListItem>SPRING 2019</asp:ListItem>

                        <asp:ListItem>FALL 2018</asp:ListItem>

                        <asp:ListItem>SPRING 2018</asp:ListItem>

                    </asp:DropDownList>

                </div>

            </div>

            <div class="col-md-2 md-offset-">

                <div class="d-flex justify-content-center mt-2">

                    <button type="button" class="btn redbtn p-2 mr-3 ml-3 mt-4" data-toggle="modal" data-target="#resultModal">Instructions</button>

                </div>

                <div class="modal fade" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

                    <div class="modal-dialog" role="document">

                        <div class="modal-content">

                            <div class="modal-header">

                                <h5 class="modal-title" id="exampleModalLabel">Student Upload Results</h5>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                                    <span aria-hidden="true">&times;</span>

                                </button>

                            </div>

                            <div class="modal-body">

                                You are a Principal Investigator, manage and access your students research success below.

                            </div>

                            <div class="modal-footer">

                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

        <div>

            <asp:Panel ID="pnlStudents" runat="server">

                <table id="example" class="display" style="width:100%">

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

        <div class="d-flex justify-content-between"">

                <div>

                    <asp:Button class="btn" CssClass="btn redbtn" ID="btnEmail" runat="server" Text="Email All"  />

                    <asp:Button class="btn" CssClass="btn redbtn" ID="btnEmailChecked" runat="server" Text="Email Selected" />

                </div>

                <asp:Button class="btn" CssClass="btn redbtn" ID="btnExport" runat="server" Text="Export" />

            </div>

</asp:Content>
