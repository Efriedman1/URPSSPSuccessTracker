<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminSendEmail.aspx.cs" Inherits="URPSSPSuccessTracker.AdminSendEmail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin-top:2%">

        <div class="page-header">
          <h2>Send Email</h2>
        </div>

        <div class="row">
            <div class="col-sm-12 col-sm-12 col-lg-6 col-lg-6">
               <h5>Receipients</h5>
                <div class="col-8 col-sm-6 col-lg-10 col-lg-10 border border-secondary" style="border-radius:5px">
                    <table class="table">
                        <thead style="background-color:#B21125;color:white;"> 
                            <tr>
                                <th scope="col">Student Name</th>
                                <th scope="col">Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">Lara Nelson</th>
                                <td>Laran@temple.edu</td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th scope="row">Salim Nash</th>
                                <td>Salimn@temple.edu</td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th scope="row">Farzana Cherry</th>
                                <td>Faranzac@temple.edu</td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th scope="row">Raymond Derrick</th>
                                <td>Raymondd@temple.edu</td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <th scope="row">Alyssa Jefferson</th>
                                <td>Alyssajefferson@temple.edu</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-sm-12 col-sm-12 col-md-6 col-lg-6 ">
                <h5>Write Email</h5>
                <div class="border border-secondary" style="border-radius:5px;">
                  <div class="col-8 col-sm-6 col-lg-12 col-lg-12" style="margin-top:2%;">
                    <label>Subject</label>
                    <input type="text" class="form-control" id="emailSubject" placeholder="Enter your subject here">                          
                  </div>
                  <div class="col-8 col-sm-6 col-lg-12 col-lg-12">
                    <label>Body</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="12" placeholder="Enter your email here"></textarea>                         
                  </div>
                    <button type="submit" class="btn mb-2" style="margin-top:5%;margin-bottom:5%;margin-left:45%;background-color:#B21125;color:white" >Send</button>
                </div>

            </div>
        </div>       
    </div>
</asp:Content>
