<%@ Page Title="Premier Bank" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BuyOnline.aspx.cs" Inherits="PremierBank.BuyOnline" %>

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
            <li><a href="TransferMoney.aspx">Transfer Money</a></li>
            <li class="active"><a>Buy Online</a></li>
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
        <legend>Buy Online</legend>
        <div class="form-group">
                <label for="inputName" class="col-lg-2 control-label">From Account</label>
            <div class="col-lg-7">
                <asp:TextBox ID="txtAccNo" runat="server" class="form-control" placeholder="Own Account number" disabled=""></asp:TextBox>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter account number" ForeColor="Red" ControlToValidate="txtAccNo" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">Service Provider</label>
            <div class="col-lg-7">
                <asp:DropDownList ID="ddlservice" runat="server" class="form-control" ControlToValidate="ddlservice">
                    <asp:ListItem Value="0">Please select service provider</asp:ListItem>
                    <asp:ListItem>Celcom</asp:ListItem>
                    <asp:ListItem>Maxis</asp:ListItem>
                    <asp:ListItem>TuneTalk</asp:ListItem>
                    <asp:ListItem>OneXOX</asp:ListItem>
                    <asp:ListItem>Digi</asp:ListItem>
                    <asp:ListItem>U-Mobile</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please select service provider" ForeColor="Red" ControlToValidate="ddlservice" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">Method of Reload</label>
            <div class="col-lg-7">
                <asp:DropDownList ID="ddlmethod" runat="server" class="form-control" ControlToValidate="ddlmethod">
                    <asp:ListItem Value="0">Please select reload method</asp:ListItem>
                    <asp:ListItem>Auto Top-Up</asp:ListItem>
                    <asp:ListItem>With PIN</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please select reload method" ForeColor="Red" ControlToValidate="ddlmethod" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
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
                    <asp:DropDownList ID="ddlamount" runat="server" style="width:175px" class="form-control" ControlToValidate="ddlamount">
                        <asp:ListItem Value="0">Reload Amount</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem>100</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter amount" ForeColor="Red" ControlToValidate="ddlamount" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-default" CausesValidation="False" />
                <asp:Button ID="btnSubmit" runat="server" Text="Purchase" class="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </fieldset>
</asp:Content>