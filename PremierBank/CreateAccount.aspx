<%@ Page Title="Premier Bank" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="PremierBank.CreateAccount" %>

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
        <legend>Create Bank Account</legend>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">Name</label>
            <div class="col-lg-7">
                <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your name" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Name" ControlToValidate="txtName" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">I/C Number</label>
            <div class="col-lg-7">
                <asp:TextBox ID="txtIC" runat="server" class="form-control" placeholder="I/C Number"></asp:TextBox>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your IC" ControlToValidate="txtIC" ForeColor="Red"></asp:RequiredFieldValidator>
                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid IC" ControlToValidate="txtIC" ValidationExpression="^[0-9]{12}&" ForeColor="Red"></asp:RegularExpressionValidator>--%>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <label class="col-lg-2 control-label">Gender</label>
            <div class="col-lg-7">
                <div class="radio">
                    <label>
                        <asp:RadioButtonList ID="rblGender" runat="server">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </label>
                </div>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please select your gender" ControlToValidate="rblGender" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <label class="col-lg-2 control-label">Race</label>
            <div class="col-lg-7">
                <div class="radio">
                    <label>
                        <asp:RadioButtonList ID="rblRace" runat="server">
                            <asp:ListItem>Bumiputera</asp:ListItem>
                            <asp:ListItem>Chinese</asp:ListItem>
                            <asp:ListItem>Indian</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                        </asp:RadioButtonList>
                    </label>
                </div>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please select your race" ControlToValidate="rblRace" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <label for="textArea" class="col-lg-2 control-label">Address</label>
            <div class="col-lg-7">
                <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Adress" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter your address" ControlToValidate="txtAddress" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <label for="textArea" class="col-lg-2 control-label">State</label>
            <div class="col-lg-7">
                <asp:DropDownList ID="ddlState" runat="server" class="form-control">
                    <asp:ListItem Value="0">- State -</asp:ListItem>
                    <asp:ListItem>Johor</asp:ListItem>
                    <asp:ListItem>Kedah</asp:ListItem>
                    <asp:ListItem>Kelantan</asp:ListItem>
                    <asp:ListItem>Kuala Lumpur</asp:ListItem>
                    <asp:ListItem>Melaka</asp:ListItem>
                    <asp:ListItem>Perak</asp:ListItem>
                    <asp:ListItem>Negeri Sembilan</asp:ListItem>
                    <asp:ListItem>Pahang</asp:ListItem>
                    <asp:ListItem>Perlis</asp:ListItem>
                    <asp:ListItem>Pulau Pinang</asp:ListItem>
                    <asp:ListItem>Sabah</asp:ListItem>
                    <asp:ListItem>Sarawak</asp:ListItem>
                    <asp:ListItem>Selangor</asp:ListItem>
                    <asp:ListItem>Terengganu</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please select your state" ControlToValidate="ddlState" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">Poscode</label>
            <div class="col-lg-7">
                <asp:TextBox ID="txtPoscode" runat="server" class="form-control" placeholder="Poscode"></asp:TextBox>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please enter your poscode" ControlToValidate="txtPoscode" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid poscode" ValidationExpression="^(\d{5}-\d{4}|\d{5}|\d{9})$|^([a-zA-Z]\d[a-zA-Z] \d[a-zA-Z]\d)$" ForeColor="Red" ControlToValidate="txtPoscode"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">Phone Number</label>
            <div class="col-lg-7">
                <asp:TextBox ID="txtPhone" runat="server" class="form-control" placeholder="Phone Number"></asp:TextBox>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please enter your phone number" ControlToValidate="txtPhone" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <label for="inputName" class="col-lg-2 control-label">Email</label>
            <div class="col-lg-7">
                <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please enter your email" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid email" ForeColor="Red" ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <label class="col-lg-2 control-label">Account Type</label>
            <div class="col-lg-7">
                <div class="radio">
                    <label>
                        <asp:RadioButtonList ID="rblAccount" runat="server" DataSourceID="SqlDataSource1" DataTextField="AccTypeName" DataValueField="AccTypeId"></asp:RadioButtonList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PremierBankCS %>" SelectCommand="SELECT * FROM [AccType]"></asp:SqlDataSource>
                    </label>
                </div>
            </div>
            <div class="col-lg-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please select your account type" ControlToValidate="rblGender" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12"><p></p></div>
        </div>
        <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-default" OnClick="btnCancel_Click" CausesValidation="False" />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-primary" OnClick="btnSubmit_Click" CausesValidation="False" />
            </div>
        </div>
    </fieldset>
</asp:Content>