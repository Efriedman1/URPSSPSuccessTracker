<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="URPSSPSuccessTracker.StudentHome" %>

<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex-container m-5 justify-content-center">
        <div class="d-flex justify-content-between">
            <h2>Student Dashboard</h2>
            <div>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Selected="True">FALL 2020</asp:ListItem>
                    <asp:ListItem>SPRING 2020</asp:ListItem>
                    <asp:ListItem>FALL 2019</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="row text-center mt-3">
            <div class="col-md-4 md-offset-">
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Instructions</legend>
                    Here are the terms you have participated in for the URP/SSP Programs. Please select a term to view your research or make any changes.
                </fieldset>
            </div>
            <div class="col-md-4 justify-content-center">
                <img src="images/ProfilePic.jpg" class="rounded-circle center-block border border-secondary" style="width: 125px; height: 125px; border-radius: 5px;" /><br />
                <p class="text-center mt-3">
                    <asp:Label ID="Label1" runat="server" Text="John Doe" Style="font-size: 30px;"></asp:Label>
                </p>
            </div>
            <div class="col-md-4 text-center">
                <p>
                    <asp:Label ID="Label8" runat="server" Text="TUID:  " Style="font-size: 20px;"></asp:Label>
                    <asp:Label ID="Label9" runat="server" Text="914 274 289" Style="font-size: 20px;"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="Label10" runat="server" Text="Email:  " Style="font-size: 20px;"></asp:Label>
                    <asp:Label ID="Label11" runat="server" Text="John.Doe@temple.edu" Style="font-size: 20px;"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="Label12" runat="server" Text="Major:  " Style="font-size: 20px;"></asp:Label>
                    <asp:Label ID="Label13" runat="server" Text="Computer Science" Style="font-size: 20px;"></asp:Label>
                </p>
            </div>
        </div>
    </div>
    <div class="container mt-4">
        <h3 class="mt-2">Research Terms</h3>
        <div class="row text-center">
            <div class="col-md-11">
                <asp:Table ID="Table1" runat="server" CssClass="table table-striped">
                    <asp:TableHeaderRow Style="background-color: #91182a; color: white;">
                        <asp:TableHeaderCell Scope="Column">
                                Term
                        </asp:TableHeaderCell>
                        <asp:TableHeaderCell Scope="Column">
                                Year
                        </asp:TableHeaderCell>
                        <asp:TableHeaderCell Scope="Column">
                                PI
                        </asp:TableHeaderCell>
                        <asp:TableHeaderCell Scope="Column">
                                Last Update
                        </asp:TableHeaderCell>
                        <asp:TableHeaderCell Scope="Column">
                                Select
                        </asp:TableHeaderCell>
                    </asp:TableHeaderRow>

                    <asp:TableRow>
                        <asp:TableCell>
                                Spring
                        </asp:TableCell>
                        <asp:TableCell>
                                2020
                        </asp:TableCell>
                        <asp:TableCell>
                                Johnny Appleseed
                        </asp:TableCell>
                        <asp:TableCell ForeColor="Red">
                                Not Updated
                        </asp:TableCell>
                        <asp:TableHeaderCell>
                            <asp:Button ID="Button1" runat="server" Text="Select" CssClass=" btn redbtn" OnClick="btnSelectTerm1_Click" />
                        </asp:TableHeaderCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>
                                Fall
                        </asp:TableCell>
                        <asp:TableCell>
                                2019
                        </asp:TableCell>
                        <asp:TableCell>
                                Bill Perkins
                        </asp:TableCell>
                        <asp:TableCell>
                                12/15/2019
                        </asp:TableCell>
                        <asp:TableHeaderCell>
                            <asp:Button ID="Button2" runat="server" Text="Select" CssClass=" btn redbtn" OnClick="btnSelectTerm2_Click" />
                        </asp:TableHeaderCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>
                                Fall
                        </asp:TableCell>
                        <asp:TableCell>
                                2018
                        </asp:TableCell>
                        <asp:TableCell>
                                Johnny Appleseed
                        </asp:TableCell>
                        <asp:TableCell>
                                11/20/2018
                        </asp:TableCell>
                        <asp:TableHeaderCell>
                            <asp:Button ID="Button3" runat="server" Text="Select" CssClass=" btn redbtn" OnClick="btnSelectTerm3_Click" />
                        </asp:TableHeaderCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>
                                Spring
                        </asp:TableCell>
                        <asp:TableCell>
                                2017
                        </asp:TableCell>
                        <asp:TableCell>
                                Johnny Appleseed
                        </asp:TableCell>
                        <asp:TableCell>
                                04/07/2017
                        </asp:TableCell>
                        <asp:TableHeaderCell>
                            <asp:Button ID="Button4" runat="server" Text="Select" CssClass=" btn redbtn" OnClick="btnSelectTerm4_Click" />
                        </asp:TableHeaderCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>
                                Fall
                        </asp:TableCell>
                        <asp:TableCell>
                                2017
                        </asp:TableCell>
                        <asp:TableCell>
                                Johnny Appleseed
                        </asp:TableCell>
                        <asp:TableCell>
                                11/12/2017
                        </asp:TableCell>
                        <asp:TableHeaderCell>
                            <asp:Button ID="Button5" runat="server" Text="Select" CssClass=" btn redbtn" OnClick="btnSelectTerm5_Click" />
                        </asp:TableHeaderCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </div>
</asp:Content>
