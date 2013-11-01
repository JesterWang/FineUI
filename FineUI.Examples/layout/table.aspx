﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="table.aspx.cs" Inherits="FineUI.Examples.layout.table" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        table.x-table-layout td {
            padding: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <x:PageManager ID="PageManager1" runat="server" />
        <x:Panel ID="Panel2" runat="server" Height="450px" Width="850px" ShowBorder="True" EnableFrame="true" EnableCollapse="true"
            Layout="Table" TableConfigColumns="3" ShowHeader="True" Title="面板（Height=450px Width=750px Layout=Table）">
            <Items>
                <x:Panel ID="Panel1" Title="Panel1" Width="300px" Height="210px"
                    TableRowspan="2" runat="server" BodyPadding="5px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <x:Label ID="Label1" runat="server" Text="Width=300px Height=210px TableRowspan=2">
                        </x:Label>
                    </Items>
                </x:Panel>
                <x:Panel ID="Panel3" Title="Panel2" Width="430px" Height="100px"
                    TableColspan="2" runat="server" BodyPadding="5px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <x:Label ID="Label2" runat="server" Text="Width=430px Height=100px TableColspan=2">
                        </x:Label>
                    </Items>
                </x:Panel>
                <x:Panel ID="Panel4" Title="Panel3" Width="200px" Height="100px"
                    runat="server" BodyPadding="5px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <x:Label ID="Label3" runat="server" Text="Width=200px Height=100px">
                        </x:Label>
                    </Items>
                </x:Panel>
                <x:Panel ID="Panel5" Title="Panel4" Width="220px" Height="100px"
                    runat="server" BodyPadding="5px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <x:Label ID="Label4" runat="server" Text="Width=220px Height=100px">
                        </x:Label>
                    </Items>
                </x:Panel>
                <x:Panel ID="Panel6" Title="Panel5" Width="300px" Height="100px"
                    runat="server" BodyPadding="5px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <x:Label ID="Label5" runat="server" Text="Width=300px Height=100px">
                        </x:Label>
                    </Items>
                </x:Panel>
                <x:Panel ID="Panel7" Title="Panel6" Width="200px" Height="100px"
                    runat="server" BodyPadding="5px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <x:Label ID="Label6" runat="server" Text="Width=200px Height=100px">
                        </x:Label>
                    </Items>
                </x:Panel>
                <x:Panel ID="Panel8" Title="Panel6" Width="220px" Height="100px"
                    runat="server" BodyPadding="5px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <x:Label ID="Label7" runat="server" Text="Width=220px Height=100px">
                        </x:Label>
                    </Items>
                </x:Panel>
            </Items>
        </x:Panel>
    </form>
</body>
</html>