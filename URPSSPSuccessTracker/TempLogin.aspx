<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="TempLogin.aspx.cs" Inherits="URPSSPSuccessTracker.TempLogin" %>
<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
        <div class="d-flex justify-content-center">
            <div class="card" style="width: 25rem; margin-top: 150px;">
                <div class="card-body">
                    <img class="mb-4" src="images/templeulogo.png" alt="" width="360" height="" />
                    <h1 class="h3 mb-3 font-weight-normal text-center">Please Select a User Type</h1>
                    <br />
                    <asp:Button ID="btnAdmin" runat="server" class="btn btn-md btn-danger btn-block" type="submit" Text="Admin" OnClick="btnAdmin_Click"   />
                    <br />
                    <asp:Button ID="btnPI" runat="server" class="btn btn-md btn-danger btn-block" type="submit" Text="Principal Investigator" OnClick="btnPI_Click"   />
                    <br />
                    <asp:Button ID="btnStudent" runat="server" class="btn btn-md btn-danger btn-block" type="submit" Text="Student" OnClick="btnStudent_Click"   />
                </div>
            </div>
        </div>
</asp:Content>
