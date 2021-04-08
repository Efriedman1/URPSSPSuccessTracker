<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="UploadUsers.aspx.cs" Inherits="URPSSPSuccessTracker.secure.UploadUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="d-flex justify-content-between" style="margin-top: 2%">
        <div>
            <h2>Upload Student Research Information</h2>
        </div>

        <!-- Button trigger modal -->
        <button type="button" class="button infobtn" data-toggle="modal" data-target="#instructionsModal">Instructions</button>
    </div>

        <asp:HiddenField runat="server" ID="hidden" />
        <!-- Modal -->
        <div class="modal fade" id="instructionsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="instructionsModalLabel">Instructions</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        You may search by any combination of first name, last name, major, student term, TUID,
                        and status. Select no parameters to view all profiles. Select the 'Student' or 'Principal Investigator' button to view Student or Principal Investigator profiles.
                        Below the search results table, you will find several buttons. Use "Export" to export these students to a spreadsheet,
                        Use "Email Selected" to email the students you selected on the table using the checkboxes. Use "Email All" to send an
                        Email to all students in the table.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container" style="max-width: 100% !important; padding-left: 0px !important; padding-right: 0px !important;">
            <div class="row row-eq-height" style="height: 100% !important">
                <!--Single User Upload -->
                <div class="col">
                    <fieldset class="scheduler-border" style="height: 100% !important">
                    <legend class="scheduler-border">Individual User Upload</legend>
                     <!--Row 1-->
                    <div class="row">
                        <div class="col">
                            <div class="md-form mb-2">
                                <label for="name" class="">Student TUID</label>
                                <input type="text" id="studentTUID" name="studentTUID" class="form-control">                           
                            </div>
                        </div>
                        <div class="col">
                            <div class="md-form mb-2">
                                <label for="name" class="">Principal Investigator TUID</label>
                                <input type="text" id="piTUID" name="piTUID" class="form-control">                           
                            </div>
                        </div>
                    </div>
                    <!--Row 2-->
                    <div class="row">
                        <div class="col">
                            <div class="md-form mb-2">
                                <label for="name" class="">Student Program</label>
                                <input type="text" id="studentProgram" name="studentProgram" class="form-control">                           
                            </div>
                        </div>
                        <div class="col">
                            <div class="md-form mb-2">
                                <label for="name" class="">Student Grad Date</label>
                                <input type="text" id="gradDate" name="gradDate" class="form-control">                           
                            </div>
                        </div>
                        <div class="col">
                            <div class="md-form mb-2">
                                <label for="name" class="">PI Department</label>
                                <input type="text" id="piDepartment" name="piDepartment" class="form-control">                           
                            </div>
                        </div>
                    </div>               
                    <!--Row 3-->
                    <div class="row">
                        <div class="col">
                            <div class="md-form mb-2">
                                <label for="name" class="">Research Project Title</label>
                                <input type="text" id="projectTitle" name="projectTitle" class="form-control">                           
                            </div>
                        </div>
                    </div>
                    <!--Row 4-->
                    <div class="row">
                    <div class="col">
                            <div class="md-form mb-2">
                                <label for="name" class="">Research Project Description</label>
                                <input type="text" id="projectDescription" name="projectDescription" class="form-control">                           
                            </div>
                        </div>
                    </div>
                    <!-- Upload btn -->
                    <div class="row">
                        <div class="col">
                            <div class="d-flex justify-content-center mt-2">
                                <asp:Button  class="btn redbtn p-2 mr-3 ml-3 " ID="Button1" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                                <asp:Label ID="Label1" runat="server" Text="Error" Visible="False"></asp:Label>
                            </div>
                        </div>
                    </div>
                    </fieldset>
                </div>
                
                <!--Mass User Upload -->
                <div class="col">
                    <fieldset class="scheduler-border" style="height: 100% !important">
                    <legend class="scheduler-border">Mass User Upload</legend>       
                <div class="col" style="margin-bottom:auto; margin-top: auto;">
                    <!-- Template -->
                         <div class="row">
                             <div class="col" style="padding-bottom: 15px;">
                                 <div class="d-flex flex-row mt-2" style="justify-content: center;">
                                     <label for="name" class="" style="margin-bottom: auto; margin-top: auto;"><h5>Template: </h5></label>
                                     <asp:LinkButton CssClass="btn redbtn p-2 mr-3 ml-3" ID="btnDownload" runat="server" OnClick="btnDownload_Click">Download</asp:LinkButton>
                                 </div>
                             </div>
                         </div>

                    <!-- Choose File -->
                    <div class="row">
                        <div class="col">
                            <div class="d-flex justify-content-center mt-2" >
                                <asp:FileUpload class="p-2 mr-3 ml-3" style="border: 1px solid lightgray; border-radius: 4px;" ID="fileUploadTemplate" runat="server" />                               
                            </div>
                        </div>
                    </div>
                  
                   <!-- Error Validator -->
                    <div class="row">
                        <div class="col">
                            <div class="d-flex justify-content-center mt-2">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Only .xls format is allowed" ControlToValidate="fileUploadTemplate" ValidationExpression="^.*\.(xls|xlsx|csv)$"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>

                    <!-- Upload btn -->
                    <div class="row">
                        <div class="col">
                            <div class="d-flex justify-content-center mt-2">
                                <asp:Button  class="btn redbtn p-2 mr-3 ml-3 " ID="Button2" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                                <asp:Label ID="Label2" runat="server" Text="Error" Visible="False"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
       
                </fieldset>
                </div>
            </div>
        </div>

</asp:Content>
