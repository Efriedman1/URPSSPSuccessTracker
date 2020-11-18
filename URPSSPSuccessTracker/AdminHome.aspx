<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="URPSSPSuccessTracker.AdminHome" %>
<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        fieldset.scheduler-border {
            border: 1px groove #ddd !important;
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

    <div class="container">
        <div class="row">
            <div class="col-6">
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Instructions</legend>
                    You may search by any combination of first name, last name, major, student term, TUID,
                            and status. Select no parameters to view all profiles. Select the Student or PI button to view Student or PI profiles.
                </fieldset>
                &nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;
                          <div class="row">
                              <asp:Button class="btn redbtn" ID="Button4" runat="server" Text="Student" OnClick="Button4_Click" />&nbsp;
                              <asp:Button class="btn redbtn" ID="Button5" runat="server" Text="Principal Investigator" />&nbsp;
                              <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control-sm">
                                  <asp:ListItem Selected="True">FALL 2020</asp:ListItem>
                                  <asp:ListItem>SPRING 2020</asp:ListItem>
                                  <asp:ListItem>FALL 2019</asp:ListItem>
                              </asp:DropDownList>
                          </div>
            </div>
            <div class="col-6">
                <div>
                    <asp:Label ID="lblParam1" runat="server" Text="TUID: "></asp:Label>
                    <asp:TextBox ID="txtTUID" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="lblDepartment" runat="server" Text="Department: "></asp:Label>
                    <asp:TextBox ID="txtDepartment" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lblFirst" runat="server" Text="First Name: "></asp:Label>
                    <asp:TextBox ID="txtFirst" runat="server" CssClass="form-control"></asp:TextBox>

                    <asp:Label ID="lblLast" runat="server" Text="Last Name: "></asp:Label>
                    <asp:TextBox ID="txtLast" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <br />
                <div style="margin-left: 120px">
                    <asp:Button class="btn redbtn" ID="btnSearch" runat="server" Text="Search" />&nbsp;
                               <asp:Button class="btn redbtn" ID="btnClear" runat="server" Text="Clear" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 table-responsive">

                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">
                        <asp:Label ID="lblUser" runat="server" Text="Principal Investigator"></asp:Label>
                    </legend>

                    <table class="table-bordered w-100" id="myTable" runat="server">
                        <thead class="bg-danger">
                            <tr>
                                <th scope="col"></th>
                                <th scope="col">TUID</th>
                                <th scope="col">First</th>
                                <th scope="col">Last</th>
                                <th scope="col">Department</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">
                                    <asp:CheckBox ID="CheckBox1" runat="server" /></th>
                                <td>9210345</td>
                                <td>Bill</td>
                                <td>Washer</td>
                                <td>IST</td>
                                <td>
                                    <asp:Button class="btn redbtn" ID="Button1" runat="server" Text="Button" /></td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <asp:CheckBox ID="CheckBox2" runat="server" /></th>
                                <td>9654123</td>
                                <td>Nyla</td>
                                <td>Taylor</td>
                                <td>IST</td>
                                <td>
                                    <asp:Button class="btn redbtn" ID="Button2" runat="server" Text="Button" /></td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <asp:CheckBox ID="CheckBox3" runat="server" /></th>
                                <td>9678521</td>
                                <td>Omar</td>
                                <td>Dodson</td>
                                <td>IST</td>
                                <td>
                                    <asp:Button class="btn redbtn" ID="Button3" runat="server" Text="Button" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <p>
                        <br />

                    </p>

                    <div style="margin-left: 40%">
                        <asp:Button class="btn redbtn" ID="btnExport" runat="server" Text="Export" />&nbsp;
                                <asp:Button class="btn redbtn" ID="btnEmail" runat="server" Text="Email All" />&nbsp;
                                <asp:Button class="btn redbtn" ID="btnEmailChecked" runat="server" Text="Email Selected" />
                    </div>
                </fieldset>

            </div>
        </div>
    </div>
</asp:Content>
