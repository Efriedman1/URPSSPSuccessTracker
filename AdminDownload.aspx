<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminDownload.aspx.cs" Inherits="URPSSPSuccessTracker.AdminDownload" %>

<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex-container m-5">
        <div class="d-flex justify-content-between">
            <h2>Search Research Information</h2>
            <div>
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
        <div class="flex-container">
            <div class="d-flex justiy-content-between">
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Instructions</legend>
                    <p>Please select a user type between the "Student" or "Principal Investigator" buttons. Then proceed to follow the below instructions depending on whether you would like to multiple or a single user.</p>
                    <div class="d-flex flex-row">
                        <asp:Label ID="Label3" runat="server" Text="Excel Upload:" CssClass="p-2 mr-3 ml-4 h6"></asp:Label>
                    </div>
                    <div class="d-flex flex-row">
                        <asp:Label ID="Label4" runat="server" Text="Please Select the file you are uploading. You MUST use the .xls file Template download through Download button. Other files will not work." CssClass="p-2 mr-3 ml-3"></asp:Label>
                    </div>
                    <div class="d-flex flex-row mt-2">
                        <asp:Label ID="Label5" runat="server" Text="Single Person Upload:" CssClass="p-2 mr-3 ml-3 h6"></asp:Label>
                    </div>
                    <div class="d-flex flex-row">
                        <asp:Label ID="Label6" runat="server" Text="Please select URP/SSP Student or Principal Investigator. Fill out the textbox for upload. All blanks can be empty, except Assessnet." CssClass="p-2 mr-3 ml-3"></asp:Label>
                    </div>
                    <div class="d-flex flex-row mt-2">
                        <button type="button" class="btn redbtn p-2 mr-3 ml-3 ">Download Template</button>
                    </div>
                </fieldset>
                <div class="col-6">
                    <asp:Label ID="lblUpload" runat="server" Text="Upload Users" CssClass="p-2 mr-3 ml-3 mb-3 h3"></asp:Label>
                    <div class="d-flex justify-content-center">
                        <asp:Label ID="lblUpDirections" runat="server" Text="User Type:" CssClass="p-2 mr-3 ml-3"></asp:Label>
                    </div>
                    <div class="d-flex justify-content-center mt-2">
                        <%--<asp:Button class="btn redbtn p-2 mr-3 ml-3 " ID="Button1" runat="server" Text="Student" />
                        <button type="button" class="btn btn-light p-2 mr-3 ml-3 ">Principal Investigator</button>--%>
                        <asp:Label class="btn btn-outline-danger" ID="Label1" runat="server" Text="Students: ">
                            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="UserType" />
                        </asp:Label>
                        &nbsp;
                        <asp:Label class="btn btn-outline-danger" ID="Label2" runat="server" Text="Principal Investigators: ">
                            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="UserType" />
                        </asp:Label>

                    </div>
                    <div class="d-flex mt-2">
                        <%-- <button type="button" class="btn redbtn p-2 mr-3 ml-3 ">Browse</button>
                        <input type="text" class="form-control col-10" placeholder="StudentTemplate.xlsx" />--%>
                        <asp:FileUpload class="p-2 mr-3 ml-3" ID="fileUploadTemplate" runat="server" />

                        <asp:RegularExpressionValidator ID="validateTemplate" runat="server" ErrorMessage="Only .xls format is allowed" ControlToValidate="fileUploadTemplate" ValidationExpression="^.*\.(xls|xlsx|csv)$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="d-flex justify-content-center mt-2">
<%--                        <button type="button" class="btn redbtn p-2 mr-3 ml-3 " data-toggle="modal" data-target="#resultModal">Upload</button>--%>
                        <asp:Button  class="btn redbtn p-2 mr-3 ml-3 " ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                        <br />

                        <asp:Label ID="lblError" runat="server" Text="Error" Visible="False"></asp:Label>
                    </div>

                   
                </div>
            </div>
        
        </div>
    </div>
</asp:Content>
