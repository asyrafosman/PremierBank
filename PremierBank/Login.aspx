<%@ Page Title="Premier Bank" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PremierBank.Login" %>

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
        <legend>Login to Bank Account</legend>
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            <div class="row">
                <div class="col-lg-7">
                    <div class="alert alert-dismissible alert-danger">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <h4>Wrong username/password!</h4>
                        <p>Please enter the right username and password.</p>
                        <p>If you don't have account, please <a href="CreateAccount.aspx" class="alert-link">create new account</a>.</p>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">Username</label>
            <div class="col-lg-5">
                <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
            </div>
            <div class="col-lg-5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your username" ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12">
                <p></p>
            </div>
        </div>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">Password</label>
            <div class="col-lg-5">
                <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
            </div>
            <div class="col-lg-5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your password" ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12">
                <p></p>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-default" OnClick="btnCancel_Click" CausesValidation="False" />
                <asp:Button ID="btnSubmit" runat="server" Text="Login" class="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </fieldset>
</asp:Content>