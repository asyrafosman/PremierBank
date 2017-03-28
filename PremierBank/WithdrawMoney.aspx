<%@ Page Title="Premier Bank" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WithdrawMoney.aspx.cs" Inherits="PremierBank.WithdrawMoney" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-default">
        <ul class="nav navbar-nav">
            <li><a href="ViewDetail.aspx">View Detail Info</a></li>
            <li><a href="DepositMoney.aspx">Deposit Money</a></li>
            <li class="active"><a>Withdraw Money</a></li>
            <li><a href="TransferMoney.aspx">Transfer Money</a></li>
            <li><a href="BuyOnline.aspx">Buy Online</a></li>
        </ul>
    </nav>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Available Balance</h3>
        </div>
        <div class="panel-body">
            <asp:Label ID="lblAmount" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <fieldset>
        <legend>Withdraw Money</legend>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">Amount</label>
            <div class="col-lg-3">
                <div class="input-group">
                    <span class="input-group-addon">RM</span>
                    <asp:TextBox ID="txtAmount" runat="server" class="form-control" placeholder="Amount"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-7">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your amount" ControlToValidate="txtAmount" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" Display="Dynamic" ErrorMessage="Invalid amount" ControlToValidate="txtAmount" Type ="Integer" MinimumValue="50" MaximumValue="500" ForeColor="Red"></asp:RangeValidator>
            </div>
            <div class="form-group">
                <div class="col-lg-12">
                    <p></p>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-default" CausesValidation="False" OnClick="btnCancel_Click" />
                    <asp:Button ID="btnSubmit" runat="server" Text="Withdraw" class="btn btn-primary" OnClick="btnSubmit_Click" />
                </div>
            </div>
    </fieldset>
</asp:Content>