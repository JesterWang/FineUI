<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="test.aspx.cs"
    Inherits="FineUI.Examples.test.test" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title><%= GetGender(1) %></title>

</head>
<body>
    <form id="form1" runat="server">
        <x:PageManager ID="PageManager1" runat="server" AutoSizePanelID="Panel1" />
        <x:Panel ID="Panel1" runat="server" ShowBorder="False" ShowHeader="false" BodyPadding="5px"
            EnableBackgroundColor="true" Layout="VBox" BoxConfigAlign="Middle" BoxConfigChildMargin="0 0 10 0 "
            BoxConfigPadding="5px" BoxConfigPosition="Start">
            <Items>
                <%--1--%>
                <x:Panel ID="Panel2" Title="Panel2" runat="server" Height="150px" Width="750px" EnableBackgroundColor="true"
                    ShowBorder="True" ShowHeader="True">
                </x:Panel>
                <%--2--%>
                <x:Panel ID="Panel3" Title="Panel3" runat="server" BoxFlex="1" Width="750px" EnableBackgroundColor="true"
                    ShowBorder="True" ShowHeader="True">
                </x:Panel>
                <%--3--%>
                <x:Panel ID="Panel4" Title="Panel4" runat="server" BoxFlex="1" Width="750px" EnableBackgroundColor="true"
                    ShowBorder="True" ShowHeader="True">
                </x:Panel>
                <%--4--%>
                <x:Panel ID="Panel5" Title="Panel5" runat="server" BoxFlex="1" Width="750px" EnableBackgroundColor="true"
                    ShowBorder="True" ShowHeader="True">
                </x:Panel>
            </Items>
        </x:Panel>
    </form>
</body>
</html>
