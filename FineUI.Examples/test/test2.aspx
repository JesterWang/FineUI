<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test2.aspx.cs" Inherits="FineUI.Examples.test2" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Grid1" runat="server" />

        <f:DropDownList runat="server" ID="ddlMessageBoxIcon">
            <f:ListItem Value="None" Text="无图标" Selected="true" />
            <f:ListItem Value="Information" Text="消息" />
            <f:ListItem Value="Warning" Text="警告" />
            <f:ListItem Value="Question" Text="问题" />
            <f:ListItem Value="Error" Text="错误" />
            <f:ListItem Value="Success" Text="成功" />
        </f:DropDownList>
        <f:Button Text="点击弹出对话框" runat="server" ID="btnHello" >
        </f:Button>  
    </form>
</body>
</html>
