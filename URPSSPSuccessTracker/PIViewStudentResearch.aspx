<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PIViewStudentResearch.aspx.cs" Inherits="URPSSPSuccessTracker.PIViewResearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" href="master.css" />
    <div class ="container">
<!--Section: Contact v.2-->
<section class="mb-4">
    
    <h2>Student Research</h2>
    <!--Section heading-->
   <div class="row">

       <div class="col-md-8">
           <h2 class="h1-responsive text-left my-4"><b>John Doe</b> 915 112 112</h2>
       </div>
       <div class="col-md-4 float-right ">
            <asp:Label CssClass="termLabel" ID="lblTerm" runat="server" Text="Term: "></asp:Label>
            <asp:DropDownList  CssClass="mydropdownlist1 align-self-center" ID="ddTerm" runat="server">
                              <asp:ListItem Selected="True">Fall 2020</asp:ListItem>
                              <asp:ListItem>Spring 2020</asp:ListItem>
                              <asp:ListItem>Fall 2019</asp:ListItem>
           </asp:DropDownList>
       </div>
   </div>
    
           
    <div class="row">

        <!--Grid column-->
        <div class="col-md-7 mb-md-0 mb-5 h4">


                <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <asp:Label ID="lblPI" CssClass="control-label" runat="server" Text="Principal Investigator" Enabled="False"></asp:Label>
<%--                            <label for="name" class="">Principal Investigator</label>--%>
                            <asp:TextBox ID="txtName" CssClass="form-control input-lg" runat="server" Enabled="False">Bill Perkins</asp:TextBox>
                            <%--<input type="text" id="name" name="name" class="form-control">--%>
                            
                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6" >
                        <div class="md-form mb-0">
                            <asp:Label ID="lblPIEmail" CssClass="control-label" runat="server" Text="Principal Investigator's Email"></asp:Label>
                           <%-- <label for="date" class="">Principal Investigator's Email</label>--%>
                            <asp:TextBox ID="txtEmail" CssClass="form-control input-lg" runat="server" Enabled="False">billperkins@temple.edu</asp:TextBox>
                           <%-- <input type="text" id="email" name="date" class="form-control">--%>
                 
                        </div>
                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->

                <!--Grid row-->
                <div class="row">
                    <div class="col-md-12" style="padding-top:20px;">
                        <div class="md-form mb-0">
                            <asp:Label ID="lblDept" CssClass="control-label" runat="server" Text="Principal Investigator's Department"></asp:Label>
                            <%--<label for="subject" class="">Principal Investigator's Department</label>--%>
                            <asp:TextBox ID="txtDept" CssClass="form-control input-lg" runat="server" Enabled="False">Chemistry</asp:TextBox>
                            <%--<input type="text" id="subject" name="subject" class="form-control">--%>
                            
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
                            <%--<label for="title" class="">Title</label>--%>
                            <asp:TextBox ID="txtTitle" CssClass="form-control input-lg" runat="server" Enabled="False">UV Photolysis</asp:TextBox>
                            <%--<input type="text" id="title" name="title" class="form-control">--%>
                            
                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6" >
                        <div class="md-form mb-0">
                            <asp:Label ID="lblType" CssClass="control-label" runat="server" Text="Resesarch Type"></asp:Label>
                            <%--<label for="type" class="">Research Type</label>--%>
                            <asp:TextBox ID="txtType" CssClass="form-control input-lg" runat="server" Enabled="False">URP</asp:TextBox>
                            <%--<input type="text" id="type" name="type" class="form-control">--%>
                 
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
                           <%-- <label for="status" class="">Status</label>--%>
                            <asp:TextBox ID="txtStatus" CssClass="form-control input-lg" runat="server" Enabled="False">Concluded</asp:TextBox>
                           <%-- <input type="text" id="status" name="status" class="form-control">--%>
                            
                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6" >
                        <div class="md-form mb-0">
                            <asp:Label ID="lblMethod" CssClass="control-label" runat="server" Text="Research Method"></asp:Label>
                            <%--<label for="method" class="">Research Method</label>--%>
                            <asp:TextBox ID="txtMethod" CssClass="textbox form-control input-lg" runat="server" Enabled="False">Experimentation</asp:TextBox>
                            <%--<input type="text" id="method" name="method" class="form-control">--%>
                 
                        </div>
                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->

                <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-12" style="padding-top:20px;">

                        <div class="md-form">
                            <asp:Label ID="lblUser" CssClass="control-label" runat="server" Text="Link(s)"></asp:Label>
                            <%--<label for="links">Link(s)</label>--%>
                            <textarea id="links" name="links" rows="2" class="form-control md-textarea" disabled="disabled">https://www.chemistry-conferences.com/
