<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminManageUsers.aspx.cs" Inherits="URPSSPSuccessTracker.AdminManageUsers" %>

<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 2%">



        <%--    ~~Border Style~~--%>
        <style>
            fieldset.scheduler-border {
                border: 1px groove #ddd !important;
                border-radius: 5px;
                padding: 0 1.4em 1.4em 1.4em !important;
                margin: 0 0 1.5em 0 !important;
                -webkit-box-shadow: 0px 0px 0px 0px #000;
                box-shadow: 0px 0px 0px 0px #000;
            }

            legend.scheduler-border {
                font-size: 1.2em !important;
                font-weight: bold !important;
                text-align: left !important;
                width: auto;
                padding: 0 10px;
                border-bottom: none;
            }
        </style>


        <div class="page-header">
            <h2>Admin Management</h2>
        </div>

        <div class="row">
            <div class="col-sm-12 col-sm-12 col-md-6 col-lg-6">
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Instructions</legend>
                    You may search by entering the person's TUID. You may 
                          then grant system permissions to the user.
                </fieldset>
            </div>
        </div>
    </div>
    <div class="container">
        <h3 class="mt-3">Manage Admin Users</h3>
        <div>
            <div class="col-sm-10 col-sm-10" style="margin-top: 3px">
                <asp:Label ID="Label1" runat="server" CssClass="col-form-label">TUID</asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control mb-2 col-4" placeholder="9 Digit TUID" BackColor="#FAFAFA"></asp:TextBox>
            </div>
            <div class="col-sm-12 col-sm-12">
                <asp:Button ID="AddAdminModal" runat="server" Text="Add New Admin" CssClass="btn redbtn" data-toggle="modal" data-target="#modal1" OnClientClick="return false" />

                <div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Is this the person?</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <b>TUID:</b> 956324895
                                    <br />
                                <b>First Name:</b> Cody
                                    <br />
                                <b>Last Name:</b> Guevara
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <button type="button" class="btn redbtn" data-dismiss="modal">Confirm and Add</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row ml-5 mr-5">
            <div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
                <div class="col-12 col-sm-12 col-lg-12 col-lg-12" style="margin-top: 2%;">
                    <asp:Table ID="tblAdministrators" runat="server" CssClass="table table-striped">

                        <asp:TableHeaderRow Style="background-color: #91182A; color: white;">
                            <asp:TableHeaderCell Scope="Column">
                                    TUID
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                    First Name
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                    Last Name
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                    Active
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                    Actions
                            </asp:TableHeaderCell>
                        </asp:TableHeaderRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                    956324895
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                    Cody
                            </asp:TableCell>
                            <asp:TableCell>
                                    Guevara
                            </asp:TableCell>
                            <asp:TableCell ForeColor="Green">
                                    Yes
                            </asp:TableCell>
                            <asp:TableCell>
                                    <div class="dropdown">
                                      <button class="btn dropdown-toggle redbtn" type="button" id="ddlAction1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Action
                                      </button>
                                      <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">                   
                                        <a class="dropdown-item" href="#">Edit</a>
                                        <a class="dropdown-item" href="#">Delete</a>
                                      </div>
                                    </div>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                    955655487
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                    Willy
                            </asp:TableCell>
                            <asp:TableCell>
                                    Smith
                            </asp:TableCell>
                            <asp:TableCell ForeColor="red">
                                    No
                            </asp:TableCell>
                            <asp:TableCell>
                                    <div class="dropdown">
                                      <button class="btn dropdown-toggle redbtn" type="button" id="ddlAction" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                                        Action
                                      </button>
                                      <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">                   
                                        <a class="dropdown-item" href="#">Edit</a>
                                        <a class="dropdown-item" href="#">Delete</a>
                                      </div>
                                    </div>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>


            </div>

            <%--            ~~~Dropdown Button Style~~~--%>
            <style>
                .dropdown-item.active, .dropdown-item:active {
                    color: white;
                    background-color: #91182A;
                }
            </style>
        </div>
    </div>


    <div class="container">
        <h3 class="mt-4">Manage Terms</h3>
        <div class="row mt-5">
            <div class="col">
                <div class="row mt-5">
                    <div class="col">
                        <label>
                            Semester
                        </label>
                        <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control">
                            <asp:ListItem>SPRING</asp:ListItem>
                            <asp:ListItem>FALL</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col">
                        <label>
                            Year
                        </label>
                        <asp:TextBox ID="txtYear" runat="server" CssClass="form-control" MaxLength="4" placeholder="YYYY">

                        </asp:TextBox>
                    </div>
                </div>
                <div class="mt-5 text-center mb-5">
                    <asp:Button runat="server" ID="btnCreateTerm" Text="Create Term" CssClass="btn redbtn" />
                </div>
            </div>
            <div class="col">
                <table class="table">
                    <thead class="text-white" style="background-color: #91182a">
                        <tr>
                            <th scope="col">Year</th>
                            <th scope="col">Semester</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">2019</th>
                            <td>FALL</td>
                        </tr>
                        <tr>
                            <th scope="row">2020</th>
                            <td>SPRING</td>
                        </tr>
                        <tr>
                            <th scope="row">2020</th>
                            <td>FALL</td>
                        </tr>
                        <tr>
                            <th scope="row">2021</th>
                            <td>SPRING</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</asp:Content>
