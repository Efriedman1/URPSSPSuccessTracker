<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PIViewStudent.aspx.cs" Inherits="URPSSPSuccessTracker.PIViewStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="d-flex flex-row mt-2">
        <asp:label id="lblName" runat="server" text="Bill Wascher" cssclass="p-2 mr-3 ml-3 h3"></asp:Label>
        <asp:Label ID="lblID" runat="server" Text="915 552 620" ForeColor="Gray" CssClass="p-2 mr-3 h3"></asp:Label>
        <asp:Button ID="btnDash" runat="server" Text="Dashboard" CssClass="btn p-2" />
        <asp:Button ID="btnProfile" runat="server" Text="Profile" CssClass="btn p-2" />
    </div>

</asp:Content>
