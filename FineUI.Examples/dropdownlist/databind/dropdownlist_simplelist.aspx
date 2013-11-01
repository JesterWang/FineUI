<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_simplelist.aspx.cs"
    Inherits="FineUI.Examples.dropdownlist.dropdownlist_simplelist" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../../css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <x:PageManager ID="PageManager1" runat="server" />
        <x:SimpleForm ID="SimpleForm1" BodyPadding="5px" runat="server" Width="450px" EnableFrame="true" EnableCollapse="true"
            ShowBorder="True" Title="简单表单" ShowHeader="True">
            <Items>
                <x:DropDownList runat="server" ID="DropDownList1">
                </x:DropDownList>
                <x:Button ID="btnSelectItem6" Text="选中“选项 6”" runat="server" OnClick="btnSelectItem6_Click"
                    CssClass="inline">
                </x:Button>
                <x:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </x:Button>
                <x:Label runat="server" ID="labResult">
                </x:Label>
            </Items>
        </x:SimpleForm>
        <br />
        <br />
    </form>
</body>
</html>
