<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="iframe_iframe_window1.aspx.cs"
    Inherits="FineUI.Examples.iframe.iframe_iframe_window1" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <style>
        body, body.x-body {
            padding: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <x:PageManager AutoSizePanelID="formPanel" ID="PageManager1" runat="server"></x:PageManager>
        <x:Panel ID="formPanel" ShowBorder="false" ShowHeader="false"
            runat="server">
            <Toolbars>
                <x:Toolbar runat="server">
                    <Items>
                        <x:Button ID="btnPostBackClose" runat="server" OnClick="btnPostBackClose_Click"
                            Text="关闭-回发父页面">
                        </x:Button>
                        <x:Button ID="Button1" EnablePostBack="false" Text="本页面弹出窗体" runat="server">
                        </x:Button>
                        <x:Button ID="Button2" EnablePostBack="false" Text="父页面弹出窗体" runat="server">
                        </x:Button>
                    </Items>
                </x:Toolbar>
            </Toolbars>
            <Items>
                <x:Label ID="labResult" CssStyle="font-weight:bold;" runat="server">
                </x:Label>
            </Items>
        </x:Panel>
        <x:Window ID="Window1" Hidden="true" EnableIFrame="true" runat="server"
            EnableMaximize="true" EnableResize="true" Height="300px" Width="600px" EnableConfirmOnClose="true"
            Title="窗体三">
        </x:Window>
        <x:Window ID="Window2" Hidden="true" EnableIFrame="true" runat="server"
            EnableMaximize="true" EnableResize="true" Target="Parent" Height="300px" Width="600px"
            EnableConfirmOnClose="true" CloseAction="HidePostBack" Title="窗体四">
        </x:Window>

    </form>
</body>
</html>
