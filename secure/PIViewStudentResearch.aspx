<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PIViewStudentResearch.aspx.cs" Inherits="URPSSPSuccessTracker.PIViewResearch" MaintainScrollPositionOnPostBack="true" %>

<%@ MasterType VirtualPath="~/Master.Master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="master.css" />



    <script type="text/javascript">
        $(document).ready(function () {
            $('#tabs').tabs();
        });


        $(function () {
            $("#tabs").tabs({
                activate: function() {
                    var selectedTab = $('#tabs').tabs('option', 'active');
                    $("#<%= hdnSelectedTab.ClientID %>").val(selectedTab);
                },
                active: document.getElementById('<%= hdnSelectedTab.ClientID %>').value
            });
        });

      

        //TinyMCE WYSIWYG
        tinymce.init({
        selector: 'textarea#editor',
        menubar: false
        });

        tinymce.init({
            selector: 'textarea',
            toolbar_mode: 'floating',
            tinycomments_mode: 'embedded',
            tinycomments_author: 'Author name',
            menubar: 'insert  table tools'  // skip file
        });


    </script>




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
            <div class="col-md-2 md-offset-">
                <div class="row">
                
                    <label>Term: </label>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">
                        <asp:ListItem Selected="True">FALL 2020</asp:ListItem>
                        <asp:ListItem>SPRING 2020</asp:ListItem>
                        <asp:ListItem>FALL 2019</asp:ListItem>
                        <asp:ListItem>SPRING 2019</asp:ListItem>
                        <asp:ListItem>FALL 2018</asp:ListItem>
                        <asp:ListItem>SPRING 2018</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <h2 class="h2-responsive text-left my-4"><b>John Doe</b> 915112112 </h2>
                </div>
                <div class="col-2 ">
                    johndoe@temple.edu
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

                    <div class="col  btn-toolbar m-3" style="justify-content: center !important;"">
                         <asp:Button class="btn redbtn text-lg-center btnSize" ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" />
                            <asp:Button class="btn redbtn text-lg-center btnSize" ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    </div>


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
                                <asp:Label ID="lblModDocDesc" runat="server" CssClass="control-label">Description:</asp:Label>
                                <asp:TextBox ID="TxtModDocDesc" runat="server" CssClass="form-control input-lg" Width="100%" TextMode="MultiLine" Enabled="False" Rows="5"></asp:TextBox>
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
                </div>

                <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="0" />


                
            </div>
                    
               


                <!-- Comment Section -->
                <div class="col-5 text-left h4">
                    <div class="titleBox">
                        <asp:Label ID="lblComments" runat="server" Text="Comments" class="mr-md-2" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                        <%-- <asp:Button ID="btnHome" runat="server" Text="Home" class="btn btn-outline-warning my-2 my-sm-0" />--%>
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

                    <div class="col-12 form-group" >
                        <asp:TextBox ID="tbComment" runat="server" class="form-control" TextMode="MultiLine" Rows="5" MaxLength="500"></asp:TextBox>
                   

                        <div class="form-group text-center">
                            <asp:Button ID="btnComment" runat="server" Text="Add Comment" class="btn redbtn my-2 my-sm-0 btnSize" OnClick="btnComment_Click"  />
                        </div>
                        <asp:Label runat="server" ID="lblCharMax" Text="Characters: 0/500"></asp:Label>
                        <asp:Label runat="server" ID="lblCommentError" Text=""></asp:Label>
                    </div>

                </div>
                </div>
             
                <!--Grid column-->
                    

               <!-- Jquery Tabs -->

                <div class="row">
                    <div class="col-lg-12" style="padding-bottom:50px">
                        <div id="tabs" >
                          <ul>
                            <li>
                                <a href="#tab-Journal">
                                    Journal
                                </a>
                            </li>
                             <li>
                                 <a href="#tab-Conference">
                                    Conference
                                 </a>
                             </li>
                             <li>
                                 <a href="#tab-Paper">
                                    Paper
                                 </a>
                            </li>
                             <li>
                                 <a href="#tab-Link">
                                    Link
                                 </a>
                            </li>

                          </ul>
                        
                         
                          <asp:HiddenField ID="hdnJournalVariable" runat="server" />

                          <div id="tab-Journal" >
                              <asp:Button id="btnEditJournal" runat="server" Text="Edit" CssClass="btn redbtn float-right" OnClick="btnEditJournal_Click"/>
                              <asp:Button id="btnSaveJournal" runat="server" Text="Save" CssClass="btn redbtn float-right" OnClick="btnSaveJournal_Click"/>
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

                          <div id="tab-Conference" >
                              <asp:Button id="btnEditConference" runat="server" Text="Edit" CssClass="btn redbtn float-right" OnClick="btnEditConference_Click"/>
                              <asp:Button id="btnSaveConference" runat="server" Text="Save" CssClass="btn redbtn float-right" OnClick="btnSaveConference_Click" />
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


                          <div id="tab-Paper">
                              <asp:Button id="btnEditPaper" runat="server" Text="Edit" CssClass="btn redbtn float-right" OnClick="btnEditPaper_Click" />
                              <asp:Button id="btnSavePaper" runat="server" Text="Save" CssClass="btn redbtn float-right" OnClick="btnSavePaper_Click"/>
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

                          <div id="tab-Link" >
                              <asp:Button id="btnEditLink" runat="server" Text="Edit" CssClass="btn redbtn float-right" OnClick="btnEditLink_Click" />
                              <asp:Button id="btnSaveLink" runat="server" Text="Save" CssClass="btn redbtn float-right" OnClick="btnSaveLink_Click"/>
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
                    </div>
                    <!--Grid row-->
                </div>

             

          
   
        </section>
 </div>
</asp:Content>
