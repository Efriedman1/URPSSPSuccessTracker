<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminManageUsers.aspx.cs" Inherits="URPSSPSuccessTracker.AdminManageUsers" %>

<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function ShowPopup() {
            $("#modal1").modal("show");
        }
    </script>

    <div class="" style="margin-top: 2%">
        <div class="page-header">
            <h2>Admin Management</h2>
        </div>

        <div class="row">
            <div class="col-sm-12 col-sm-12 col-md-6 col-lg-6">
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Instructions</legend>
                    <asp:Label runat="server" ID="lblInstructions" Text="null"></asp:Label>
                </fieldset>
            </div>
        </div>
    </div>
    <div class="">
        <h3 class="mt-3">Manage Admin Users</h3>
        <div class="row">
            <div class="col-4">
                <div class="col-sm-10 " style="margin-top: 3px">
                    <asp:Label ID="Label1" runat="server" CssClass="col-form-label">TUID</asp:Label>
                    <asp:TextBox ID="txtTUID" runat="server" CssClass="form-control mb-2 col-8" placeholder="9 Digit TUID" BackColor="#FAFAFA"></asp:TextBox>
                </div>
                <div class="col-sm-10 " style="margin-top: 3px">
                    <asp:Label Text="No user found." runat="server" CssClass="text-danger" Visible="false" ID="lblNoUser"/>
                </div>

                <div class="col-sm-12 col-sm-12">
                    <asp:Button ID="AddAdminModal" runat="server" Text="Add New Admin" CssClass="button redbtn" data-toggle="modal" data-target="#modal" OnClick="AddAdminModal_Click" />
                    <div class="modal fade" id="modal1" role="dialog" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Is this the person?</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <b>TUID:</b> <asp:Label Text="956324895" runat="server"  ID="lblTUID"/>
                                    <br />
                                    <b>First Name:</b> <asp:Label Text="Cody" runat="server" ID="lblFirstName" />
                                    <br /> 
                                    <b>Last Name:</b> <asp:Label Text="Guevara" runat="server" ID="lblLastName"/>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                    <asp:Button type="button" class="btn redbtn" runat="server" ID="btnModalAddAdmin" OnClick="btnModalAddAdmin_Click" Text="Confirm and Add"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-8">
                <div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="col-12 col-sm-12 col-lg-12 col-lg-12" style="margin-top: 2%;">
                        <asp:GridView runat="server" ID="gvAdministrators" DataKeyNames="TUID" AutoGenerateColumns="false" OnRowCommand="gvAdministrators_RowCommand" CssClass="table table-borderless text-center table-striped" BorderStyle="None" HeaderStyle-BackColor="#91182a" HeaderStyle-ForeColor="White" HeaderStyle-Font-Size="X-Large" Font-Size="X-Large">
                            <Columns>
                                <asp:BoundField DataField="TUID" HeaderText="TUID"/>
                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                                <asp:BoundField DataField="LastName" HeaderText="LastName" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />             
                                <asp:BoundField DataField="Active" HeaderText="Active" />             
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="dropdown" >
                                            <button id="dropdownbutton" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >Actions</button>
                                            <div class="dropdown-menu">
                                            <asp:Button Text="Change Status" runat="server" CommandName="EditAdmin" CssClass="dropdown-item"/>
                                            <asp:Button Text="Delete" runat="server" CommandName="DeleteAdmin" CssClass="dropdown-item"/>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
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
    </div>


    <div class="">
        <h3 class="mt-4">Manage Terms</h3>        
        <div class="row mt-5">
            <div class="col">
                <div class="row col-6">
                    <div class="col">
                        <label>
                            Term
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
                <div class="col-sm-12 mt-2">
                    <asp:Button runat="server" ID="btnCreateTerm" Text="Create Term" CssClass="button redbtn btn-lg"  OnClick="btnCreateTerm_Click" />
                </div>
            </div>
            <div class="col-12">
                
                <div class="col-12 col-sm-12 col-lg-12 col-lg-12" style="margin-top: 2%; margin-bottom:10%">            
                <asp:GridView runat="server" ID="gvTerms" DataKeyNames="TermID" AutoGenerateColumns="false" OnRowCommand="gvTerms_RowCommand" OnRowDeleting="gvTerms_RowDeleting" CssClass="table table-borderless text-center table-striped" BorderStyle="None" HeaderStyle-BackColor="#91182a" HeaderStyle-ForeColor="White" HeaderStyle-Font-Size="X-Large" Font-Size="X-Large">
                    <Columns>
                        <asp:BoundField DataField="TermID" HeaderText="TermID" Visible="false"/>
                        <asp:BoundField DataField="Semester" HeaderText="Term" />
                        <asp:BoundField DataField="Year" HeaderText="Year" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />        
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button Text="Change Status" runat="server" CssClass="btn btn-primary" CommandName="EditStatus"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="true" HeaderText="Delete" ControlStyle-CssClass="btn redbtn"/>
                    </Columns>
                </asp:GridView>
        </div>
            </div>
        </div>

    </div>
    <div style="padding:20px;"></div>
</asp:Content>
