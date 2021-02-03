<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="URPSSPSuccessTracker.StudentHome" %>

<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex-container m-5">
        <div class="row mt-3">
            <div class="col-md-2 md-offset-">
                <h2>Student Dashboard</h2>
            </div>
            <div class="col-md-2 mt-2">
                <asp:Label ID="Label2" runat="server" Text="TUID:  " Style="font-size: 20px;"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="914274289" Style="font-size: 20px;"></asp:Label>
            </div>
            <div class="col-md-3 mt-2">
                <asp:Label ID="Label4" runat="server" Text="Email:  " Style="font-size: 20px;"></asp:Label>
                <asp:Label ID="Label5" runat="server" Text="John.Doe@temple.edu" Style="font-size: 20px;"></asp:Label>
            </div>
            <div class="col-md-3 mt-2">
                <asp:Label ID="Label6" runat="server" Text="Major:  " Style="font-size: 20px;"></asp:Label>
                <asp:Label ID="Label7" runat="server" Text="Computer Science" Style="font-size: 20px;"></asp:Label>
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
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">
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
                                <h5 class="modal-title" id="exampleModalLabel">Instructions</h5>
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
                                Action
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
                            <asp:Button ID="Button1" runat="server" Text="View" CssClass=" btn redbtn" OnClick="btnSelectTerm1_Click" />
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
                            <asp:Button ID="Button2" runat="server" Text="View" CssClass=" btn redbtn" OnClick="btnSelectTerm2_Click" />
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
                            <asp:Button ID="Button3" runat="server" Text="View" CssClass=" btn redbtn" OnClick="btnSelectTerm3_Click" />
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
                            <asp:Button ID="Button4" runat="server" Text="View" CssClass=" btn redbtn" OnClick="btnSelectTerm4_Click" />
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
                            <asp:Button ID="Button5" runat="server" Text="View" CssClass=" btn redbtn" OnClick="btnSelectTerm5_Click" />
                        </asp:TableHeaderCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </div>
</asp:Content>
