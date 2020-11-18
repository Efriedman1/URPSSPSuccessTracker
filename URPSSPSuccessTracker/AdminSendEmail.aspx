<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminSendEmail.aspx.cs" Inherits="URPSSPSuccessTracker.AdminSendEmail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin-top:2%">

        <div class="page-header">
          <h2>Send Email</h2>
        </div>

        <div class="row">
            <div class="col-sm-12 col-sm-12 col-lg-6 col-lg-6">
               <h5>Receipients</h5>
                <div class="col-8 col-sm-6 col-lg-12 col-lg-12 border border-secondary" style="border-radius:5px;">


                    <asp:Table ID="tblStudentEmail" runat="server" CssClass="table table-striped" style="margin-top:10px">
                        <asp:TableHeaderRow style="background-color:#B21125;color:white;">
                            <asp:TableHeaderCell Scope="Column">
                                Student Name
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                Email
                            </asp:TableHeaderCell>
                        </asp:TableHeaderRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Lara Nelson
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                Laran@temple.edu
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Salim Nash
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                Salimn@temple.edu
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Farzana Cherry
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                FarzanaC@temple.edu
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Raymond Derrick
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                RaymondD@temple.edu
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Alyssa Jefferson
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                AlyssaJ@temple.edu
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Bryn Robin
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                BrynR@temple.edu
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Annika Armstrong
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                AnnikaA@temple.edu
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Bryce Wilder
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                BryceW@temple.edu
                            </asp:TableCell>
                        </asp:TableRow>

                    </asp:Table>

                </div>
            </div>

            <div class="col-sm-12 col-sm-12 col-md-6 col-lg-6 ">
                <h5>Write Email</h5>
                <div class="border border-secondary" style="border-radius:5px;">

                  <div class="col-8 col-sm-6 col-lg-12 col-lg-12" style="margin-top:2%;">
                    <asp:label ID="lblSubject" runat="server" CssClass="col-form-label-lg">Subject</asp:label>                  
                    <asp:TextBox ID="txtEmailSubject" runat="server" CssClass="form-control" placeholder="Enter your subject here"></asp:TextBox>
                  </div>

                  <div class="col-8 col-sm-6 col-lg-12 col-lg-12">
                    <asp:label ID="lblBody" runat="server" CssClass="col-form-label-lg">Body</asp:label>
<%--                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="12" placeholder="Enter your email here"></textarea>   --%>
                    <asp:TextBox ID="txtEmailBody" runat="server" CssClass="form-control" placeholder="Enter your email here" TextMode="MultiLine" Rows="12" ></asp:TextBox>
                  </div>
                    <button id="btnSend" type="submit" class="btn mb-2" style="margin-top:5%;margin-bottom:5%;margin-left:45%;background-color:#B21125;color:white" >Send</button>
                </div>

            </div>
        </div>       
    </div>
</asp:Content>
