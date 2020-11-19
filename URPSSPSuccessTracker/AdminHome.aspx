<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="URPSSPSuccessTracker.AdminHome" %>

<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex-container m-5">
        <div class="d-flex justify-content-between">
            <h2>Search Research Information</h2>
            <div>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                    <asp:ListItem Selected="True">FALL 2020</asp:ListItem>
                    <asp:ListItem>SPRING 2020</asp:ListItem>
                    <asp:ListItem>FALL 2019</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-6">
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Instructions</legend>
                    You may search by any combination of first name, last name, major, student term, TUID,
                            and status. Select no parameters to view all profiles. Select the Student or PI button to view Student or PI profiles.
                </fieldset>


                &nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;

            </div>
            <div class="col-6 col">
                <asp:Panel ID="pnlPISearch" runat="server">
                    <div class="container">
                        <h3>Search</h3>
                        <div class="row">
                            <div class="col-auto">
                                <asp:Label ID="lblParam1" runat="server" Text="TUID: "></asp:Label><br />
                                <asp:TextBox ID="txtTUID" CssClass=" form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-auto">
                                <asp:Label ID="lblDepartment" runat="server" Text="Department: "></asp:Label><br />
                                <asp:TextBox ID="txtDepartment" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-auto">
                                <asp:Label ID="lblFirst" runat="server" Text="First Name: "></asp:Label><br />
                                <asp:TextBox ID="txtFirst" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-auto">
                                <asp:Label ID="lblLast" runat="server" Text="Last Name: "></asp:Label><br />
                                <asp:TextBox ID="txtLast" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="mb-5">
                            <asp:Button CssClass="btn redbtn m-2" ID="btnSearch" runat="server" Text="Search" />
                            <asp:Button CssClass="btn redbtn m-2" ID="btnClear" runat="server" Text="Clear" />
                        </div>
                    </div>
                </asp:Panel>


                <asp:Panel ID="pnlStudentSearch" runat="server">

                    <div class="container">
                        <h3>Search</h3>
                        <%-- 1st row --%>
                        <div class="row">
                            <div class="col-auto">
                                <asp:Label ID="Label4" runat="server" Text="TUID: "></asp:Label><br />
                                <asp:TextBox ID="TextBox5" CssClass=" form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-auto">
                                <asp:Label ID="lblProgram" runat="server" Text="Program : "></asp:Label><br />
                                <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>SSP</asp:ListItem>
                                    <asp:ListItem>SSP/URP</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <%-- 2nd row --%>
                        <div class="row">
                            <div class="col-auto">
                                <asp:Label ID="Label2" runat="server" Text="First Name: "></asp:Label><br />
                                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                            <div class="col-auto">
                                <asp:Label ID="Label3" runat="server" Text="Last Name: "></asp:Label><br />
                                <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <%-- 3rd row --%>
                        <div class="row">
                            <div class="col-auto">
                                <asp:Label ID="Label1" runat="server" Text="Major: "></asp:Label><br />
                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-auto">
                                <asp:Label ID="lblStatus" runat="server" Text="Status: "></asp:Label><br />
                                <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                                    <asp:ListItem>Complete</asp:ListItem>
                                    <asp:ListItem>Incomplete</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <asp:Button CssClass="btn redbtn m-2" ID="Button9" runat="server" Text="Search" />
                        <asp:Button CssClass="btn redbtn m-2" ID="Button10" runat="server" Text="Clear" />
                    </div>

                    <%--  --%>
                </asp:Panel>
            </div>
            <div class="container mt-5">
                <div class="d-flex justify-content-between mt-2 mb-2">
                    <div>
                        <asp:Label ID="lblUser" runat="server" Text="Principal Investigator" CssClass="h3 mt-5 mb-2"></asp:Label>
                    </div>
                    <div>
                        <asp:Button class="btn p-2" CssClass="btn redbtn" ID="btnStudent" runat="server" Text="Student" OnClick="Button4_Click" />
                        <asp:Button class="btn ml-3" CssClass="btn redbtn" ID="btnPI" runat="server" Text="Principal Investigator" OnClick="Button5_Click" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 table-responsive">
                        <asp:Panel ID="pnlPI" runat="server">
                            <asp:Table ID="tblPI" class="table table-striped table-responsive-lg m-auto w-100" runat="server">
                                <asp:TableHeaderRow Style="background-color: #91182a; color: white;">
                                    <asp:TableHeaderCell Scope="Column">
                                
                                    </asp:TableHeaderCell>
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
                                Department
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell Scope="Column">
                                Actions
                                    </asp:TableHeaderCell>
                                </asp:TableHeaderRow>


                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                921034587
                                    </asp:TableHeaderCell>
                                    <asp:TableCell>
                                Bill
                                    </asp:TableCell>
                                    <asp:TableCell>
                                Wascher
                                    </asp:TableCell>
                                    <asp:TableCell>
                                IST
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Button CssClass="btn redbtn" ID="Button6" runat="server" Text="Button" />
                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                        <asp:CheckBox ID="CheckBox2" runat="server" />
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                9654123
                                    </asp:TableHeaderCell>
                                    <asp:TableCell>
                                Nyla
                                    </asp:TableCell>
                                    <asp:TableCell>
                                Taylor
                                    </asp:TableCell>
                                    <asp:TableCell>
                                IST
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Button CssClass="btn redbtn" ID="Button1" runat="server" Text="Button" />
                                    </asp:TableCell>
                                </asp:TableRow>


                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                        <asp:CheckBox ID="CheckBox3" runat="server" />
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                9678521
                                    </asp:TableHeaderCell>
                                    <asp:TableCell>
                                Omar
                                    </asp:TableCell>
                                    <asp:TableCell>
                                Dodson
                                    </asp:TableCell>
                                    <asp:TableCell>
                                IST
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Button CssClass="btn redbtn" ID="Button2" runat="server" Text="Button" />
                                    </asp:TableCell>
                                </asp:TableRow>

                            </asp:Table>

                        </asp:Panel>


                        <asp:Panel ID="pnlStudent" runat="server">
                            <asp:Table ID="tblStudent" class="table table-striped table-responsive-lg m-auto w-100" runat="server">
                                <asp:TableHeaderRow Style="background-color: #91182a; color: white;">

                                    <asp:TableHeaderCell Scope="Column">
                                
                                    </asp:TableHeaderCell>
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
                                Major
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell Scope="Column">
                                Program
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell Scope="Column">
                                Principal Investigator
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell Scope="Column">
                                Status
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell Scope="Column">
                                Actions
                                    </asp:TableHeaderCell>
                                </asp:TableHeaderRow>


                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                        <asp:CheckBox ID="CheckBox4" runat="server" />
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                921034590
                                    </asp:TableHeaderCell>
                                    <asp:TableCell>
                                Ruby
                                    </asp:TableCell>
                                    <asp:TableCell>
                                Byrd
                                    </asp:TableCell>
                                    <asp:TableCell>
                                IST
                                    </asp:TableCell>
                                    <asp:TableCell>
                                SSP
                                    </asp:TableCell>
                                    <asp:TableCell>
                                Omar Dodson
                                    </asp:TableCell>
                                    <asp:TableCell>
                                Complete
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Button CssClass="btn redbtn" ID="Button3" runat="server" Text="Button" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <%--  --%>
                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                        <asp:CheckBox ID="CheckBox5" runat="server" />
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                958623144
                                    </asp:TableHeaderCell>
                                    <asp:TableCell>
                                Jane
                                    </asp:TableCell>
                                    <asp:TableCell>
                                Norton
                                    </asp:TableCell>
                                    <asp:TableCell>
                                CS
                                    </asp:TableCell>
                                    <asp:TableCell>
                                SSP/URP
                                    </asp:TableCell>
                                    <asp:TableCell>
                                Bill Wascher
                                    </asp:TableCell>
                                    <asp:TableCell ForeColor="Red">
                                Incomplete
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Button CssClass="btn redbtn" ID="Button4" runat="server" Text="Button" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <%--  --%>
                                <%--  --%>
                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                        <asp:CheckBox ID="CheckBox6" runat="server" />
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                982631569
                                    </asp:TableHeaderCell>
                                    <asp:TableCell>
                                Sahar
                                    </asp:TableCell>
                                    <asp:TableCell>
                                Mayo
                                    </asp:TableCell>
                                    <asp:TableCell>
                                CS
                                    </asp:TableCell>
                                    <asp:TableCell>
                                SSP
                                    </asp:TableCell>
                                    <asp:TableCell>
                                Jann Mann
                                    </asp:TableCell>
                                    <asp:TableCell>
                                Complete
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Button CssClass="btn redbtn" ID="Button5" runat="server" Text="Button" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <%--  --%>
                                <%--  --%>
                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                        <asp:CheckBox ID="CheckBox7" runat="server" />
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                987455266
                                    </asp:TableHeaderCell>
                                    <asp:TableCell>
                                Terry
                                    </asp:TableCell>
                                    <asp:TableCell>
                                Berry
                                    </asp:TableCell>
                                    <asp:TableCell>
                                CHEM
                                    </asp:TableCell>
                                    <asp:TableCell>
                                SSP
                                    </asp:TableCell>
                                    <asp:TableCell>
                                Iwan Haliday
                                    </asp:TableCell>
                                    <asp:TableCell ForeColor="Red">
                                Incomplete
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Button CssClass="btn redbtn" ID="Button7" runat="server" Text="Button" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <%--  --%>
                                <%--  --%>
                                <asp:TableRow>
                                    <asp:TableHeaderCell>
                                        <asp:CheckBox ID="CheckBox8" runat="server" />
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>
                                963015548
                                    </asp:TableHeaderCell>
                                    <asp:TableCell>
                                Nida
                                    </asp:TableCell>
                                    <asp:TableCell>
                                Reeves
                                    </asp:TableCell>
                                    <asp:TableCell>
                                HST
                                    </asp:TableCell>
                                    <asp:TableCell>
                                SSP/URP
                                    </asp:TableCell>
                                    <asp:TableCell>
                                Malik Benton
                                    </asp:TableCell>
                                    <asp:TableCell>
                                Incomplete
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Button CssClass="btn redbtn" ID="Button8" runat="server" Text="Button" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <%--  --%>
                            </asp:Table>
                        </asp:Panel>
                        <p>
                            <br />

                        </p>

                        <div style="margin-left: 40%">
                            <asp:Button class="btn" CssClass="btn redbtn" ID="btnExport" runat="server" Text="Export" />&nbsp;
                                <asp:Button class="btn" CssClass="btn redbtn" ID="btnEmail" runat="server" Text="Email All" OnClick="btnEmail_Click" />&nbsp;
                                <asp:Button class="btn" CssClass="btn redbtn" ID="btnEmailChecked" runat="server" Text="Email Selected" OnClick="btnEmailChecked_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
