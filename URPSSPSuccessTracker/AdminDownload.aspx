<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminDownload.aspx.cs" Inherits="URPSSPSuccessTracker.AdminDownload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex flex-row mt-2">        
        <asp:Label ID="lblName" runat="server" Text="Download Template" CssClass="p-2 mr-3 ml-3 h3"></asp:Label>   
    </div>
    <div class="d-flex flex-row mt-2">
        <div class="col-xl-6 border border-secondary rounded">
            <asp:Label ID="lblInstructions" runat="server" Text="Instructions" CssClass="p-2 mr-3 ml-3 h5"></asp:Label>
            <div class="d-flex flex-row-reverse">
                <div class="dropdown">
                    <button class="btn btn-small btn-secondary" type="button" id="ddlTerm">
                        Spring 2020
                    </button>            
                </div>
                <asp:Label ID="lblTerm" runat="server" Text="Term"></asp:Label>
            </div>
            <div class="d-flex flex-row">
                <asp:Label ID="lblExcel" runat="server" Text="Excel Upload:"  CssClass="p-2 mr-3 ml-3"></asp:Label>
            </div>
            <div class="d-flex flex-row">
                <asp:Label ID="lblExcelDirections" runat="server" Text="Please Select the file you are uploading. You MUST use the .xls file Template download through Download button. Other files will not work."  CssClass="p-2 mr-3 ml-3"></asp:Label>
            </div>
            <div class="d-flex flex-row">
                <asp:Label ID="lblSingle" runat="server" Text="Single Person Upload:"  CssClass="p-2 mr-3 ml-3"></asp:Label>
            </div>
            <div class="d-flex flex-row">
                <asp:Label ID="lblSingleDirection" runat="server" Text="Please select URP/SSP Student or Principal Investigator. Fill out the textbox for upload. All blanks can be empty, except Assessnet."  CssClass="p-2 mr-3 ml-3"></asp:Label>
            </div>
            <div class="d-flex flex-row">
                <button type="button" class="btn btn-danger p-2 mr-3 ml-3 ">URP/SSP Student Template</button>
                <button type="button" class="btn btn-danger p-2 mr-3 ml-3 ">Principal Investigator Template</button>
            </div>
        </div>

        <div class="col-xl-6 border border-secondary rounded">
            <asp:Label ID="lblUpload" runat="server" Text="Upload Users" CssClass="p-2 mr-3 ml-3 h5"></asp:Label>
            <div class="d-flex justify-content-center">
                <asp:Label ID="lblUpDirections" runat="server" Text="Please Select a User Type for Upload:"  CssClass="p-2 mr-3 ml-3"></asp:Label>
            </div>   
            <div class="d-flex justify-content-center">
                <button type="button" class="btn btn-danger p-2 mr-3 ml-3 ">Student</button>
                <button type="button" class="btn btn-light p-2 mr-3 ml-3 ">Principal Investigator</button>
            </div>
            <div class="d-flex justify-content-center">
                <button type="button" class="btn btn-danger p-2 mr-3 ml-3 ">Browse</button>
                <input type="text" class="form-control" placeholder="StudentTemplate.xlsx" />
            </div>
            <div class="d-flex justify-content-center">
                <button type="button" class="btn btn-danger p-2 mr-3 ml-3 ">Upload</button>
            </div>
        </div>
    </div>
    <div class="col-xl-6 border border-seconday rounded">
        <div class="d-flex flex-row">
            <asp:Label ID="tblUpload" runat="server" Text="Uploads" CssClass="p-2 mr-3 ml-3 h5"></asp:Label>
        </div>
        <div class="d-flex flex-row">
            <asp:Table ID="tblDownload" runat="server" CssClass="table table-striped">
                <asp:TableRow CssClass="table table-danger">
                    <asp:TableCell Text="TUID" />
                    <asp:TableCell Text="Student Name" />
                    <asp:TableCell Text="Status" />
                </asp:TableRow>
                <asp:TableRow CssClass="thead-dark">
                    <asp:TableCell Text="596221364" />
                    <asp:TableCell Text="Lara Nelson" />
                    <asp:TableCell Text="Student ID Error" CssClass="text-danger" />
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="602115453" />
                    <asp:TableCell Text="Salim Nash" />
                    <asp:TableCell Text="Student ID Error" CssClass="text-danger" />
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="562398451" />
                    <asp:TableCell Text="Farzana Cherry" />
                    <asp:TableCell Text="Student ID Error" CssClass="text-danger" />
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="339566481" />
                    <asp:TableCell Text="Raymond Derrick" />
                    <asp:TableCell Text="Success" CssClass="text-success" />
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="953249134" />
                    <asp:TableCell Text ="Alyssa Jefferson" />
                    <asp:TableCell Text="Success" CssClass="text-success" />
                </asp:TableRow>
            </asp:Table>
        </div>
    </div>
</asp:Content>
