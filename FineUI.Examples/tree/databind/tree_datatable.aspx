<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_datatable.aspx.cs"
    Inherits="FineUI.Examples.tree.databind.tree_datatable" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../../css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <x:PageManager ID="PageManager1" runat="server" />
        <x:Tree ID="Tree1" Width="650px" EnableArrows="false" EnableLines="true" ShowHeader="true" EnableFrame="true" EnableCollapse="true"
            Title="树控件" runat="server">
        </x:Tree>
    </form>
</body>
</html>
