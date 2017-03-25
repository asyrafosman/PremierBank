<%@ Page Title="Premier Bank" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterOnline.aspx.cs" Inherits="PremierBank.RegisterOnline" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Register Online User</legend>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">Username</label>
            <div class="col-lg-5">
                <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
            </div>
            <div class="col-lg-5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your username" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">Password</label>
            <div class="col-lg-5">
                <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
            </div>
            <div class="col-lg-5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your password" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">Confirm Password</label>
            <div class="col-lg-5">
                <asp:TextBox ID="txtPassword2" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
            </div>
            <div class="col-lg-5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter your password" ControlToValidate="txtPassword2" ForeColor="Red"></asp:RequiredFieldValidator>
                <%--<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Invalid password" ValueToCompare="txtPassword" ControlToValidate="txtPassword2" ForeColor="Red" Operator="Equal" Type="String"></asp:CompareValidator>--%>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-default" OnClick="btnCancel_Click" CausesValidation="False"/>
                <asp:Button ID="btnSubmit" runat="server" Text="Register" class="btn btn-primary" OnClick="btnSubmit_Click"/>
            </div>
        </div>
    </fieldset>
</asp:Content>