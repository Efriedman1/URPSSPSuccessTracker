<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="URPSSPSuccessTracker.StudentHome" %>

<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex-container m-5">
        <div class="row">
            <asp:Label ID="lblInfo" Text="" runat="server" /></div>
        <div class="row mt-3">
            <div class="col-md-2 md-offset-">
                <h2>Student Dashboard</h2>
            </div>
            <div class="col-md-2 mt-2">
                <asp:Label ID="Label2" runat="server" Text="TUID:  " Style="font-size: 20px;"></asp:Label>
                <asp:Label ID="lblTUID" runat="server" Text="914274289" Style="font-size: 20px;"></asp:Label>
            </div>
            <div class="col-md-3 mt-2">
                <asp:Label ID="Label4" runat="server" Text="Email:  " Style="font-size: 20px;"></asp:Label>
                <asp:Label ID="lblEmail" runat="server" Text="John.Doe@temple.edu" Style="font-size: 20px;"></asp:Label>
            </div>
            <div class="col-md-3 mt-2">
                <asp:Label ID="Label6" runat="server" Text="Major:  " Style="font-size: 20px;"></asp:Label>
                <asp:Label ID="lblMajor" runat="server" Text="Computer Science" Style="font-size: 20px;"></asp:Label>
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

            <%--                <asp:TableHeaderCell Scope="Column">
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
                                </asp:TableHeaderCell>--%>

            <div class="col-md-11">
                <asp:GridView ID="gvStudent" runat="server" CssClass="table table-striped" OnRowDataBound="gvStudent_RowDataBound" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="Term" HeaderText="Term" />
                        <asp:BoundField DataField="Year" HeaderText="Year" />
                        <asp:BoundField DataField="PI" HeaderText="PI" />
                        <asp:BoundField DataField="LastUpdate" HeaderText="Last Update" />
                        <asp:TemplateField></asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
