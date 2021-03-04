<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PIViewStudentResearch.aspx.cs" Inherits="URPSSPSuccessTracker.PIViewResearch" %>

<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="master.css" />

    <style>
        .table_scroll {
            overflow: auto;
            height: 535px;
            width: 800px;
            border-radius: 5px;
        }

        fieldset.scheduler-border {
            border: 1px groove #ddd !important;
            border-radius: 5px;
            padding: 0 1.4em 1.4em 1.4em !important;
            margin: 0 0 1.5em 0 !important;
            -webkit-box-shadow: 0px 0px 0px 0px #000;
            box-shadow: 0px 0px 0px 0px #000;
        }

        legend.scheduler-border {
            font-size: 1.2em !important;
            font-weight: bold !important;
            text-align: left !important;
            width: auto;
            padding: 0 10px;
            border-bottom: none;
        }


        .modal-header {
            padding: 2px 16px;
            background-color: #91182a;
            color: white;
        }

        .modal-body {
            padding: 2px 16px;
        }

        .modal-content {
            position: relative;
            background-color: #fefefe;
            margin: auto;
            padding: 2px;
            border: 1px solid #888;
            width: 100%;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
            animation-name: animatetop;
            animation-duration: 0.4s
        }

        .modal-footer {
            display: flex;
            justify-content: center;
        }
    </style>

    <div class="container">
        <!--Section: Contact v.2-->
        <section class="mb-4">
            <div class="d-flex justify-content-between mt-3">
                <h2>Student Research Information</h2>
            </div>
            <!--Section heading-->
            <div class="row">

                <div class="col-md-8">
                    <h2 class="h2-responsive text-left my-4"><b>John Doe</b> 915112112</h2>
                </div>
                <div class="col-md-4 float-right ">
                </div>
            </div>


            <div class="row">

                <!--Grid column-->
                <div class="col-md-7 mb-md-0 mb-5 h4">

                    <!--Begin of Principal Investigator Profile-->
                    <!--Grid row-->
                    <fieldset class="scheduler-border">
                        <legend class="scheduler-border">Principal Investigator's Information</legend>
                        <div class="row">

                            <!--Grid column-->
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                    <asp:Label ID="lblPI" CssClass="control-label" runat="server" Text="Principal Investigator" Enabled="False"></asp:Label>
                                    <asp:TextBox ID="txtName" CssClass="form-control input-lg" runat="server" Enabled="False">Bill Perkins</asp:TextBox>
                                </div>
                            </div>
                            <!--Grid column-->

                            <!--Grid column-->
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                    <asp:Label ID="lblPIEmail" CssClass="control-label" runat="server" Text="Email"></asp:Label>
                                    <asp:TextBox ID="txtEmail" CssClass="form-control input-lg" runat="server" Enabled="False">billperkins@temple.edu</asp:TextBox>
                                </div>
                            </div>
                            <!--Grid column-->

                        </div>
                        <!--Grid row-->

                        <!--Grid row-->
                        <div class="row">
                            <div class="col-md-12" style="padding-top: 20px;">
                                <div class="md-form mb-0">
                                    <asp:Label ID="lblDept" CssClass="control-label" runat="server" Text="Department"></asp:Label>
                                    <asp:TextBox ID="txtDept" CssClass="form-control input-lg" runat="server" Enabled="False">Chemistry</asp:TextBox>
                                </div>
                            </div>
                        </div>

                    </fieldset>
                    <!--End of Principal Investigator Profile-->

                    <!--Grid row-->

                    <br />
                    <!--Grid row-->
                    <div class="row">

                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-0">
                                <asp:Label ID="lblTitle" CssClass="control-label" runat="server" Text="Title"></asp:Label>
                                <asp:TextBox ID="txtTitle" CssClass="form-control input-lg" runat="server" Enabled="False">UV Photolysis</asp:TextBox>
                            </div>
                        </div>
                        <!--Grid column-->
                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-0">
                                <asp:Label ID="lblType" CssClass="control-label" runat="server" Text="Resesarch Type"></asp:Label>
                                <asp:TextBox ID="txtType" CssClass="form-control input-lg" runat="server" Enabled="False">URP</asp:TextBox>
                            </div>
                        </div>
                        <!--Grid column-->

                    </div>
                    <!--Grid row-->
                    <br />
                    <!--Grid row-->
                    <div class="row">

                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-0">
                                <asp:Label ID="lblStatus" CssClass="control-label" runat="server" Text="Status"></asp:Label>
                                <asp:TextBox ID="txtStatus" CssClass="form-control input-lg" runat="server" Enabled="False">Concluded</asp:TextBox>


                            </div>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-0">
                                <asp:Label ID="lblMethod" CssClass="control-label" runat="server" Text="Research Method"></asp:Label>

                                <asp:TextBox ID="txtMethod" CssClass="textbox form-control input-lg" runat="server" Enabled="False">Experimentation</asp:TextBox>

                            </div>
                        </div>
                        <!--Grid column-->

                    </div>
                    <!--Grid row-->

                    <br />

                    <asp:Panel ID="pnlResearchDocument" runat="server">

                        <%--                        <div class="row">

                            <!--Grid column-->
                            <div class="col-md-12">
                                <div class="md-form mb-0">
                                    <asp:Label ID="lblDocTitle" CssClass="control-label" runat="server" Text="Title"></asp:Label>
                                    <asp:TextBox ID="txtDocTitle" CssClass="form-control input-lg" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                            <!--Grid column-->
                        </div>
                        <div class="row">
                            <!--Grid column-->
                            <div class="col-md-12">
                                <div class="md-form mb-0">
                                    <asp:Label ID="lblDocDescrip" CssClass="control-label" runat="server" Text="Journal Description"></asp:Label>
                                    <asp:TextBox ID="txtDocDescrip" CssClass="textbox form-control input-lg" runat="server" Enabled="False" TextMode="MultiLine" Rows="5"></asp:TextBox>

                                </div>
                            </div>
                            <!--Grid column-->
                        </div>
                        <!--Grid row-->--%>
                    </asp:Panel>



                    <div id="divTextBox" style="border-color: Background; border-width: thick;" runat="server"></div>






                    <!--Grid row-->
                    <div class="row" style="justify-content: center !important;">
                        <div class="col  btn-toolbar m-3" style="justify-content: center !important;">
                            <asp:Button ID="AddDocumentation" runat="server" Text="Add New Documentation" class="btn redbtn text-lg-center btnSize" data-toggle="modal" data-target="#AddDocumentation1" OnClientClick="return false" />
                            <div class="modal fade" id="AddDocumentation1" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header" style="width: 100%">
                                            <h3 class="modal-title" id="ModalLabel">Add Documentation</h3>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>

                                        <div class="modal-body" style="padding: 10px 20px 10px 20px">
                                            <div class="row">
                                                <asp:Label ID="lblDocType" runat="server" CssClass="font-weight-bold">Document Type:</asp:Label>
                                            </div>

                                            <div class="row">
                                                <asp:DropDownList ID="ddlAddDoc" runat="server" CssClass="dropdown-toggle" Width="100%">

                                                    <asp:ListItem Selected="true" Value="" disabled="disabled">Please select a document type</asp:ListItem>
                                                    <asp:ListItem Value="Journal">Journal</asp:ListItem>
                                                    <asp:ListItem Value="Conference">Conference</asp:ListItem>
                                                    <asp:ListItem Value="Paper">Paper</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>

                                            <br />

                                            <div class="row">
                                                <asp:Label ID="lblModDocTitle" runat="server" CssClass="font-weight-bold">Document Title:</asp:Label>
                                            </div>
                                            <div class="row">
                                                <asp:TextBox ID="txtModDocTitle" runat="server" Width="100%" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                            </div>

                                            <br />

                                            <div class="row">
                                                <asp:Label ID="lblModDocDesc" runat="server" CssClass="font-weight-bold">Description:</asp:Label>
                                            </div>
                                            <div class="row">
                                                <asp:TextBox ID="TxtModDocDesc" runat="server" Width="100%" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" runat="server" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                            <%--                                    <button type="button" runat="server" class="btn redbtn" data-dismiss="modal" onclick="btnModAdd_Click">Confirm and Add</button>--%>
                                            <asp:Button CssClass="btn redbtn" runat="server" OnClick="btnModAdd_Click" Text="Confirm and Add" UseSubmitBehavior="false" data-dismiss="modal" />
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <asp:Button class="btn redbtn text-lg-center btnSize" ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" />
                            <asp:Button class="btn redbtn text-lg-center btnSize" ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                        </div>
                    </div>
                    <!--Grid row-->


                </div>
                <!--Grid column Comments-->

                <div class="col-md-5 text-left h4">
                    <div class="detailBox table_scroll">
                        <div class="titleBox">
                            <asp:Label ID="lblComments" runat="server" Text="Comments" class="mr-md-2" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            <%-- <asp:Button ID="btnHome" runat="server" Text="Home" class="btn btn-outline-warning my-2 my-sm-0" />--%>
                        </div>

                        <div class="actionBox">
                            <asp:Panel runat="server" ID="pnlComments" CssClass="commentList">
                                <!--Comments will be inserted here-->
                            </asp:Panel>
                        </div>

                    </div>

                    <div class="form-group d-flex justify-content-center">
                        <asp:TextBox ID="tbComment" runat="server" class="form-control" Width="650px" TextMode="MultiLine" Rows="5"></asp:TextBox>
                    </div>

                    <div class="form-group text-center">
                        <asp:Button ID="btnComment" runat="server" Text="Add Comment" class="btn redbtn my-2 my-sm-0 btnSize" OnClick="btnComment_Click" />
                    </div>
                </div>
                <!--Grid column-->
        </section>
    </div>
</asp:Content>
