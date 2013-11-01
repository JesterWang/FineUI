<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userinfo_dynamic.aspx.cs"
    Inherits="FineUI.Examples.usercontrol.userinfo_dynamic" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <x:PageManager ID="PageManager1" runat="server"></x:PageManager>
        <x:ContentPanel runat="server" ID="Panel1" Width="600px" EnableFrame="true" EnableCollapse="true" BodyPadding="5px"
            Height="200px" Title="页面/面板一（ContentPanel->UserInfoControl）">
        </x:ContentPanel>
        <br />
        <x:Panel runat="server" ID="Panel2" Width="600px" EnableFrame="true" EnableCollapse="true" BodyPadding="5px"
            Height="200px" Title="页面/面板二（Panel->UserControlConnector->UserInfoControl）">
        </x:Panel>
        <br />
        <x:Panel runat="server" ID="Panel3" Width="600px" EnableFrame="true" EnableCollapse="true" BodyPadding="5px"
            Height="200px" Layout="Fit" Title="页面/面板三（Layout=Fit, Panel->UserControlConnector->UserInfoControl）">
        </x:Panel>
    </form>
</body>
</html>
