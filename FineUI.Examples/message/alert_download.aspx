﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alert_download.aspx.cs"
    Inherits="FineUI.Examples.message.alert_download" %>

<!DOCTYPE html>
<html>
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../res/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" OnCustomEvent="PageManager1_CustomEvent" runat="server" />
        <f:Button Text="操作（先弹出提示框，点击确定后下载文件）" runat="server" ID="btnOperation" OnClick="btnOperation_Click">
        </f:Button>
    </form>
</body>
</html>
