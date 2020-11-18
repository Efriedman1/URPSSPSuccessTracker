<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminSearchStudent.aspx.cs" Inherits="URPSSPSuccessTracker.AdminSearchStudent" %>
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

              <div class="container">
                  <div class="row">
                      <div class="col-6">
                        <fieldset class="scheduler-border">
                            <legend class="scheduler-border">Instructions</legend>
                             You may search by any combination of first name, last name, major, student term, TUID,
                            and status. Select no parameters to view all profiles. Select the Student or PI button to view Student or PI profiles.
                        </fieldset>


                          &nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;

                          <div>
                              <asp:Button class="btn redbtn" ID="Button4" runat="server" Text="Student" OnClick="Button4_Click" />&nbsp;
                              <asp:Button class="btn redbtn" ID="Button5" runat="server" Text="Principal Investigator" OnClick="Button5_Click" />&nbsp;
                              <asp:DropDownList ID="DropDownList1" runat="server">
                              <asp:ListItem Selected="True">FALL 2020</asp:ListItem>
                              <asp:ListItem>SPRING 2020</asp:ListItem>
                              <asp:ListItem>FALL 2019</asp:ListItem>
                          </asp:DropDownList>
                          </div>

                         

                          </div>                                                        
                      <div class="col-6">
                         
                          <div>
                              <asp:Label ID="lblParam1" runat="server" Text="TUID: "></asp:Label>
                              <asp:TextBox ID="txtTUID" runat="server" CssClass="form-control"></asp:TextBox>
                              <asp:Label ID="lblStatus" runat="server" Text="Status: "></asp:Label>
                              <asp:DropDownList ID="DropDownList2" runat="server"  CssClass="form-control">
                                  <asp:ListItem>Complete</asp:ListItem>
                                  <asp:ListItem>Incomplete</asp:ListItem>
                              </asp:DropDownList>
                          </div>
                          <div>
                              <asp:Label ID="lblFirst" runat="server" Text="First Name: "></asp:Label>
                              <asp:TextBox ID="txtFirst" runat="server" CssClass="form-control"></asp:TextBox> 

                              <asp:Label ID="lblLast" runat="server" Text="Last Name: "></asp:Label>
                              <asp:TextBox ID="txtLast" runat="server" CssClass="form-control"></asp:TextBox>
                          </div>  
                          <div>
                              <asp:Label ID="lblMajor" runat="server" Text="Major : "></asp:Label>
                              <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox> 

                              <asp:Label ID="lblProgram" runat="server" Text="Program : "></asp:Label>
                              <asp:DropDownList ID="DropDownList3" runat="server">
                                  <asp:ListItem></asp:ListItem>
                                  <asp:ListItem>SSP</asp:ListItem>
                                  <asp:ListItem>SSP/URP</asp:ListItem>
                              </asp:DropDownList>
                          </div>
                          <br />
                          <div style="margin-left: 120px">
                               <asp:Button class="btn-outline-danger" ID="btnSearch" runat="server" Text="Search" />&nbsp;
                               <asp:Button class="btn-outline-danger" ID="btnClear" runat="server" Text="Clear" />
                          </div>
                      </div>
                  </div>
                  <div class="row">
                      <div class="col-12 table-responsive">
                          
                        <fieldset class="scheduler-border">
                            <legend class="scheduler-border">
                                <asp:Label ID="lblUser" runat="server" Text="Student"></asp:Label>
                            </legend>

                            <table class="table-bordered w-100"  id="myTable" runat="server">
                              <thead class="bg-danger">
                                <tr>
                                  <th scope="col"> </th>
                                  <th scope="col">TUID</th>
                                  <th scope="col">First</th>
                                  <th scope="col">Last</th>
                                  <th scope="col">Major</th>
                                  <th scope="col">Program</th>
                                  <th scope="col">Principal Investigator</th>
                                  <th scope="col">Status</th>
                                  <th scope="col">Actions</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <th scope="row"> <asp:CheckBox ID="CheckBox1" runat="server" /></th>
                                  <td>9210345</td>
                                  <td>Ruby</td>
                                  <td>Byrd</td>
                                  <td>IST</td>
                                  <td>SSP</td>
                                  <td>Omar Dodson</td>
                                  <td>Complete</td>
                                  <td> <asp:Button ID="Button1" runat="server" Text="Button" /></td>
                                </tr>
                                <tr>
                                  <th scope="row"> <asp:CheckBox ID="CheckBox2" runat="server" /></th>
                                  <td>989345210</td>
                                  <td>Jane</td>
                                  <td>Notron</td>
                                  <td>CS</td>
                                  <td>SSP/URP</td>
                                  <td>Bill Wascher</td>
                                  <td>Incomplete</td>
                                  <td> <asp:Button ID="Button2" runat="server" Text="Button" /></td>
                                </tr>
                                <tr>
                                  <th scope="row"> <asp:CheckBox ID="CheckBox3" runat="server" /></th>
                                  <td>920432776</td>
                                  <td>Terry</td>
                                  <td>Berry</td>
                                  <td>CHEM</td>
                                  <td>SSP</td>
                                  <td>Iwan Haliday</td>
                                  <td>Incomplete</td>
                                  <td> <asp:Button ID="Button3" runat="server" Text="Button" /></td>
                                </tr>
                                <tr>
                                  <th scope="row"> <asp:CheckBox ID="CheckBox4" runat="server" /></th>
                                  <td>920432776</td>
                                  <td>Sahar</td>
                                  <td>Mayo</td>
                                  <td>CS</td>
                                  <td>SSP</td>
                                  <td>Jan Mann</td>
                                  <td>Complete</td>
                                  <td> <asp:Button ID="Button6" runat="server" Text="Button" /></td>
                                </tr>
                              </tbody>
                            </table>
                            <p>
                          <br />

                            </p>

                            <div style="margin-left: 40%">
                                <asp:Button class="btn redbtn" ID="btnExport" runat="server" Text="Export" />&nbsp;
                                <asp:Button class="btn redbtn" ID="btnEmail" runat="server" Text="Email All" />&nbsp;
                                <asp:Button class="btn redbtn" ID="btnEmailChecked" runat="server" Text="Email Selected" />
                            </div>

                        </fieldset>
                          
                          
                      </div>
                  </div>
              </div>
</asp:Content>