https://www.acs.org/content/acs/en/meetings.html</textarea>
                            
                        </div>

                    </div>
                </div>
                <!--Grid row-->
           
              <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-12" style="padding-top:20px;">

                        <div class="md-form">
                            <asp:Label ID="Label1" CssClass="control-label" runat="server" Text="Journal"></asp:Label>
                            <%--<label for="Journal">Journal</label>--%>
                            <textarea id="Journal" name="Journal" rows="2" class="form-control md-textarea" disabled="disabled">Journal of Physical Chemistry A</textarea>
                            
                        </div>

                    </div>
                </div>
                <!--Grid row-->
           
                          <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-12" style="padding-top:20px;">

                        <div class="md-form">
                            <asp:Label ID="Label2" CssClass="control-label" runat="server" Text="Conference Information"></asp:Label>
                            <%--<label for="info">Conference Information</label>--%>
                            <textarea id="info" name="info" rows="2" class="form-control md-textarea" disabled="disabled">-Undergraduate Computational Chemistry Symposium
                            -Theoretical Analysis of the UV Photolysis</textarea>
                            
                        </div>

                    </div>
                </div>
                <!--Grid row-->
          
                          <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-12" style="padding-top:20px;">

                        <div class="md-form">
                            <asp:Label ID="Label3" runat="server" Text="Description"></asp:Label>
                           <%-- <label for="description">Description</label>--%>
                            <textarea id="description" name="description" rows="2" class="form-control md-textarea" disabled="disabled">This is a brief description of my research. This field is optional.</textarea>
                            
                        </div>

                    </div>
                </div>
                <!--Grid row-->
            <div class="row" style="justify-content: center !important;">
                <div class="col p-3 btn-toolbar m-4" style="justify-content: center !important;">
                    <asp:Button class="btn redbtn text-lg-center btnSize" ID="btnEdit" runat="server" Text="Edit" />
                    <asp:Button class="btn redbtn text-lg-center btnSize" ID="btnSave" runat="server" Text="Save" />
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
                    <p class="">Hello this is a test comment.</p> <span class="date sub-text">on November 15th, 2020</span>

                </div>
            </li>
            <li>
                <div class="commenterImage">
                  <img src="http://placekitten.com/45/45" />
                </div>

                <div class="commentText">
                    <h4>Bill Perkins</h4>
                    <p class="">Hello this is a test comment and this comment is particularly very long and it goes on and on and on.</p> <span class="date sub-text">on November 15th, 2020</span>
                </div>
            </li>
            <li>
                <div class="commenterImage">
                  <img src="http://placekitten.com/40/40" />
                </div>
                <div class="commentText">
                    <h4>Bill Perkins</h4>
                    <p class="">Hello this is a test comment.</p> <span class="date sub-text">on November 15th, 2020</span>

                </div>
            </li>
        </ul>
        
            <div class="form-group ">
 
                   <p><asp:TextBox ID="tbComment" runat="server" class="form-control my-2 my-sm-0" Width="450px" TextMode="MultiLine"></asp:TextBox></p>
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
