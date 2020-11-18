<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ManageTerm.aspx.cs" Inherits="URPSSPSuccessTracker.ManageTerm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <label class="h3 mt-3 ml-4">Manage Term</label>
    <br />
    <label class="h6 ml-4 mt-5">
        Academic Terms
    </label>
    <div class="card">
        <div class="container">
            <div class="row mt-5">
                <div class="col">
                    <label class="h6">
                        Instructions
                    </label>
                    <div class="card">
                        <label>
                            You may enter a new term into the system, Select semester and enter a year, then click the create term button.
                        </label>
                    </div>
                    <div class="row mt-5">
                        <div class="col">
                            <label>
                                Semester
                            </label>
                            <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control">
                                <asp:ListItem>SPRING</asp:ListItem>
                                <asp:ListItem>FALL</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col">
                            <label>
                                Year
                            </label>
                            <asp:TextBox ID="txtYear" runat="server" CssClass="form-control" MaxLength="4">

                            </asp:TextBox>
                        </div>
                    </div>
                    <div class="mt-5 text-center mb-5">
                        <asp:Button runat="server" ID="btnCreateTerm" Text="Create Term" CssClass="btn btn-light" />
                    </div>
                </div>
                <div class="col">
                    <table class="table">
                        <thead class="bg-danger text-white">
                            <tr>
                                <th scope="col">Year</th>
                                <th scope="col">Semester</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">2019</th>
                                <td>FALL</td>
                            </tr>
                            <tr>
                                <th scope="row">2020</th>
                                <td>SPRING</td>
                            </tr>
                            <tr>
                                <th scope="row">2020</th>
                                <td>FALL</td>
                            </tr>
                            <tr>
                                <th scope="row">2021</th>
                                <td>SPRING</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>