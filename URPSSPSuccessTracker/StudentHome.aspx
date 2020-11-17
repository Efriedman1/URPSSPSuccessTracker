<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="URPSSPSuccessTracker.StudentHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Student Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
            <div class="container-fluid">
                <div class="row text-center">
                    <div class="col-md-3" id="div1" style="background-color:darkgray">
                        <img src="images/ProfilePic.jpg" class="rounded-circle center-block" style=" width: 125px; height: 125px;"/><br />
                        <p class="text-center">
                            <asp:Label ID="lblName" runat="server" Text="John Doe" Style="font-family: Avenir Next; font-size:20px;"></asp:Label>
                        </p>
                        <p class="text-center">
                            <asp:Label ID="lblTUIDLabel" runat="server" Text="TUID:  " Style="font-family: Avenir Next; font-size:20px;"></asp:Label>
                            <asp:Label ID="lblTUID" runat="server" Text="914 274 289" Style="font-family: Avenir Next; font-size:20px;"></asp:Label>
                        </p>
                        <p class="text-center">
                            <asp:Label ID="lblEmailLabel" runat="server" Text="Email:  "  Style="font-family: Avenir Next; font-size:20px;"></asp:Label>
                            <asp:Label ID="lblEmail" runat="server" Text="John.Doe@temple.edu" Style="font-family: Avenir Next; font-size:20px;"></asp:Label>
                        </p>
                        <p class="text-center">
                            <asp:Label ID="lblMajorLabel" runat="server" Text="Major:  "  Style="font-family: Avenir Next; font-size:20px;"></asp:Label>
                            <asp:Label ID="lblMajor" runat="server" Text="Computer Science"  Style="font-family: Avenir Next; font-size:20px;"></asp:Label>
                        </p>
                    </div>
                    <div class="col-md-9" id="div2" style="background-color: ghostwhite">

                                      <div class="table-responsive">
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th class="text-center">Select</th>
                  <th class="text-center">Term</th>
                  <th class="text-center">Year</th>
                  <th>PI</th>
                  <th>Last Update</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="text-center">
                      <asp:Button ID="btnSelect" runat="server" Text="Select" />
                    </td>
                  <td class="text-center">Spring</td>
                  <td class="text-center">2018</td>
                  <td>Johnny Appleseed</td>
                  <td>Date</td>
                </tr>
                <tr>
                  <td class="text-center">
                      <asp:Button ID="btnSelect0" runat="server" Text="Select" />
                    </td>
                  <td class="text-center">Summer</td>
                  <td class="text-center">2018</td>
                  <td>Johnny Appleseed</td>
                  <td>Date</td>
                </tr>
                <tr>
                  <td class="text-center">
                      <asp:Button ID="btnSelect1" runat="server" Text="Select" />
                    </td>
                  <td class="text-center">Fall</td>
                  <td class="text-center">2018</td>
                  <td>Johnny Appleseed</td>
                  <td>Date</td>
                </tr>
                <tr>
                  <td class="text-center">
                      <asp:Button ID="btnSelect2" runat="server" Text="Select" />
                    </td>
                  <td class="text-center">Spring</td>
                  <td class="text-center">2019</td>
                  <td>Johnny Appleseed</td>
                  <td>Date</td>
                </tr>
                <tr>
                  <td class="text-center">
                      <asp:Button ID="btnSelect3" runat="server" Text="Select" />
                    </td>
                  <td class="text-center">Fall</td>
                  <td class="text-center">2019</td>
                  <td>Johnny Appleseed</td>
                  <td>Date</td>
                </tr>
              </tbody>
            </table>
          </div>

                    </div>
                </div>
            </div>


        </div>
</asp:Content>
