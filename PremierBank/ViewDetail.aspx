﻿<%@ Page Title="Premier Bank" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewDetail.aspx.cs" Inherits="PremierBank.ViewDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .auto-style1 {
            width: 240px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-default">
        <ul class="nav navbar-nav">
            <li class="active"><a href="#">View Detail Info</a></li>
            <li><a href="DepositMoney.aspx">Deposit Money</a></li>
            <li><a href="WithdrawMoney.aspx">Withdraw Money</a></li>
            <li><a href="TransferMoney.aspx">Transfer Money</a></li>
            <li><a href="BuyOnline.aspx">Buy Online</a></li>
        </ul>
    </nav>
    <fieldset>
        <legend>Account Details</legend>
        <br />
        <table class="nav-justified">
            <tr>
                <td class="auto-style1"><b>Account Holder Name</b></td>
                <td>:</td>
                <td>
                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1"><b>Account Number</b></td>
                <td>:</td>
                <td>
                    <asp:Label ID="lblAccNum" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1"><b>Account Type</b></td>
                <td>:</td>
                <td>
                    <asp:Label ID="lblAccType" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-striped table-hover">
            <Columns>
                <asp:BoundField DataField="TxTime" HeaderText="Transaction Time" SortExpression="TxTime" />
                <asp:BoundField DataField="TxAmount" HeaderText="Amount" SortExpression="TxAmount" />
                <asp:BoundField DataField="TxBalance" HeaderText="Account Balance" SortExpression="TxBalance" />
                <asp:BoundField DataField="TxDescription" HeaderText="Transaction Description" SortExpression="TxDescription" />
            </Columns>
            <PagerStyle CssClass="pagination" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PremierBankCS %>" SelectCommand="SELECT [TxTime], [TxAmount], [TxBalance], [TxDescription] FROM [Trans] WHERE ([AccNum] = @AccNum) ORDER BY [TxTime] DESC">
            <SelectParameters>
                <asp:SessionParameter Name="AccNum" SessionField="AccNum" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </fieldset>
</asp:Content>