<%@ Page Title="Premier Bank" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TransferMoney.aspx.cs" Inherits="PremierBank.TransferMoney" %>

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
            <li><a href="WithdrawMoney.aspx">Withdraw Money</a></li>
            <li class="active"><a>Transfer Money</a></li>
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
        <legend>Transfer Money</legend>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">Transfer type</label>
            <div class="col-lg-7">
                <asp:DropDownList ID="ddlTransferType" runat="server" class="form-control">
                    <asp:ListItem Value="0">Plese select</asp:ListItem>
                    <asp:ListItem>Fund Transfer to Savings/Current</asp:ListItem>
                    <asp:ListItem>Financing/Loan Payment</asp:ListItem>
                    <asp:ListItem>Hire Purchase</asp:ListItem>
                    <asp:ListItem>Credit Card Payment</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select transfer type" ForeColor="Red" ControlToValidate="ddlTransferType" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">Amount</label>
            <div class="col-lg-7">
                <div class="input-group">
                    <span class="input-group-addon">RM</span>
                    <asp:TextBox ID="txtAmount" runat="server" class="form-control" placeholder="Transfer amount"></asp:TextBox>
                </div>      
            </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter amount" ForeColor="Red" ControlToValidate="txtAmount" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" Display="Dynamic" ErrorMessage="Invalid amount" ControlToValidate="txtAmount" Type ="Integer" MinimumValue="50" MaximumValue="500" ForeColor="Red"></asp:RangeValidator>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">Recipient bank</label>
            <div class="col-lg-7">
                <asp:DropDownList ID="ddlRecipientBank" runat="server" class="form-control" ControlToValidate="ddlRecipientBank">
                    <asp:ListItem Value="0">Plese select</asp:ListItem>
                    <asp:ListItem>Maybank</asp:ListItem>
                    <asp:ListItem>CIMB</asp:ListItem>
                    <asp:ListItem>Public Bank Berhad</asp:ListItem>
                    <asp:ListItem>RHB Bank</asp:ListItem>
                    <asp:ListItem>Hong Leong Bank</asp:ListItem>
                    <asp:ListItem>AMMB Holdings</asp:ListItem>
                    <asp:ListItem>United Overseas Bank (Malaysia)</asp:ListItem>
                    <asp:ListItem>Bank Rakyat</asp:ListItem>
                    <asp:ListItem>OCBC Bank (Malaysia)</asp:ListItem>
                    <asp:ListItem>HSBC Bank Malaysia</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please select recipient bank" ForeColor="Red" ControlToValidate="ddlRecipientBank" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">Recipient account</label>
            <div class="col-lg-7">
                <asp:TextBox ID="txtRepAccNum" runat="server" class="form-control" placeholder="Recipient account number"></asp:TextBox>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter recipient account number" ForeColor="Red" ControlToValidate="txtRepAccNum" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-default" CausesValidation="False" OnClick="btnCancel_Click"/>
                <asp:Button ID="btnSubmit" runat="server" Text="Transfer" class="btn btn-primary" OnClick="btnSubmit_Click"/>
            </div>
        </div>
    </fieldset>
</asp:Content>