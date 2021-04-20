<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="StudentHomeDatatable.aspx.cs" Inherits="URPSSPSuccessTracker.StudentHomeDatatable" %>

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

        thead tr:first-child {
            background-color: #91182A;
            color:white;
        }


		/*body {
			padding: 1%;
		}*/
	</style>

    <script>
        $(document).ready(function () {
            var table = $("[id*=gvStudent]").DataTable({
                responsive: true,
                dom: 'Bfrtip',
                select: true
            });

            //Search Functionality
            $('[id*=gvStudent] thead tr').clone(true).appendTo('[id*=gvStudent] thead');
            $('[id*=gvStudent] thead tr:eq(1) th:not(:last-child)').each(function (i) {
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
    </script>

    <div class="flex-container m-5">
        <div class="row mt-3">
            <div class="col-md-2 md-offset-">
                <h2>Student Dashboard</h2>
            </div>
            <div class="col-md-2 mt-2">
                <asp:Label ID="Label8" runat="server" Text="TUID:  " Style="font-size: 20px;"></asp:Label>
                <asp:Label ID="Label9" runat="server" Text="123456789" Style="font-size: 20px;"></asp:Label>
            </div>

            <div class="col-md-3 mt-2">
                <asp:Label ID="Label3" runat="server" Text="Email:  " Style="font-size: 20px;"></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="John.Doe@temple.edu" Style="font-size: 20px;"></asp:Label>
            </div>
            <div class="col-md-2"></div>
            <button type="button" class="btn btn-primary p-2 mr-3 ml-3 mt-4" data-toggle="modal" data-target="#resultModal">Instructions</button>
        </div>
    <div class="row text-center mt-3">
        <div class="col-md-2"></div>
    </div>
    <div class="row text-center mt-3">
        <div class="col-md-2"></div>
        <div class="col-md-2 md-offset-">
            <div class="d-flex justify-content-center mt-2">
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
                            Here are the terms you have participated in for the URP/SSP Programs. Please select a term to view your research or make any changes.
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
		<asp:GridView ID="gvStudent" runat="server" OnRowDataBound="gvStudents_RowDataBound" AutoGenerateColumns="False" ClientIDMode="Static" OnRowCommand="gvStudent_RowCommand">
			<Columns>
				<asp:BoundField DataField="PrincipalInvestigator" />
				<asp:BoundField DataField="Title" />
				<asp:BoundField DataField="Term" />
				<asp:BoundField DataField="LastUpdate" />
				<asp:BoundField DataField="ResearchID" />
				<asp:ButtonField ButtonType="Button" CommandName="View" Text="View" />
			</Columns>
		</asp:GridView>		
	</div>
</asp:Content>
