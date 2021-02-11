<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminDownload.aspx.cs" Inherits="URPSSPSuccessTracker.AdminDownload" %>

<%@ MasterType VirtualPath="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex-container m-5">
        <div class="d-flex justify-content-between">
            <h2>Search Research Information</h2>
            <div>
                <label>Term: </label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                    <asp:ListItem Selected="True">FALL 2020</asp:ListItem>
                    <asp:ListItem>SPRING 2020</asp:ListItem>
                    <asp:ListItem>FALL 2019</asp:ListItem>
                    <asp:ListItem>SPRING 2019</asp:ListItem>
                    <asp:ListItem>FALL 2018</asp:ListItem>
                    <asp:ListItem>SPRING 2018</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="flex-container">
            <div class="d-flex justiy-content-between">
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Instructions</legend>
                    <p>Please select a user type between the "Student" or "Principal Investigator" buttons. Then proceed to follow the below instructions depending on whether you would like to multiple or a single user.</p>
                    <div class="d-flex flex-row">
                        <asp:Label ID="Label3" runat="server" Text="Excel Upload:" CssClass="p-2 mr-3 ml-4 h6"></asp:Label>
                    </div>
                    <div class="d-flex flex-row">
                        <asp:Label ID="Label4" runat="server" Text="Please Select the file you are uploading. You MUST use the .xls file Template download through Download button. Other files will not work." CssClass="p-2 mr-3 ml-3"></asp:Label>
                    </div>
                    <div class="d-flex flex-row mt-2">
                        <asp:Label ID="Label5" runat="server" Text="Single Person Upload:" CssClass="p-2 mr-3 ml-3 h6"></asp:Label>
                    </div>
                    <div class="d-flex flex-row">
                        <asp:Label ID="Label6" runat="server" Text="Please select URP/SSP Student or Principal Investigator. Fill out the textbox for upload. All blanks can be empty, except Assessnet." CssClass="p-2 mr-3 ml-3"></asp:Label>
                    </div>
                    <div class="d-flex flex-row mt-2">
                        <button type="button" class="btn redbtn p-2 mr-3 ml-3 ">URP/SSP Student Template</button>
                        <button type="button" class="btn redbtn p-2 mr-3 ml-3 ">Principal Investigator Template</button>
                    </div>
                </fieldset>
                <div class="col-6">
                    <asp:Label ID="lblUpload" runat="server" Text="Upload Users" CssClass="p-2 mr-3 ml-3 mb-3 h3"></asp:Label>
                    <div class="d-flex justify-content-center">
                        <asp:Label ID="lblUpDirections" runat="server" Text="User Type:" CssClass="p-2 mr-3 ml-3"></asp:Label>
                    </div>
                    <div class="d-flex justify-content-center mt-2">
                        <button type="button" class="btn redbtn p-2 mr-3 ml-3 ">Student</button>
                        <button type="button" class="btn btn-light p-2 mr-3 ml-3 ">Principal Investigator</button>
                    </div>
                    <div class="d-flex mt-2">
                        <button type="button" class="btn redbtn p-2 mr-3 ml-3 ">Browse</button>
                        <input type="text" class="form-control col-10" placeholder="StudentTemplate.xlsx" />
                    </div>
                    <div class="d-flex justify-content-center mt-2">
                        <button type="button" class="btn redbtn p-2 mr-3 ml-3 " data-toggle="modal" data-target="#resultModal">Upload</button>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Student Upload Results</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:Table ID="Table1" runat="server" CssClass="table table-striped">
                                <asp:TableRow CssClass="table text-white" BackColor="#91182a">
                                    <asp:TableCell Text="TUID" />
                                    <asp:TableCell Text="Student Name" />
                                    <asp:TableCell Text="Status" />
                                </asp:TableRow>
                                <asp:TableRow CssClass="thead-dark">
                                    <asp:TableCell Text="596221364" />
                                    <asp:TableCell Text="Lara Nelson" />
                                    <asp:TableCell Text="Success" CssClass="text-success" />
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell Text="602115453" />
                                    <asp:TableCell Text="Salim Nash" />
                                    <asp:TableCell Text="Existing Student Error" CssClass="text-danger" />
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell Text="562398451" />
                                    <asp:TableCell Text="Farzana Cherry" />
                                    <asp:TableCell Text="Student ID Error" CssClass="text-danger" />
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell Text="339566481" />
                                    <asp:TableCell Text="Raymond Derrick" />
                                    <asp:TableCell Text="Success" CssClass="text-success" />
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell Text="953249134" />
                                    <asp:TableCell Text="Alyssa Jefferson" />
                                    <asp:TableCell Text="Success" CssClass="text-success" />
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn redbtn" data-dismiss="modal" data-toggle="modal" data-target="#finalizeModal">Finalize upload</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="finalizeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="finalizeModalLabel">Student Upload Results</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Students have been successfully uploaded to the system.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">OK</button>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
