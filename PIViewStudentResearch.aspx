<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PIViewStudentResearch.aspx.cs" Inherits="URPSSPSuccessTracker.PIViewResearch" %>

<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="master.css" />

    <style>
        .table_scroll
        {
            overflow: auto;
            height: 535px;
            width: 800px;
            border-radius:5px;
        }
        fieldset.scheduler-border {
            border: 1px groove #ddd !important;
            border-radius:5px;
            padding: 0 1.4em 1.4em 1.4em !important;
            margin: 0 0 1.5em 0 !important;
            -webkit-box-shadow:  0px 0px 0px 0px #000;
            box-shadow:  0px 0px 0px 0px #000;
        }
        legend.scheduler-border {
            font-size: 1.2em !important;
            font-weight: bold !important;
            text-align: left !important;
            width:auto;
            padding:0 10px;
            border-bottom:none;
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
                    <%--<div class="row">

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
                                <asp:Label ID="lblPIEmail" CssClass="control-label" runat="server" Text="Principal Investigator's Email"></asp:Label>
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
                                <asp:Label ID="lblDept" CssClass="control-label" runat="server" Text="Principal Investigator's Department"></asp:Label>
                                <asp:TextBox ID="txtDept" CssClass="form-control input-lg" runat="server" Enabled="False">Chemistry</asp:TextBox>
                            </div>
                        </div>
                    </div>--%>

                    <!--End of Principal Investigator Profile-->
                    <!--Grid row-->
                    <br />
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

<%--                    <div class="row>">
                        <asp:Button class="btn redbtn text-lg-center btnSize" ID="BtnAdd" runat="server" Text="Add Documentation" OnClick="BtnAdd_Click" />
                    </div>--%>


                    <!--Grid row-->
                   <%-- <div class="row">

                        <!--Grid column-->
                        <div class="col-md-12" style="padding-top: 20px;">

                            <div class="md-form">
                                <asp:Label ID="lblUser" CssClass="control-label" runat="server" Text="Link(s)"></asp:Label>                                
                                <asp:TextBox ID="txtLinks" CssClass="form-control input-lg" runat="server" Enabled="False" TextMode="MultiLine">www.chemistry-conferences.com/</asp:TextBox>

                            </div>

                        </div>
                    </div>
                    <!--Grid row-->

                    <!--Grid row-->
                    <div class="row">

                        <!--Grid column-->
                        <div class="col-md-12" style="padding-top: 20px;">

                            <div class="md-form">
                                <asp:Label ID="Label1" CssClass="control-label" runat="server" Text="Journal"></asp:Label>
                                <asp:TextBox ID="txtJournal" CssClass="textbox form-control input-lg" runat="server" Enabled="False" TextMode="MultiLine">Journal of Physical Chemistry A</asp:TextBox>
                            </div>

                        </div>
                    </div>
                    <!--Grid row-->

                    <!--Grid row-->
                    <div class="row">

                        <!--Grid column-->
                        <div class="col-md-12" style="padding-top: 20px;">
                            <div class="md-form">
                                <asp:Label ID="Label2" CssClass="control-label" runat="server" Text="Conference Information"></asp:Label>                            
                                <asp:TextBox ID="txtInfo" CssClass="textbox form-control input-lg" runat="server" Enabled="False" TextMode="MultiLine">Undergraduate Computational Chemistry Symposium</asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <!--Grid row-->

                    <!--Grid row-->
                    <div class="row">

                        <!--Grid column-->
                        <div class="col-md-12" style="padding-top: 20px;">

                            <div class="md-form">
                                <asp:Label ID="Label3" runat="server" Text="Description"></asp:Label>                                
                                <asp:TextBox ID="txtDescription" CssClass="textbox form-control input-lg" runat="server" Enabled="False" TextMode="MultiLine">This is a brief description of my research. This field is optional.</asp:TextBox>
                            </div>

                        </div>
                    </div>--%>

                    <!--Grid row-->
                    <div class="row" style="justify-content: center !important;">
                        <div class="col p-3 btn-toolbar m-4" style="justify-content: center !important;">
<%--                            <asp:Button class="btn redbtn text-lg-center btnSize" ID="btnAdd" runat="server" Text="Add Documentation" data-target="addDocumentationModal" OnClick="btnAdd_Click"/>--%>

                    <div class="col-sm-12 col-sm-12">
                    <asp:Button ID="AddDocumentation" runat="server" Text="Add New Documentation" class="btn redbtn text-lg-center btnSize" data-toggle="modal" data-target="#AddDocumentation1" OnClientClick="return false" />
                    <div class="modal fade" id="AddDocumentation1" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">                        
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="ModalLabel">Add Documentation</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                
                                <div class="modal-body">
                                    <div class="row">
                                        <asp:DropDownList ID="ddlAddDoc" runat="server" CssClass="dropdown-toggle">
                                        <asp:ListItem Value="">Please select a document type</asp:ListItem>
                                        <asp:ListItem Value="Journal">Journal</asp:ListItem>
                                        <asp:ListItem Value="Conference">Conference</asp:ListItem>
                                        <asp:ListItem Value="Paper">Paper</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="row">
                                        <asp:Label ID="lblDocTitle" runat="server">Document Title:</asp:Label>
                                        <asp:TextBox ID="txtDocTitle" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="row">
                                        <asp:Label ID="lblDocDesc" runat="server">Description:</asp:Label>
                                        <asp:TextBox ID="TxtDocDesc" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                    </div>

                                    




                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                    <button type="button" class="btn redbtn" data-dismiss="modal">Confirm and Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                            <asp:Button class="btn redbtn text-lg-center btnSize" ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" />
                            <asp:Button class="btn redbtn text-lg-center btnSize" ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                        </div>
                    </div>
                    <div class="status"></div>
                </div>
                <!--Grid column-->

                <!--Grid column Comments-->

                <div class="col-md-5 text-left h4">
                    <div class="detailBox table_scroll">
                        <div class="titleBox">
                            <asp:Label ID="lblComments" runat="server" Text="Comments" class="mr-md-2" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            <%-- <asp:Button ID="btnHome" runat="server" Text="Home" class="btn btn-outline-warning my-2 my-sm-0" />--%>
                        </div>

                        <div class="actionBox">
                            <ul class="commentList">
                               <li>
<%--                                    <div class="commenterImage">
                                        <img src="http://placekitten.com/50/50" />
                                    </div>--%>
                                    <div class="commentText">
                                        <h4>Bill Perkins</h4>
                                        <p class="">Hello this is a test comment.</p>
                                        <span class="date sub-text">on November 15th, 2020</span>

                                    </div>
                                </li>
                                <li>
                                    <div class="commentText">
                                        <h4>Bill Perkins</h4>
                                        <p class="">Hello this is a test comment and this comment is particularly very long and it goes on and on and on.</p>
                                        <span class="date sub-text">on November 15th, 2020</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="commentText">
                                        <h4>Bill Perkins</h4>
                                        <p class="">Hello this is a test comment.</p>
                                        <span class="date sub-text">on November 15th, 2020</span>

                                    </div>
                                </li>
                                <li>
                                    <div class="commentText">
                                        <h4>Bill Perkins</h4>
                                        <p class="">Hello this is a test comment.</p>
                                        <span class="date sub-text">on November 15th, 2020</span>

                                    </div>
                                </li>
                                <li>
                                    <div class="commentText">
                                        <h4>Bill Perkins</h4>
                                        <p class="">Hello this is a test comment and this comment is particularly very long and it goes on and on and on.</p>
                                        <span class="date sub-text">on November 15th, 2020</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="commentText">
                                        <h4>Bill Perkins</h4>
                                        <p class="">Hello this is a test comment.</p>
                                        <span class="date sub-text">on November 15th, 2020</span>

                                    </div>
                                </li>
                                <li>
                                    <div class="commentText">
                                        <h4>Bill Perkins</h4>
                                        <p class="">Hello this is a test comment.</p>
                                        <span class="date sub-text">on November 15th, 2020</span>

                                    </div>
                                </li>
                                <li>
                                    <div class="commentText">
                                        <h4>Bill Perkins</h4>
                                        <p class="">Hello this is a test comment and this comment is particularly very long and it goes on and on and on.</p>
                                        <span class="date sub-text">on November 15th, 2020</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="commentText">
                                        <h4>Bill Perkins</h4>
                                        <p class="">Hello this is a test comment.</p>
                                        <span class="date sub-text">on November 15th, 2020</span>

                                    </div>
                                </li>
                            </ul>
                        </div>

                    </div>

                        <div class="form-group d-flex justify-content-center">                          
                            <asp:TextBox ID="tbComment" runat="server" class="form-control" Width="650px" TextMode="MultiLine" Rows="5"></asp:TextBox>                      
                        </div>

                        <div class="form-group text-center">
                            <asp:Button ID="btnComment" runat="server" Text="Add Comment" class="btn redbtn my-2 my-sm-0 btnSize" />
                        </div>
                </div>
                <!--Grid column-->

            </div>

        </section>
    </div>
</asp:Content>
