<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PIViewStudentResearch.aspx.cs" Inherits="URPSSPSuccessTracker.PIViewResearch" MaintainScrollPositionOnPostBack="true" %>

<%@ MasterType VirtualPath="~/Master.Master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="master.css" />

    <style>
        .repeater_scroll{
            overflow: auto;
            max-height:535px;
        }

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
    </style>

    <div class="container-fluid">
        <!--Section: Contact v.2-->
        <section class="mb-4">
            <div class="d-flex justify-content-between mt-3">
                <h2>Student Research Information</h2>
            </div>
            <!--Section heading-->
			<div class="row">
                <div class="col-md-8">
                    <h2 class="h2-responsive text-left my-4"><b>
                        <asp:Label ID="lblStudentName" runat="server" Text="John Doe"></asp:Label></b> <asp:Label ID="lblStudentTUID" runat="server" Text="915112112"></asp:Label> </h2>
                </div>
                <div class="col-2 ">
                    <asp:Label ID="lblStudentEmail" runat="server" Text="johndoe@temple.edu"></asp:Label>                  
                </div>
            </div>

            <div class="row">
            <div class="col-6">
                <!--Grid column-->
                <div class="col-md-12 mb-md-0 mb-5 h4">

                    <!--Begin of Principal Investigator Profile-->
                    <!--Grid row-->
                    <fieldset class="scheduler-border">
                        <legend class="scheduler-border">Principal Investigator's Information</legend>
                        <div class="row">

                            <!--Grid column-->
                            <div class="col-md-12">
                                <div class="md-form mb-0">
                                    <asp:Label ID="lblPI" CssClass="control-label" runat="server" Text="Principal Investigator" Enabled="False"></asp:Label>
                                    <asp:TextBox ID="txtName" CssClass="form-control input-lg" runat="server" Enabled="False">Bill Perkins</asp:TextBox>
                                </div>
                            </div>
                            <!--Grid column-->

                            <!--Grid column-->
                            <div class="col-md-12">
                                <div class="md-form mb-0" style="padding-top: 20px;">
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

                    <!--Grid row-->



                    <div class="row">

                        <!--Grid column-->
                        <div class="col-md-12">
                            <div class="md-form mb-0">
                                <asp:Label ID="lblTitle" CssClass="control-label" runat="server" Text="Title"></asp:Label>
                                <asp:TextBox ID="txtTitle" CssClass="form-control input-lg" runat="server" Enabled="False">Medical Genetics and Molecular Biochemistry</asp:TextBox>
                            </div>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-md-12">
                            <div class="md-form mb-0">
                                <asp:Label ID="lblDesc" runat="server" CssClass="control-label">Description:</asp:Label>
                                <asp:TextBox ID="TxtDesc" runat="server" CssClass="form-control input-lg" Width="100%" TextMode="MultiLine" Enabled="False" Rows="5"></asp:TextBox>
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
                                <asp:Label ID="lblType" CssClass="control-label" runat="server" Text="Resesarch Type"></asp:Label>
                                <asp:TextBox ID="txtType" CssClass="form-control input-lg" runat="server" Enabled="False">URP</asp:TextBox>
                            </div>
                        </div>
                        <!--Grid column-->


                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-0">
                                <asp:Label ID="lblStatus" CssClass="control-label" runat="server" Text="Status"></asp:Label>
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="dropdown-toggle form-control input-lg" Width="100%" >
                                    <asp:ListItem Selected="true" Value="" disabled="disabled">Select the Status</asp:ListItem>
                                    <asp:ListItem Value="In-Progress">In-Progress</asp:ListItem>
                                    <asp:ListItem Value="Complete">Complete</asp:ListItem>
                                    
                                </asp:DropDownList>

                            </div>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-0">
                                <asp:Label ID="lblMethod" CssClass="control-label" runat="server" Text="Research Method"></asp:Label>
                                <asp:DropDownList ID="ddlResearchMethod" runat="server" CssClass="dropdown-toggle form-control input-lg" Width="100%" >
                                    <asp:ListItem Selected="true" Value="" disabled="disabled">Select Research Method</asp:ListItem>
                                    <asp:ListItem Value="Remote">Remote</asp:ListItem>
                                    <asp:ListItem Value="In-Person">In-Person</asp:ListItem>
                                </asp:DropDownList>

                            </div>
                        </div>
                        <!--Grid column-->


                    </div>

                    <div class="row">    
                        <div class="col  btn-toolbar m-3" style="justify-content: center !important;"">
                             <asp:Button class="btn redbtn text-lg-center btnSize" ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" style="width:100px"/>
                             <asp:Button class="btn redbtn text-lg-center btnSize" ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" style="width:100px"/>
                        </div>

                    </div>

                    <!--Grid row-->

                    <br />
              
                </div>
                
            </div>
                    
               


                <!-- Comment Section -->
                <div class="col-5 text-left h4">
                    <div class="titleBox">
                        <asp:Label ID="lblComments" runat="server" Text="Comments" class="mr-md-2" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                    </div>
                    <div class="detailBox table_scroll">
                        <div class="actionBox">
                            <asp:ScriptManager ID="smComments" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel runat="server" ID="upnlComments" CssClass="commentList" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <!--Comments will be inserted here-->
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnComment" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>

                    </div>

                    <div class="col-12 form-group" style="width:100%;" >
                        <asp:TextBox ID="tbComment" runat="server" class="form-control" TextMode="MultiLine" Rows="5" MaxLength="500" CssClass="mb-3 w-100 p-3"></asp:TextBox>
                   

                        <div class="form-group text-center">
                            <asp:Button ID="btnComment" runat="server" Text="Add Comment"  class="btn redbtn my-2 my-sm-0 btnSize" OnClick="btnComment_Click"  />
                        </div>
                        
                        <asp:Label runat="server" ID="lblCommentError" Text=""></asp:Label>
                    </div>

                </div>
                </div>
             
                <!--Grid column-->
                    
            
               <!-- Jquery Tabs -->

            <div class="row"">
                <div style="width:100%">


                <fieldset class="scheduler-border col-6" style="width: 48%; height: 350px; float: left;" >
                    <legend class="scheduler-border">Journals</legend>

                    <div class="row">
                        <div class="col-lg-12">
                              <asp:Button id="btnEditJournal" runat="server" Text="Edit" CssClass="btn redbtn float-right" OnClick="btnEditJournal_Click" style="width:100px"/>
                              <asp:Button id="btnSaveJournal" runat="server" Text="Save" CssClass="btn redbtn float-right" OnClick="btnSaveJournal_Click" style="width:100px"/>
                              <br />
                              <p>
                                
                                <asp:Repeater ID="RepeaterTabJournal" runat="server">
                                   
                                    <ItemTemplate>
                                            <ContentTemplate>
                                        <div id="tab_<%#Eval("ResearchID") %>" class="repeater_scroll">                                       
                                          <td><%# ((string)Eval ("Journal")).Replace(Environment.NewLine, "<br />") %></td>
                                        </div>
                                            </ContentTemplate>
                                    </ItemTemplate>
                                </asp:Repeater>                                                                              
                                <asp:Textbox id='txtEditJournal' runat="server" BorderStyle="None" Width="100%" TextMode="MultiLine" Rows="8" CssClass="repeater_scroll">   
                                </asp:Textbox>      
                    
                              </p>
                        </div>

                     </div>

                </fieldset>


                <fieldset class="scheduler-border col-6" style="margin-left: 50%; height: 350px; float:right;">
                    <legend class="scheduler-border">Conferences</legend>
                    <div class="row">
                        <div class="col-lg-12">
                                  <asp:Button id="btnEditConference" runat="server" Text="Edit" CssClass="btn redbtn float-right" OnClick="btnEditConference_Click" style="width:100px"/>
                                  <asp:Button id="btnSaveConference" runat="server" Text="Save" CssClass="btn redbtn float-right" OnClick="btnSaveConference_Click" style="width:100px"/>
                                  <br />
                                  <p>
                                    <asp:Repeater ID="RepeaterTabConference" runat="server">
                                    <ItemTemplate>
                                        <div id="tab_<%#Eval("ResearchID") %>" class="repeater_scroll">                                     
                                            <td><%# ((string)Eval ("Conference")).Replace(Environment.NewLine, "<br />") %></td>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                    <asp:Textbox id='txtEditConference' runat="server" BorderStyle="None" Width="100%" TextMode="MultiLine" Rows="8">
    
                                    </asp:Textbox>  
                                  </p>  
                        </div>
                    </div>


                </fieldset>
                    </div>
                </div>


                <div class="row">
                    <div style="width:100%">
                        
                    
                <fieldset class="scheduler-border col-6" style="width: 48%; height: 350px; float: left;">
                    <legend class="scheduler-border">Papers</legend>
                    <div class="row">
                        <div class="col-lg-12">
                                  <asp:Button id="btnEditPaper" runat="server" Text="Edit" CssClass="btn redbtn float-right" OnClick="btnEditPaper_Click" style="width:100px" />
                                  <asp:Button id="btnSavePaper" runat="server" Text="Save" CssClass="btn redbtn float-right" OnClick="btnSavePaper_Click" style="width:100px"/>
                                  <br />
                                  <p>
                                    <asp:Repeater ID="RepeaterTabPaper" runat="server">
                                        <ItemTemplate>
                                            <div id="tab_<%#Eval("ResearchID") %>" class="repeater_scroll">                                        
                                                 <td><%# ((string)Eval ("Paper")).Replace(Environment.NewLine, "<br />") %></td>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:Textbox id='txtEditPaper' runat="server" BorderStyle="None" Width="100%" TextMode="MultiLine" Rows="8">
    
                                    </asp:Textbox>  

                                  </p>  
                        </div>
                    </div>


                </fieldset>

            
                <fieldset class="scheduler-border col-6" style="margin-left: 50%; height: 350px; float:right;">
                    <legend class="scheduler-border">Links</legend>
                    <div class="row">
                        <div class="col-lg-12">
                                  <asp:Button id="btnEditLink" runat="server" Text="Edit" CssClass="btn redbtn float-right" OnClick="btnEditLink_Click" style="width:100px" />
                                  <asp:Button id="btnSaveLink" runat="server" Text="Save" CssClass="btn redbtn float-right" OnClick="btnSaveLink_Click" style="width:100px"/>
                                  <br />
                                  <p>
                                    <asp:Repeater ID="RepeaterTabLink" runat="server">
                                        <ItemTemplate>
                                            <div id="tab_<%#Eval("ResearchID") %>" class="repeater_scroll">                                           
                                                 <td><%# ((string)Eval ("Link")).Replace(Environment.NewLine, "<br />") %></td>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:Textbox id='txtEditLink' runat="server" BorderStyle="None" Width="100%" TextMode="MultiLine" Rows="8"> 
                                    </asp:Textbox>  
                                  </p>
                        </div>
                    </div>


                </fieldset>

            </div>
           </div>
            


   
             

          
   
        </section>
 </div>
</asp:Content>
