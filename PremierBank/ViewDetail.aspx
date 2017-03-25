<%@ Page Title="Premier Bank" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewDetail.aspx.cs" Inherits="PremierBank.ViewDetail" %>

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
            <li><a href="TransferMoney.aspx">Transfer Money</a></li>
            <li><a href="DepositMoney.aspx">Deposit Money</a></li>
            <li><a href="WithdrawMoney.aspx">Withdraw Money</a></li>
            <li class="active"><a href="#">View Detail Info</a></li>
            <li><a href="BuyOnline.aspx">Buy Online</a></li>
        </ul>
    </nav>
    <div class="progress progress-striped active">
        <div class="progress-bar" style="width: 45%"></div>
    </div>
</asp:Content>