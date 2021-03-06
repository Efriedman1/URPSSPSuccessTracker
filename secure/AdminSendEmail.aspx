<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminSendEmail.aspx.cs" Inherits="URPSSPSuccessTracker.AdminSendEmail" ValidateRequest="false"%>
<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>    
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>   
        function emailPopup() {
            $('#modal1').modal("show");
        };

        function emailSent() {
            $('#emailSentModal').modal("show");
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
        


      //tinymce.init({
      //  selector: 'textarea#editor',
      //  menubar: false
      //});

      //  tinymce.init({
      //      selector: 'textarea',
      //      toolbar_mode: 'floating',
      //      tinycomments_mode: 'embedded',
      //      tinycomments_author: 'Author name',
      //      menubar: 'insert  table tools'  // skip file
      //  });
    </script>

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



    <div class="container" style="margin-top:2%">
        <div class="modal fade" role="dialog" id="modal1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <asp:Label Text="Are you sure you want to send this email?" runat="server"/>
                    </div>
                    <div class="modal-footer">
                        <asp:Button Text="Cancel" runat="server" id="btnCancel" CssClass="btn btn-danger" data-dismiss="modal" /> 
                        <asp:Button Text="Yes" runat="server" id="btnYes" CssClass="btn btn-success" OnClick="btnYes_Click"/>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal fade" role="dialog" id="emailSentModal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <asp:Label Text="Email was successfully sent!" runat="server" />
                    </div>
                    <div class="modal-footer">
                        <asp:Button Text="Close" runat="server" id="Button1" CssClass="btn btn-danger" data-dismiss="modal" /> 
                    </div>
                </div>
            </div>
        </div>

        <div class="page-header">
          <h2>Send Email</h2>
        </div>

        <div class="row"  >
            <div class="col-sm-12 col-sm-12 col-lg-5 col-lg-5 " >
                
                
                <fieldset class="scheduler-border col-8 col-sm-6 col-lg-12 col-lg-12 table_scroll" style="height:630px">
                    <legend class="scheduler-border">Receipients</legend>
                    <asp:GridView runat="server" id="gvStudents" OnRowDeleting="gvStudents_RowDeleting" AutoGenerateColumns="false"  CssClass="table table-borderless text-center table-striped" BorderStyle="None" HeaderStyle-BackColor="#91182a" HeaderStyle-ForeColor="White">
                    <Columns>
                        <asp:BoundField HeaderText ="First Name" DataField="FirstName"/>
                        <asp:BoundField HeaderText ="Last Name" DataField="LastName"/>
                        <asp:BoundField HeaderText ="Email" DataField="Email"/>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button Text="Remove" runat="server" CssClass="btn btn-danger" CommandName="Delete" /> 
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                    <asp:Button runat="server" CssClass="btn redbtn" ID="btnAddStudent" Text="Selected Students" OnClick="btnAddStudent_Click" style="margin-bottom:20px"/>
                 </fieldset>    

            </div>

            <div class="col-sm-12 col-sm-12 col-md-7 col-lg-7">
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Write Email</legend>


                  <div class="col-8 col-sm-6 col-lg-12 col-lg-12" >
                    <asp:label ID="lblSubject" runat="server" CssClass="col-form-label-lg">Subject</asp:label>                  
                    <asp:TextBox ID="txtEmailSubject" runat="server" CssClass="form-control" placeholder="Enter your subject here"></asp:TextBox>
                  </div>

                  <div class="col-8 col-sm-6 col-lg-12 col-lg-12">
                    <asp:label ID="lblBody" runat="server" CssClass="col-form-label-lg">Body</asp:label>
                    <asp:TextBox ID="txtEmailBody" runat="server" CssClass="form-control" placeholder="Enter your email here" TextMode="MultiLine" Rows="12" ></asp:TextBox>
                  </div>

<%--                  <div class="col-8 col-sm-6 col-lg-12 col-lg-12">
                    <asp:Label runat="server" ID="lblEmailSent" Visible="false" Text="Email Sent" Font-Size="Large"></asp:Label>
                  </div>
                  <div class="col-8 col-sm-6 col-lg-12 col-lg-12">
                    <asp:button  runat="server" ID="btnSend" type="submit" CssClass="btn redbtn" style="margin-top:5%;margin-left:45%;" text="Send" OnClick="btnSend_Click"></asp:button>
                  </div>--%>

                    <br />
                <div class="row">
                    <div class="col-8 col-sm-6 col-lg-4 col-lg-4">
                    <asp:Label runat="server" ID="lblEmailSent" Visible="false" Text="Email Sent" Font-Size="Large"></asp:Label>

                    </div>
                    <div class="col-8 col-sm-6 col-lg-5 col-lg-5">
                    <asp:button  runat="server" ID="btnSend" type="submit" CssClass="btn redbtn" style="margin-top:5%;margin-left:45%;" text="Send" OnClick="btnSend_Click"></asp:button>

                    </div>

                </div>

                </fieldset>
            </div>
        </div>       
    </div>
</asp:Content>
