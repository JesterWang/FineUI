<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="timer.aspx.cs" Inherits="FineUI.Examples.timer" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" AutoScroll="true" runat="server">
            <Items>
                <f:SimpleForm ID="SimpleForm1" runat="server" BodyPadding="5px" Title="SimpleForm"
                    LabelAlign="Right" BoxConfigChildMargin="0 5 0 0" LabelWidth="80">
                    <Items>
                        <f:TextBox ID="txtTitle" runat="server" Label="标题" Text=""></f:TextBox>
                        <f:Button Type="Submit" ID="btnSearch" Text="查询" Icon="Zoom" Size="Medium" runat="server" />
                    </Items>
                </f:SimpleForm>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
