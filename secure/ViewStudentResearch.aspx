﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ViewStudentResearch.aspx.cs" Inherits="URPSSPSuccessTracker.ViewStudentResearch" %>
<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex flex-row mt-2">
        <asp:Label ID="lblName" runat="server" Text="First Last" CssClass="p-2 mr-3 ml-3 h3"></asp:Label>
        <asp:Label ID="lblID" runat="server" Text="XXX XXX XXX" ForeColor="Gray" CssClass="p-2 mr-3 h3"></asp:Label>
        <asp:Button ID="btnDash" runat="server" Text="Dashboard" CssClass="btn p-2" />
        <asp:Button ID="btnProfile" runat="server" Text="Profile" CssClass="btn p-2" />
    </div>
    <hr />
    <div class="row">
        <div class="col-8">
            <div class="card">
                <div class="container">
                    <div class="row mt-4">
                        <div class="col">
                            <label for="txtFirstName">Principal Investigator</label>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col">
                            <label for="txtLastName">PI Email</label>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col">
                            <label for="txtPhoneNumber">Principal Investigator Department</label>
                            <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col">
                            <label for="txtEmail">Title</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col">
                            <label for="txtID">TU ID</label>
                            <asp:TextBox ID="txtID" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col">
                            <label for="txtCampus">Campus</label>
                            <asp:TextBox ID="txtCampus" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col">
                            <label for="txtSchool">School</label>
                            <asp:TextBox ID="txtSchool" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col">
                            <label for="txtDepartment">Department</label>
                            <asp:TextBox ID="txtDepartment" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-light" Text="Edit"></asp:Button>
                        </div>
                        <div class="col">
                            <asp:TextBox ID="btnSave" runat="server" CssClass="btn btn-danger" Text="Save"></asp:TextBox>
                        </div>
                    </div>
                </div>
        </div>
    </div>
    <div class="col-4">
        <label>Comments</label>
    </div>
    </div>
</asp:Content>
