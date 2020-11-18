<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="URPSSPSuccessTracker.StudentHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Student Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container md-auto justify-content-center mt-5">
        <div class="row text-center">
            <div class="col-md-4 md-offset-">
                <h5>Instructions</h5>
                <div class="border border-secondary" style="border-radius: 5px;">
                    You are a student, select a term below to review and update your research!
                </div>
            </div>
            <div class="col-md-4 justify-content-center">
                <img src="images/ProfilePic.jpg" class="rounded-circle center-block border border-secondary" style="width: 125px; height: 125px; border-radius: 5px;" /><br />
                <p class="text-center mt-3">
                    <asp:Label ID="Label1" runat="server" Text="John Doe" Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                </p>
            </div>
            <div class="col-md-4 text-center">
                <p>
                    <asp:Label ID="Label8" runat="server" Text="TUID:  " Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                    <asp:Label ID="Label9" runat="server" Text="914 274 289" Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="Label10" runat="server" Text="Email:  " Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                    <asp:Label ID="Label11" runat="server" Text="John.Doe@temple.edu" Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="Label12" runat="server" Text="Major:  " Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                    <asp:Label ID="Label13" runat="server" Text="Computer Science" Style="font-family: Avenir Next; font-size: 20px;"></asp:Label>
                </p>
            </div>
        </div>
    </div>
    <div class="container mt-4">
        <div class="row justify-content-center text-center">
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
                        <asp:TableCell>
                                03/07/2020
                        </asp:TableCell>
                        <asp:TableHeaderCell>
                            <asp:Button ID="Button1" runat="server" Text="Select" CssClass=" btn redbtn" OnClick="btnSelectTerm1_Click" />
                        </asp:TableHeaderCell>
                    </asp:TableRow>

                    <asp:TableRow>
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
                                2018
                        </asp:TableCell>
                        <asp:TableCell>
                                Johnny Appleseed
                        </asp:TableCell>
                        <asp:TableCell>
                                04/07/2018
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
