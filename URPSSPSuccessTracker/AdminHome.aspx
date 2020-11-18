<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="URPSSPSuccessTracker.AdminHome" %>

<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>
       fieldset.scheduler-border {
    border: 1px groove #ddd !important;
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

              <div class="container-fluid">
                  <div class="row">
                      <div class="col-6">

                          <div class="page-header">
                            <h2>Search Research Information</h2>
                           </div>
                          <br />
                        <fieldset class="scheduler-border">
                            <legend class="scheduler-border">Instructions</legend>
                             You may search by any combination of first name, last name, major, student term, TUID,
                            and status. Select no parameters to view all profiles. Select the Student or PI button to view Student or PI profiles.
                        </fieldset>


                          &nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;

                          <div>
                              <asp:Button class="btn p-2" CssClass="btn redbtn" ID="btnStudent" runat="server" Text="Student" OnClick="Button4_Click" />&nbsp;
                              <asp:Button class="btn" CssClass="btn redbtn" ID="btnPI" runat="server" Text="Principal Investigator" OnClick="Button5_Click" />&nbsp;
                              <asp:DropDownList ID="DropDownList1" runat="server">
                              <asp:ListItem Selected="True">FALL 2020</asp:ListItem>
                              <asp:ListItem>SPRING 2020</asp:ListItem>
                              <asp:ListItem>FALL 2019</asp:ListItem>
                          </asp:DropDownList>
                          </div>

                          

                          </div>                                                        
                      <div class="col-6 col">

                          <asp:Panel ID="pnlPISearch" runat="server">
                               <div class="container">

                                   <div class="row">
                                       <div class="col-auto">
                                           <asp:Label ID="lblParam1" runat="server" Text="TUID: "></asp:Label><br />
                                            <asp:TextBox ID="txtTUID" CssClass=" form-control-sm" runat="server"></asp:TextBox>
                                       </div>
                                       <div class="col-auto">
                                           <asp:Label ID="lblDepartment" runat="server" Text="Department: "></asp:Label><br />
                                           <asp:TextBox ID="txtDepartment" CssClass="form-control-sm" runat="server"></asp:TextBox>
                                        </div>
                                   </div>
                                   
                                   <div class="row">
                                       <div class="col-auto">
                                         <asp:Label ID="lblFirst" runat="server" Text="First Name: "></asp:Label><br />
                                         <asp:TextBox ID="txtFirst" CssClass="form-control-sm" runat="server"></asp:TextBox> 
                                       </div>

                                       <div class="col-auto">
                                           <asp:Label ID="lblLast" runat="server" Text="Last Name: "></asp:Label><br />
                                           <asp:TextBox ID="txtLast" CssClass="form-control-sm" runat="server"></asp:TextBox>
                                       </div>
                                   </div>
                                         
                            </div>
                          
                         
                          </asp:Panel>


                          <asp:Panel ID="pnlStudentSearch" runat="server">
                              
                              
                               <div class="container">
                                   <%-- 1st row --%>
                                   <div class="row">
                                       <div class="col-auto">
                                           <asp:Label ID="Label4" runat="server" Text="TUID: "></asp:Label><br />
                                            <asp:TextBox ID="TextBox5" CssClass=" form-control-sm" runat="server"></asp:TextBox>
                                       </div>
                                       <div class="col-auto">
                                             <asp:Label ID="lblProgram" runat="server" Text="Program : "></asp:Label><br />
                                              <asp:DropDownList ID="DropDownList3" CssClass="form-control-sm" runat="server">
                                                  <asp:ListItem></asp:ListItem>
                                                  <asp:ListItem>SSP</asp:ListItem>
                                                  <asp:ListItem>SSP/URP</asp:ListItem>
                                              </asp:DropDownList>
                                        </div>
                                   </div>
                                   <%-- 2nd row --%>
                                   <div class="row">
                                       <div class="col-auto">
                                         <asp:Label ID="Label2" runat="server" Text="First Name: "></asp:Label><br />
                                         <asp:TextBox ID="TextBox2" CssClass="form-control-sm" runat="server"></asp:TextBox> 
                                       </div>

                                       <div class="col-auto">
                                           <asp:Label ID="Label3" runat="server" Text="Last Name: "></asp:Label><br />
                                           <asp:TextBox ID="TextBox3" CssClass="form-control-sm" runat="server"></asp:TextBox>
                                       </div>
                                   </div>
                                         
                                   <%-- 3rd row --%>
                                <div class="row">
                                    <div class="col-auto">
                                         <asp:Label ID="Label1" runat="server" Text="Major: "></asp:Label><br />
                                         <asp:TextBox ID="TextBox1" CssClass="form-control-sm" runat="server"></asp:TextBox>
                                    </div>                                           
                                    <div class="col-auto">
                                         <asp:Label ID="lblStatus" runat="server" Text="Status: "></asp:Label><br />
                                          <asp:DropDownList ID="DropDownList2" CssClass="form-control-sm" runat="server">
                                            <asp:ListItem>Complete</asp:ListItem>
                                            <asp:ListItem>Incomplete</asp:ListItem>
                                          </asp:DropDownList>
                                    </div>

                                </div>
                            </div>
                              
                              
                              
                              
                              <%--  --%>
                       
                          </asp:Panel>

                         
                          <br />
                          <div style="margin-left: 120px">
                               <asp:Button class="btn-outline" CssClass="btn redbtn" ID="btnSearch" runat="server" Text="Search" />&nbsp;
                               <asp:Button class="btn-outline" CssClass="btn redbtn" ID="btnClear" runat="server" Text="Clear" />
                          </div>
                      </div>
                  </div>
                  <div class="row">
                      <div class="col-12 table-responsive">
                          
                        <fieldset class="scheduler-border">
                            <legend class="scheduler-border">
                                <asp:Label ID="lblUser" runat="server" Text="Principal Investigator"></asp:Label>
                            </legend>

                            <asp:Panel ID="pnlPI" runat="server">
                                 <asp:Table ID="tblPI" class=" table-responsive-lg m-auto w-100" runat="server">
                                 <asp:TableHeaderRow style="background-color:#91182a;color:white; ">

                            <asp:TableHeaderCell Scope="Column">
                                
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                TUID
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                First Name
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                Last Name
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                Department
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                Actions
                            </asp:TableHeaderCell>            
                        </asp:TableHeaderRow>


                           <asp:TableRow>
                            <asp:TableHeaderCell>
                                 <asp:CheckBox ID="CheckBox1" runat="server" />
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                921034587
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                Bill
                            </asp:TableCell>
                            <asp:TableCell>
                                Wascher
                            </asp:TableCell>
                            <asp:TableCell>
                                IST
                            </asp:TableCell>
                            <asp:TableCell>
                                 <asp:Button CssClass="btn redbtn" ID="Button6" runat="server" Text="Button" />
                            </asp:TableCell>
                        </asp:TableRow>

                                <asp:TableRow>
                            <asp:TableHeaderCell>
                                 <asp:CheckBox ID="CheckBox2" runat="server" />
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                9654123
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                Nyla
                            </asp:TableCell>
                            <asp:TableCell>
                                Taylor
                            </asp:TableCell>
                            <asp:TableCell>
                                IST
                            </asp:TableCell>
                            <asp:TableCell>
                                 <asp:Button CssClass="btn redbtn" ID="Button1" runat="server" Text="Button" />
                            </asp:TableCell>
                        </asp:TableRow>


                                 <asp:TableRow>
                            <asp:TableHeaderCell>
                                 <asp:CheckBox ID="CheckBox3" runat="server" />
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                9678521
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                Omar
                            </asp:TableCell>
                            <asp:TableCell>
                                Dodson
                            </asp:TableCell>
                            <asp:TableCell>
                                IST
                            </asp:TableCell>
                            <asp:TableCell>
                                 <asp:Button CssClass="btn redbtn" ID="Button2" runat="server" Text="Button" />
                            </asp:TableCell>
                        </asp:TableRow>

                            </asp:Table>

                            </asp:Panel>


                            <asp:Panel ID="pnlStudent" runat="server">
                                 <asp:Table ID="tblStudent" class=" table-responsive-lg m-auto w-100" runat="server">
                     <asp:TableHeaderRow style="background-color:#91182a;color:white; ">

                            <asp:TableHeaderCell Scope="Column">
                                
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                TUID
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                First Name
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                Last Name
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                Major
                            </asp:TableHeaderCell>
                         <asp:TableHeaderCell Scope="Column">
                                Program
                            </asp:TableHeaderCell>
                         <asp:TableHeaderCell Scope="Column">
                                Principal Investigator
                            </asp:TableHeaderCell>
                         <asp:TableHeaderCell Scope="Column">
                                Status
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell Scope="Column">
                                Actions
                            </asp:TableHeaderCell>            
                        </asp:TableHeaderRow>


                           <asp:TableRow>
                            <asp:TableHeaderCell>
                                 <asp:CheckBox ID="CheckBox4" runat="server" />
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                921034590
                            </asp:TableHeaderCell>
                            <asp:TableCell>
                                Ruby
                            </asp:TableCell>
                            <asp:TableCell>
                                Byrd
                            </asp:TableCell>
                            <asp:TableCell>
                                IST
                            </asp:TableCell>
                               <asp:TableCell>
                                SSP
                            </asp:TableCell>
                               <asp:TableCell>
                                Omar Dodson
                            </asp:TableCell>
                               <asp:TableCell>
                                Complete
                            </asp:TableCell>
                            <asp:TableCell>
                                 <asp:Button CssClass="btn redbtn" ID="Button3" runat="server" Text="Button" />
                            </asp:TableCell>
                        </asp:TableRow>

                     </asp:Table>
                 </asp:Panel>
                            <p>
                          <br />

                            </p>

                            <div style="margin-left: 40%">
                                <asp:Button class="btn" CssClass="btn redbtn" ID="btnExport" runat="server" Text="Export" />&nbsp;
                                <asp:Button class="btn" CssClass="btn redbtn" ID="btnEmail" runat="server" Text="Email All" OnClick="btnEmail_Click" />&nbsp;
                                <asp:Button class="btn" CssClass="btn redbtn" ID="btnEmailChecked" runat="server" Text="Email Selected" OnClick="btnEmailChecked_Click" />
                            </div>

                        </fieldset>
                          
                          
                      </div>
                  </div>
              </div>
</asp:Content>
