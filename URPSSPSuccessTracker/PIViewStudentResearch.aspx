<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PIViewStudentResearch.aspx.cs" Inherits="URPSSPSuccessTracker.PIViewResearch" %>

<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="master.css" />
    <div class="container">
        <!--Section: Contact v.2-->
        <section class="mb-2">
            <div class="d-flex justify-content-between mt-3 mb-4">
                <h2>Student Research information</h2>
                <div class="row">
                    <label>Term: </label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                        <asp:ListItem Selected="True">FALL 2019</asp:ListItem>
                        <asp:ListItem>SPRING 2020</asp:ListItem>
                        <asp:ListItem>FALL 2019</asp:ListItem>
                        <asp:ListItem>SPRING 2019</asp:ListItem>
                        <asp:ListItem>FALL 2018</asp:ListItem>
                        <asp:ListItem>SPRING 2018</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <!--Section heading-->
            <div class="row">

                <div class="col-md-8">
                    <h3 class="h3-responsive text-left"><b>John Doe</b> 915 112 112</h3>
                    <asp:Label runat="server" ID="lblTerm" Text="FALL 2019" CssClass="h3 mb-4"></asp:Label>
                </div>
                <div class="col-md-4 float-right ">
                </div>
            </div>

            <div class="row mt-3">

                <!--Grid column-->
                <div class="col-md-7 mb-md-0 mb-5 h4">


                    <!--Grid row-->
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
                    </div>
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
                                <asp:Label ID="lblType" CssClass="control-label" runat="server" Text="Research Type"></asp:Label>

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

                    <!--Grid row-->
                    <div class="row">

                        <!--Grid column-->
                        <div class="col-md-12" style="padding-top: 20px;">

                            <div class="md-form">
                                <asp:Label ID="lblUser" CssClass="control-label" runat="server" Text="Link(s)"></asp:Label>
                                <%--<label for="links">Link(s)</label>--%>
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
                                <%--<label for="Journal">Journal</label>--%>
                                <asp:TextBox ID="txtJournal" CssClass="textbox form-control input-lg" runat="server" Enabled="False" TextMode="MultiLine">Journal of Physical Chemistry A</asp:TextBox>
                                <%--<textarea id="Journal" name="Journal" rows="2" class="form-control md-textarea" disabled="disabled">Journal of Physical Chemistry A</textarea>--%>
                            </div>
                            <asp:Button ID="btnAddJournal" runat="server" CssClass="btn btn-light" Text="Add +" />

                        </div>
                    </div>
                    <!--Grid row-->

                    <!--Grid row-->
                    <div class="row">

                        <!--Grid column-->
                        <div class="col-md-12" style="padding-top: 20px;">

                            <div class="md-form">
                                <asp:Label ID="Label2" CssClass="control-label" runat="server" Text="Conference Information"></asp:Label>
                                <%--<label for="info">Conference Information</label>--%>
                                <asp:TextBox ID="txtInfo" CssClass="textbox form-control input-lg" runat="server" Enabled="False" TextMode="MultiLine">Undergraduate Computational Chemistry Symposium</asp:TextBox>
                                <%--<textarea id="info" name="info" rows="2" class="form-control md-textarea" disabled="disabled">Undergraduate Computational Chemistry Symposium</textarea>--%>
                            </div>
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-light" Text="Add +" />
                        </div>
                    </div>
                    <!--Grid row-->

                    <!--Grid row-->
                    <div class="row">

                        <!--Grid column-->
                        <div class="col-md-12" style="padding-top: 20px;">

                            <div class="md-form">
                                <asp:Label ID="Label3" runat="server" Text="Description"></asp:Label>
                                <%-- <label for="description">Description</label>--%>
                                <asp:TextBox ID="txtDescription" CssClass="textbox form-control input-lg" runat="server" Enabled="False" TextMode="MultiLine">This is a brief description of my research. This field is optional.</asp:TextBox>
                                <%-- <textarea id="description" name="description" rows="2" class="form-control md-textarea" disabled="disabled">This is a brief description of my research. This field is optional.</textarea>--%>
                            </div>
                            <asp:Button ID="Button2" runat="server" CssClass="btn btn-light" Text="Add +" />

                        </div>
                    </div>
                    <!--Grid row-->
                    <div class="row" style="justify-content: center !important;">
                        <div class="col p-3 btn-toolbar m-4" style="justify-content: center !important;">
                            <asp:Button class="btn redbtn text-lg-center btnSize" ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" />
                            <asp:Button class="btn redbtn text-lg-center btnSize" ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                        </div>
                    </div>
                    <div class="status"></div>
                </div>
                <!--Grid column-->

                <!--Grid column Comments-->
                <div class="col-md-5 text-left h4">
                    <div class="detailBox">
                        <div class="titleBox">
                            <asp:Label ID="lblComments" runat="server" Text="Comments" class="mr-md-2" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                            <%-- <asp:Button ID="btnHome" runat="server" Text="Home" class="btn btn-outline-warning my-2 my-sm-0" />--%>
                        </div>

                        <div class="actionBox">
                            <ul class="commentList">
                                <li>
                                    <div class="commenterImage">
                                        <img src="http://placekitten.com/50/50" />
                                    </div>
                                    <div class="commentText">
                                        <h4>Bill Perkins</h4>
                                        <p class="">Hello this is a test comment.</p>
                                        <span class="date sub-text">on November 15th, 2020</span>

                                    </div>
                                </li>
                                <li>
                                    <div class="commenterImage">
                                        <img src="http://placekitten.com/45/45" />
                                    </div>

                                    <div class="commentText">
                                        <h4>Bill Perkins</h4>
                                        <p class="">Hello this is a test comment and this comment is particularly very long and it goes on and on and on.</p>
                                        <span class="date sub-text">on November 15th, 2020</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="commenterImage">
                                        <img src="http://placekitten.com/40/40" />
                                    </div>
                                    <div class="commentText">
                                        <h4>Bill Perkins</h4>
                                        <p class="">Hello this is a test comment.</p>
                                        <span class="date sub-text">on November 15th, 2020</span>

                                    </div>
                                </li>
                            </ul>

                            <div class="form-group ">

                                <p>
                                    <asp:TextBox ID="tbComment" runat="server" class="form-control my-2 my-sm-0" Width="450px" TextMode="MultiLine"></asp:TextBox>
                                </p>
                            </div>
                            <div class="form-group text-center">
                                <asp:Button ID="btnComment" runat="server" Text="Add Comment" class="btn redbtn my-2 my-sm-0 btnSize" />
                            </div>

                        </div>
                    </div>
                </div>
                <!--Grid column-->

            </div>

        </section>
    </div>
</asp:Content>
