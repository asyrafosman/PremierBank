<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GraphTest.aspx.cs" Inherits="PremierBank.GraphTest" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:scriptmanager runat="server"></asp:scriptmanager>
        <asp:DropDownList ID="ddlCountry1" runat="server"></asp:DropDownList>
        <asp:DropDownList ID="ddlCountry2" runat="server"></asp:DropDownList>
        <asp:Button ID="btnCompare" runat="server" Text="Compare" OnClick="Compare" />
        <cc1:LineChart ID="LineChart1" runat="server" ChartHeight="300" ChartWidth="450"
                ChartType="Basic" ChartTitleColor="#0E426C" Visible="false" CategoryAxisLineColor="#D08AD9"
                ValueAxisLineColor="#D08AD9" BaseLineColor="#A156AB"></cc1:LineChart>
    </form>
</body>
</html>
