<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="URPSSPSuccessTracker.StudentHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Student Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="container-fluid">
            <div class="row text-center">
                <div class="col-md-3" id="div1" style="background-color: darkgray">
                    <img src="images/ProfilePic.jpg" class="rounded-circle center-block" style="width: 125px; height: 125px;" /><br />
                    <p class="text-center">
                        <asp:Label ID="lblName" runat="server" Text="John Doe" Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                    </p>
                    <p class="text-center">
                        <asp:Label ID="lblTUIDLabel" runat="server" Text="TUID:  " Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                        <asp:Label ID="lblTUID" runat="server" Text="914 274 289" Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                    </p>
                    <p class="text-center">
                        <asp:Label ID="lblEmailLabel" runat="server" Text="Email:  " Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                        <asp:Label ID="lblEmail" runat="server" Text="John.Doe@temple.edu" Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                    </p>
                    <p class="text-center">
                        <asp:Label ID="lblMajorLabel" runat="server" Text="Major:  " Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                        <asp:Label ID="lblMajor" runat="server" Text="Computer Science" Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                    </p>
                </div>
                <div class="col-md-9" id="div2" style="background-color: ghostwhite">

                    <div class="row">
                        <asp:Table ID="tblAdministrators" runat="server" CssClass="table table-striped">

                            <asp:TableHeaderRow Style="background-color: #B21125; color: white;">
                                <asp:TableHeaderCell Scope="Column">
                                Select
                                </asp:TableHeaderCell>
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
                            </asp:TableHeaderRow>

                            <asp:TableRow>
                                <asp:TableHeaderCell>
                                        <asp:Button ID="btnSelectTerm1" runat="server" Text="Select" style="redbtn" OnClick="btnSelectTerm1_Click"/>
                                </asp:TableHeaderCell>
                                <asp:TableCell>
                                Spring
                                </asp:TableCell>
                                <asp:TableCell>
                                2020
                                </asp:TableCell>
                                <asp:TableCell>
                                Johnny Appleseed
                                </asp:TableCell>
                                <asp:TableCell>
                                03/07/2020
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow>
                                <asp:TableHeaderCell>
                                    <asp:Button ID="btnSelectTerm2" runat="server" Text="Select" style="redbtn" OnClick="btnSelectTerm2_Click"/>
                                </asp:TableHeaderCell>
                                <asp:TableCell>
                                Summer
                                </asp:TableCell>
                                <asp:TableCell>
                                2019
                                </asp:TableCell>
                                <asp:TableCell>
                                Johnny Appleseed
                                </asp:TableCell>
                                <asp:TableCell>
                                7/15/2019
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow>
                                <asp:TableHeaderCell>
                                    <asp:Button ID="btnSelectTerm3" runat="server" Text="Select" style="redbtn" OnClick="btnSelectTerm3_Click"/>
                                </asp:TableHeaderCell>
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
                            </asp:TableRow>

                            <asp:TableRow>
                                <asp:TableHeaderCell>
                                    <asp:Button ID="btnSelectTerm4" runat="server" Text="Select" style="redbtn" OnClick="btnSelectTerm4_Click"/>
                                </asp:TableHeaderCell>
                                <asp:TableCell>
                                Spring
                                </asp:TableCell>
                                <asp:TableCell>
                                2018
                                </asp:TableCell>
                                <asp:TableCell>
                                Johnny Appleseed
                                </asp:TableCell>
                                <asp:TableCell>
                                04/07/2018
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow>
                                <asp:TableHeaderCell>
                                    <asp:Button ID="btnSelectTerm5" runat="server" Text="Select" style="redbtn" OnClick="btnSelectTerm5_Click"/>
                                </asp:TableHeaderCell>
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
                            </asp:TableRow>

                        </asp:Table>


                    </div>

                </div>
            </div>
        </div>


    </div>
</asp:Content>
