<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="UploadUsers.aspx.cs" Inherits="URPSSPSuccessTracker.secure.UploadUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
        $(function () {
            $('#gradDate').datepicker(
                {
                    dateFormat: "mm/yy",
                    changeMonth: true,
                    changeYear: true,
                    showButtonPanel: true,
                    onClose: function (dateText, inst) {


                        function isDonePressed() {
                            return ($('#ui-datepicker-div').html().indexOf('ui-datepicker-close ui-state-default ui-priority-primary ui-corner-all ui-state-hover') > -1);
                        }

                        if (isDonePressed()) {
                            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
                            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                            $(this).datepicker('setDate', new Date(year, month, 1)).trigger('change');

                            $('#gradDate').focusout()//Added to remove focus from datepicker input box on selecting date
                        }
                    },
                    beforeShow: function (input, inst) {

                        inst.dpDiv.addClass('month_year_datepicker')

                        if ((datestr = $(this).val()).length > 0) {
                            year = datestr.substring(datestr.length - 4, datestr.length);
                            month = datestr.substring(0, 2);
                            $(this).datepicker('option', 'defaultDate', new Date(year, month - 1, 1));
                            $(this).datepicker('setDate', new Date(year, month - 1, 1));
                            $(".ui-datepicker-calendar").hide();
                        }
                    }
                })
        });


    </script>

    <style>
        .ui-datepicker-calendar {
            display: none;
        }

        .required:after{
            content: " *";
            font-weight: bold;
            color: darkred;
        }
    </style>


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
                        <ul>
                            <li><div style="color:darkred">Begin by specifying your upload term in the upper left hand corner.</div></li>
                            <li>For <strong>Individual User Upload</strong> please fill out the form fields on the left hand side and click the 
                                'Upload' button beneath them when you're done.
                            </li>
                            <li>For <strong>Mass User Upload</strong> click the 'Download' button on the right hand side of the screen next to the 'Template' label. 
                                This will provide you with a formatted Excel document that will be used to enter each users information. Once you are done entering 
                                user information in the Excel sheet, save the sheet, click the 'Choose File' button, select the Excel file, then click the 'Upload' button on the right 
                                hand side.
                            </li>
                        </ul>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container" style="max-width: 100% !important; padding-left: 0px !important; padding-right: 0px !important;">
            <div class="row" style="height: 100% !important">
                <!--Single User Upload -->
                <div class="col">
                    <fieldset class="scheduler-border" style="height: 100% !important">
                    <legend class="scheduler-border">Individual User Upload</legend>
                     <!--Row 1-->
                    <div class="row">
                        <div class="col">
                            <div class="md-form mb-2">
                                <label for="name" class="required">Student TUID</label>
                                <input type="text" id="studentTUID" name="studentTUID" class="form-control required" required="required">                         
                            </div>
                        </div>
                        <div class="col">
                            <div class="md-form mb-2">
                                <label for="name" class="required">Principal Investigator TUID</label>
                                <input type="text" id="piTUID" name="piTUID" class="form-control" required="required">                           
                            </div>
                        </div>
                    </div>
                    <!--Row 2-->
                    <div class="row">
                        <div class="col">
                            <div class="md-form mb-2">
                                <label for="name" class="required">Student Program</label>
                                <input type="text" id="studentProgram" name="studentProgram" class="form-control" required="required">                           
                            </div>
                        </div>
                        <div class="col">
                            <div class="md-form mb-2">
                                <label for="name" class="required">Student Grad Date</label>
                                <input type="text" id="gradDate" name="gradDate" class="form-control" required="required">                           
                            </div>
                        </div>
                        <div class="col">
                            <div class="md-form mb-2">
                                <label for="name" class="required">PI Department</label>
                                <input type="text" id="piDepartment" name="piDepartment" class="form-control" required="required">                           
                            </div>
                        </div>
                    </div>               
                    <!--Row 3-->
                    <div class="row">
                        <div class="col">
                            <div class="md-form mb-2">
                                <label for="name" class="required">Research Project Title</label>
                                <input type="text" id="projectTitle" name="projectTitle" class="form-control" required="required">                           
                            </div>
                        </div>
                    </div>
                    <!--Row 4-->
                    <div class="row">
                    <div class="col">
                            <div class="md-form mb-2">
                                <label for="name" class="required">Research Project Description</label>
                                <input type="text" id="projectDescription" name="projectDescription" class="form-control" required="required">                           
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
                     
                    <!-- Template -->
                         <div class="row">
                             <div class="col" style="padding-bottom: 15px; margin-top: 75px;">
                                 <div class="d-flex flex-row mt-2" style="justify-content: center;">
                                     <label for="name" class="" style="margin-bottom: auto; margin-top: auto;">Upload Template: </label>
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

                </fieldset>
                </div>
            </div>
        </div>

</asp:Content>
