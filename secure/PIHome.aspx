<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PIHome.aspx.cs" Inherits="URPSSPSuccessTracker.PIHome" %>

<%@ MasterType VirtualPath="~/Master.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>PI Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                    <button type="button" class="btn redbtn p-2 mr-3 ml-3 mt-4" >Search</button>
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
    <div class="container mt-4">
        <h3 class="mt-2">Research Terms</h3>
        <div class="row text-center">
            <div class="col-md-11">
                <asp:Table ID="tblAdministrators" runat="server" CssClass="table table-striped">
                    <asp:TableHeaderRow Style="background-color: #91182a; color: white;">
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
                                TUID
                        </asp:TableHeaderCell>
                        <asp:TableHeaderCell Scope="Column">
                                Term
                        </asp:TableHeaderCell>
                        <asp:TableHeaderCell Scope="Column">
                                Year
                        </asp:TableHeaderCell>
                        <asp:TableHeaderCell Scope="Column">
                                Action
                        </asp:TableHeaderCell>
                    </asp:TableHeaderRow>

                    <asp:TableRow>
                        <asp:TableCell>
                                John
                        </asp:TableCell>
                        <asp:TableCell>
                                Doe
                        </asp:TableCell>
                        <asp:TableCell>
                                CHEM
                        </asp:TableCell>
                        <asp:TableCell>
                               914274289
                        </asp:TableCell>
                        <asp:TableCell>
                                Fall
                        </asp:TableCell>
                        <asp:TableCell>
                                2019
                        </asp:TableCell>
                        <asp:TableHeaderCell>
                            <asp:Button ID="btnStudent1" runat="server" Text="View" CssClass=" btn redbtn" OnClick="btnStudent1_Click" />
                        </asp:TableHeaderCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>
                                Jerry
                        </asp:TableCell>
                        <asp:TableCell>
                                Seinfeld
                        </asp:TableCell>
                        <asp:TableCell>
                                IS&T
                        </asp:TableCell>
                        <asp:TableCell>
                               944888293
                        </asp:TableCell>
                        <asp:TableCell>
                                Spring
                        </asp:TableCell>
                        <asp:TableCell>
                                2019
                        </asp:TableCell>
                        <asp:TableHeaderCell>
                            <asp:Button ID="btnStudent2" runat="server" Text="View" CssClass=" btn redbtn" OnClick="btnStudent2_Click" />
                        </asp:TableHeaderCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>
                                George
                        </asp:TableCell>
                        <asp:TableCell>
                                Costanza
                        </asp:TableCell>
                        <asp:TableCell>
                                MIS
                        </asp:TableCell>
                        <asp:TableCell>
                               945698763
                        </asp:TableCell>
                        <asp:TableCell>
                                Fall
                        </asp:TableCell>
                        <asp:TableCell>
                                2019
                        </asp:TableCell>
                        <asp:TableHeaderCell>
                            <asp:Button ID="btnStudent3" runat="server" Text="View" CssClass=" btn redbtn" OnClick="btnStudent3_Click" />
                        </asp:TableHeaderCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>
                                Cosmo
                        </asp:TableCell>
                        <asp:TableCell>
                                Kramer
                        </asp:TableCell>
                        <asp:TableCell>
                                Undeclared
                        </asp:TableCell>
                        <asp:TableCell>
                               994473392
                        </asp:TableCell>
                        <asp:TableCell>
                                Spring
                        </asp:TableCell>
                        <asp:TableCell>
                                2018
                        </asp:TableCell>
                        <asp:TableHeaderCell>
                            <asp:Button ID="btnStudent4" runat="server" Text="View" CssClass=" btn redbtn" OnClick="btnStudent4_Click" />
                        </asp:TableHeaderCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>
                                Elaine
                        </asp:TableCell>
                        <asp:TableCell>
                                Benes
                        </asp:TableCell>
                        <asp:TableCell>
                                FMA
                        </asp:TableCell>
                        <asp:TableCell>
                               946739210
                        </asp:TableCell>
                        <asp:TableCell>
                                Summer
                        </asp:TableCell>
                        <asp:TableCell>
                                2018
                        </asp:TableCell>
                        <asp:TableHeaderCell>
                            <asp:Button ID="btnStudent5" runat="server" Text="View" CssClass=" btn redbtn" OnClick="btnStudent5_Click" />
                        </asp:TableHeaderCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </div>
</asp:Content>
