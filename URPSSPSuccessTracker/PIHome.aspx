<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PIHome.aspx.cs" Inherits="URPSSPSuccessTracker.PIHome" %>
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
                        <asp:Label ID="lblName" runat="server" Text="Johnny Appleseed" Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                    </p>
                    <p class="text-center">
                        <asp:Label ID="lblTUIDLabel" runat="server" Text="TUID:  " Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                        <asp:Label ID="lblTUID" runat="server" Text="914 274 289" Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                    </p>
                    <p class="text-center">
                        <asp:Label ID="lblEmailLabel" runat="server" Text="Email:  " Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                        <asp:Label ID="lblEmail" runat="server" Text="Johnny.Appleseed@temple.edu" Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                    </p>
                    <p class="text-center">
                        <asp:Label ID="lblMajorLabel" runat="server" Text="Major:  " Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                        <asp:Label ID="lblMajor" runat="server" Text="Computer Science" Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                    </p>
                </div>
                <div class="col-md-9" id="div2" style="background-color: ghostwhite">

                    <div class="row">
                        <asp:Table ID="tblAdministrators" runat="server" CssClass="table table-striped">

                            <asp:TableHeaderRow Style="background-color: #91182a; color: white;">
                                <asp:TableHeaderCell Scope="Column">
                                Select
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
                                TUID
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Scope="Column">
                                Term
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell Scope="Column">
                                Year
                                </asp:TableHeaderCell>
                            </asp:TableHeaderRow>

                            <asp:TableRow>
                                <asp:TableHeaderCell>
                         <asp:Button ID="btnStudent1" runat="server" Text="Select" CssClass=" btn redbtn" OnClick="btnStudent1_Click"/>
                                </asp:TableHeaderCell>
                                <asp:TableCell>
                                Larry
                                </asp:TableCell>
                                <asp:TableCell>
                                David
                                </asp:TableCell>
                                <asp:TableCell>
                                IS&T
                                </asp:TableCell>
                                <asp:TableCell>
                               934789363
                                </asp:TableCell>
                                <asp:TableCell>
                                Fall
                                </asp:TableCell>
                                <asp:TableCell>
                                2019
                                </asp:TableCell>
                            </asp:TableRow>

                              <asp:TableRow>
                                <asp:TableHeaderCell>
                         <asp:Button ID="btnStudent2" runat="server" Text="Select" CssClass=" btn redbtn" OnClick="btnStudent2_Click"/>
                                </asp:TableHeaderCell>
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
                                <asp:TableCell >
                                2019
                                </asp:TableCell>
                            </asp:TableRow>

                                     <asp:TableRow>
                                <asp:TableHeaderCell>
                         <asp:Button ID="btnStudent3" runat="server" Text="Select" CssClass=" btn redbtn" OnClick="btnStudent3_Click"/>
                                </asp:TableHeaderCell>
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
                            </asp:TableRow>

                                <asp:TableRow>
                                <asp:TableHeaderCell>
                         <asp:Button ID="btnStudent4" runat="server" Text="Select" CssClass=" btn redbtn" OnClick="btnStudent4_Click"/>
                                </asp:TableHeaderCell>
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
                            </asp:TableRow>

                            <asp:TableRow>
                                <asp:TableHeaderCell>
                         <asp:Button ID="btnStudent5" runat="server" Text="Select" CssClass=" btn redbtn" OnClick="btnStudent5_Click"/>
                                </asp:TableHeaderCell>
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
                            </asp:TableRow>

                        </asp:Table>


                    </div>

                </div>
            </div>
        </div>


    </div>
</asp:Content>