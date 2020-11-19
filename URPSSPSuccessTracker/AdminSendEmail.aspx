<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminSendEmail.aspx.cs" Inherits="URPSSPSuccessTracker.AdminSendEmail" ValidateRequest="false"%>
<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
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

        <div class="page-header">
          <h2>Send Email</h2>
        </div>

        <div class="row"  >
            <div class="col-sm-12 col-sm-12 col-lg-5 col-lg-5 " >
                <fieldset class="scheduler-border col-8 col-sm-6 col-lg-12 col-lg-12 table_scroll" style="height:630px">
                    <legend class="scheduler-border">Receipients</legend>

                    <asp:Table ID="tblStudentEmail" runat="server" CssClass="table table-striped" >

                        <asp:TableHeaderRow style="background-color:#91182A;color:white;">
                            <asp:TableHeaderCell Scope="Column">
                                Student Name
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                Email
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                
                            </asp:TableHeaderCell>
                        </asp:TableHeaderRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Lara Nelson
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                Laran@temple.edu
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button runat="server" text="Remove" CssClass="btn redbtn"/>
                            </asp:TableCell>

                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Salim Nash
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                Salimn@temple.edu
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button runat="server" text="Remove" CssClass="btn redbtn"/>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Farzana Cherry
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                FarzanaC@temple.edu
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button runat="server" text="Remove" CssClass="btn redbtn"/>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Raymond Derrick
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                RaymondD@temple.edu
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button runat="server" text="Remove" CssClass="btn redbtn"/>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Alyssa Jefferson
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                AlyssaJ@temple.edu
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button runat="server" text="Remove" CssClass="btn redbtn"/>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Bryn Robin
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                BrynR@temple.edu
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button runat="server" text="Remove" CssClass="btn redbtn"/>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Annika Armstrong
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                AnnikaA@temple.edu
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button runat="server" text="Remove" CssClass="btn redbtn"/>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Bryce Wilder
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                BryceW@temple.edu
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button runat="server" text="Remove" CssClass="btn redbtn"/>
                            </asp:TableCell>
                        </asp:TableRow>
                        
                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Jacqueline Kinney
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                JacquelineKy@temple.edu
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button runat="server" text="Remove" CssClass="btn redbtn"/>
                            </asp:TableCell>
                        </asp:TableRow>
                        
                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Tobias Reyna
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                TobiasR@temple.edu
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button runat="server" text="Remove" CssClass="btn redbtn"/>
                            </asp:TableCell>
                        </asp:TableRow>
                        
                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Osman Hanson
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                OsmanH@temple.edu
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button runat="server" text="Remove" CssClass="btn redbtn"/>
                            </asp:TableCell>
                        </asp:TableRow>
                        
                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Alessandro Soto
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                AlessandroS@temple.edu
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button runat="server" text="Remove" CssClass="btn redbtn"/>
                            </asp:TableCell>
                        </asp:TableRow>
                        
                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Clarice Landry
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                ClariceL@temple.edu
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button runat="server" text="Remove" CssClass="btn redbtn"/>
                            </asp:TableCell>
                        </asp:TableRow>
                        
                        <asp:TableRow>
                            <asp:TableHeaderCell>
                                Karla Arellano
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                KarlaA@temple.edu
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button runat="server" text="Remove" CssClass="btn redbtn"/>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:Button runat="server" CssClass="btn redbtn" ID="btnAddStudent" Text="Add More Students" OnClick="btnAddStudent_Click" style="margin-bottom:20px"/>
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

                  <div class="col-8 col-sm-6 col-lg-12 col-lg-12">
                    <asp:Label runat="server" ID="lblEmailSent" Visible="false" Text="Email Sent"></asp:Label>
                  </div>
                  <div class="col-8 col-sm-6 col-lg-12 col-lg-12">
                    <asp:button  runat="server" ID="btnSend" type="submit" CssClass="btn redbtn" style="margin-top:5%;margin-left:45%;" text="Send" OnClick="btnSend_Click"></asp:button>

                  </div>

                </fieldset>
            </div>
        </div>       
    </div>
</asp:Content>
