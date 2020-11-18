<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminManageUsers.aspx.cs" Inherits="URPSSPSuccessTracker.AdminManageUsers" %>
<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top:2%">

        <div class="page-header">
          <h2>Manage Admin Users</h2>
        </div>

        <div class="row">
            <div class="col-sm-12 col-sm-12 col-md-6 col-lg-6">
                <h5>Instructions</h5>
                <div class="border border-secondary" style="border-radius:5px;">
                  <div class="col-8 col-sm-6 col-lg-12 col-lg-12" style="margin-top:2%;">
                      <p>
                          You may search by any combination of first name, last name, and TUID. You may 
                          then grant system permissions to the user.
                      </p>
                  </div>                   
                </div>
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-sm-2 col-sm-2">
                <asp:Button ID="btnAddNewAdmin" runat="server" CssClass="btn p-2" Text="Add New Admin" ForeColor="white" BackColor="#B21125"/>
            </div>

            <div class="col-sm-3 col-sm-3" style="margin-top:-1.5%">
                <asp:Label ID="lblTUID" runat="server" CssClass="col-form-label">TUID</asp:Label>
                <asp:TextBox ID="txtTUID" runat="server" CssClass="form-control"  placeholder="9 Digit TUID" BackColor="#FAFAFA"></asp:TextBox>
            </div>
        </div>

        <br />

        <div class="row">
            <div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
                <h5>Administrators</h5>
                <div class="border border-secondary" style="border-radius:5px;">
                  <div class="col-12 col-sm-12 col-lg-12 col-lg-12" style="margin-top:2%;">
                     <asp:Table ID="tblAdministrators" runat="server" CssClass="table table-striped">

                        <asp:TableHeaderRow style="background-color:#B21125;color:white; ">
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
                                Admin
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
                            <asp:TableCell>
                                <asp:CheckBox runat="server" checked="true" />
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:CheckBox runat="server" checked="true" />
                            </asp:TableCell>
                            <asp:TableCell>

<%--                                <div class="form-group p2">     
                                    <asp:DropDownList runat="server" class="dropdown-toggle"  CssClass="k-dropdown" ForeColor="white" BackColor="#B21125"  >
                                        <asp:ListItem>Actions</asp:ListItem>
                                        <asp:ListItem>Edit</asp:ListItem>
                                        <asp:ListItem>Remove</asp:ListItem>
                                    </asp:DropDownList>
                                </div>--%>

                                 <div class="dropdown">
                                  <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" style="background-color:#B21125; color:white">Action
                                  <span class="caret"></span></button>
                                  <ul class="dropdown-menu">
                                    <li class="disabled"><a href="#">Action</a></li>
                                    <li><a href="#">Edit</a></li>
                                    <li><a href="#">Delete</a></li>
                                  </ul>
                                </div> 


                            </asp:TableCell>
                        </asp:TableRow>


                     </asp:Table>
                  </div>                   
                </div>
            </div>


        </div>









    </div>

</asp:Content>
