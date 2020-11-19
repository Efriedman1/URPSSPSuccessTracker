<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PIHome.aspx.cs" Inherits="URPSSPSuccessTracker.PIHome" %>

<%@ MasterType VirtualPath="~/Master.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>PI Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex-container m-5 justify-content-center">
        <div class="d-flex justify-content-between">
            <h2>PI Dashboard</h2>
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
        <div class="row text-center mt-3">
            <div class="col-md-2"></div>
            <div class="col-md-2 md-offset-">
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Instructions</legend>
                    You are a Principal Investigator: View your student list below to monitor their research success!
                </fieldset>
            </div>
            <div class="col-md-4 justify-content-center">
                <img src="images/ProfilePic.jpg" class="rounded-circle center-block border border-secondary" style="width: 125px; height: 125px; border-radius: 5px;" /><br />
                <p class="text-center mt-3">
                    <asp:Label ID="Label1" runat="server" Text="Bill Perkins" Style="font-size: 30px;"></asp:Label>
                </p>
            </div>
            <div class="col-md-2 text-center">
                <p class="mt-4">
                    <asp:Label ID="Label8" runat="server" Text="TUID:  " Style="font-size: 20px;"></asp:Label>
                    <asp:Label ID="Label9" runat="server" Text="918 467 732" Style="font-size: 20px;"></asp:Label>
                </p>
                <p class="mt-2">
                    <asp:Label ID="Label10" runat="server" Text="Email:  " Style="font-size: 20px;"></asp:Label>
                    <asp:Label ID="Label11" runat="server" Text="BPerkins@temple.edu" Style="font-size: 20px;"></asp:Label>
                </p>
            </div>
                        <div class="col-md-2"></div>
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
