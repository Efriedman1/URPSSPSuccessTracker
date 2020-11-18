<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PIViewStudentResearch.aspx.cs" Inherits="URPSSPSuccessTracker.PIViewResearch" %>
<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" href="master.css" />
    <div class ="container">
<!--Section: Contact v.2-->
<section class="mb-4">

    <!--Section heading-->
   
    <h2 class="h1-responsive text-left my-4"><b>John Doe</b> 915 112 112</h2>
           
    <div class="row">

        <!--Grid column-->
        <div class="col-md-9 mb-md-0 mb-5 h4">


                <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <label for="name" class="">Principal Investigator</label>
                            <input type="text" id="name" name="name" class="form-control">
                            
                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6" >
                        <div class="md-form mb-0">
                            <label for="date" class="">Principal Investigator's Email</label>
                            <input type="text" id="email" name="date" class="form-control">
                 
                        </div>
                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->

                <!--Grid row-->
                <div class="row">
                    <div class="col-md-12" style="padding-top:20px;">
                        <div class="md-form mb-0">
                            <label for="subject" class="">Principal Investigator's Department</label>
                            <input type="text" id="subject" name="subject" class="form-control">
                            
                        </div>
                    </div>
                </div>
                <!--Grid row-->
            <br /><br />
             <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form mb-0">
                            <label for="title" class="">Title</label>
                            <input type="text" id="title" name="title" class="form-control">
                            
                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6" >
                        <div class="md-form mb-0">
                            <label for="type" class="">Research Type</label>
                            <input type="text" id="type" name="type" class="form-control">
                 
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
                            <label for="status" class="">Status</label>
                            <input type="text" id="status" name="status" class="form-control">
                            
                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6" >
                        <div class="md-form mb-0">
                            <label for="method" class="">Research Method</label>
                            <input type="text" id="method" name="method" class="form-control">
                 
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
                            <label for="links">Link(s)</label>
                            <textarea id="links" name="links" rows="2" class="form-control md-textarea"></textarea>
                            
                        </div>

                    </div>
                </div>
                <!--Grid row-->
           
              <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-12" style="padding-top:20px;">

                        <div class="md-form">
                            <label for="Journal">Journal</label>
                            <textarea id="Journal" name="Journal" rows="2" class="form-control md-textarea"></textarea>
                            
                        </div>

                    </div>
                </div>
                <!--Grid row-->
           
                          <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-12" style="padding-top:20px;">

                        <div class="md-form">
                            <label for="info">Conference Information</label>
                            <textarea id="info" name="info" rows="2" class="form-control md-textarea"></textarea>
                            
                        </div>

                    </div>
                </div>
                <!--Grid row-->
          
                          <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-12" style="padding-top:20px;">

                        <div class="md-form">
                            <label for="description">Description</label>
                            <textarea id="description" name="description" rows="2" class="form-control md-textarea"></textarea>
                            
                        </div>

                    </div>
                </div>
                <!--Grid row-->
              <div class="text-center text-lg-left" style="padding-top:20px;">
                <a class="btn btn-outline-danger " style=" width: 150px !important;"><h4>Edit</h4></a>
            </div>
            <div class="text-center text-lg-left" style="padding-top:20px;">
                <a class="btn btn-danger "style=" width: 150px !important;"><h4>Save</h4></a>
            </div>
            <div class="status"></div>
        </div>
        <!--Grid column-->

        <!--Grid column Comments-->
        <div class="col-md-3 text-left h4">
            <div class="detailBox">
    <div class="titleBox">
      <asp:Label ID="lblComments" runat="server" Text="Comments" class="mr-sm-2" Font-Bold="True" Visible="true"></asp:Label>
        <%-- <asp:Button ID="btnHome" runat="server" Text="Home" class="btn btn-outline-warning my-2 my-sm-0" />--%>
    </div>

    <div class="actionBox">
        <ul class="commentList">
            <li>
                <div class="commenterImage">
                  <img src="http://placekitten.com/50/50" />
                </div>
                <div class="commentText">
                    <h5>Bill Perkins</h5>
                    <p class="">Hello this is a test comment.</p> <span class="date sub-text">on November 15th, 2020</span>

                </div>
            </li>
            <li>
                <div class="commenterImage">
                  <img src="http://placekitten.com/45/45" />
                </div>

                <div class="commentText">
                    <h5>Bill Perkins</h5>
                    <p class="">Hello this is a test comment and this comment is particularly very long and it goes on and on and on.</p> <span class="date sub-text">on November 15th, 2020</span>
                </div>
            </li>
            <li>
                <div class="commenterImage">
                  <img src="http://placekitten.com/40/40" />
                </div>
                <div class="commentText">
                    <h5>Bill Perkins</h5>
                    <p class="">Hello this is a test comment.</p> <span class="date sub-text">on November 15th, 2020</span>

                </div>
            </li>
        </ul>
        
            <div class="form-group">
                   <p><asp:TextBox ID="tbComment" runat="server" class="form-control my-2 my-sm-0" Width="287px"></asp:TextBox></p>
            </div>
            <div class="form-group">
             <asp:Button ID="btnComment" runat="server" Text="Add Comment" class="btn btn-outline-danger my-2 my-sm-0" />
            </div>
      
    </div>
</div>
        </div>
        <!--Grid column-->

    </div>

</section>
    </div>
</asp:Content>
